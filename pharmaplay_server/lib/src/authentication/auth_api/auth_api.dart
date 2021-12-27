import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/authentication/authentication_repository/auth_repos.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/user/user_repository/user_repo.dart';
import 'package:pharmaplay_server/src/utilites/error_response.dart';

class AuthApi {
  String authStore;
  String secret;
  TokenService tokenService;
  DB db;
  AuthApi(this.db, this.authStore, this.secret, this.tokenService);

// TODO

  Router get router {
    final router = Router();
    // =============== authraize /register route ===========================//

    router.post('/register', (Request req) async {
      final payload = await req.readAsString();
      final userRequestInfo = json.decode(payload);
      print(userRequestInfo);
      var resault =
          createUserWithVerifcationCode(userRequestInfo, db, authStore);
      return (resault);
    });
    //============= Resend Verifiy Code =================//

    router.post('/resendcode', (Request req) async {
      final payload = await req.readAsString();
      final userRequestInfo = json.decode(payload);
      print(userRequestInfo);
      var resault = resendVerificationCode(userRequestInfo, db, authStore);
      return (resault);
    });

    //=============== authraize /LOGiN route

    router.post('/login', (Request req) async {
      print('----------Start Login REquest -------------');
      final payload = await req.readAsString();
      final userRequestInfo = json.decode(payload);

      var resault =
          await userLogin(userRequestInfo, db, authStore, tokenService);
      return (resault);
    });

// ================== authrizee / logout  route   ====================//
    router.post('/logout', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }
      final auth = req.context['authDetails'];

      var resault = await userLogout(auth, authStore, db, tokenService);
      return resault;
    });

// ================== authrizee / logout All Other Sessions  route ================//
    router.post('/logout/othersessions', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }

      final auth = req.context['authDetails'];
      final userId = ((auth as JWT)).subject.toString();

//---change status to logedin

      try {
        final tokenId = ((auth as JWT)).jwtId.toString();

        await tokenService.removeOtherRefreshTokenByUserId(tokenId, userId);
      } catch (e) {
        return Response.internalServerError(
            body: responseErrMsg(
                'There was an issue logging others out. Please check and try again',
                "199991"));
      }

      return Response.ok(responseErrMsg(
          "Successfully Loggedout other  sessions  for User  ", "200"));
    });

// ================== authrizee / logout All Sessions  route ================//
    router.post('/logout/allsessions', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }

      final auth = req.context['authDetails'];
      final userId = ((auth as JWT)).subject.toString();

//---change status to logedin
      try {
        await changeUserStatus(userId, UserStatus.loggedOut, authStore, db);
      } catch (e) {
        return Response.internalServerError(
            body: responseErrMsg(
                'There was a problem change status to  loggedOut. Please try again. ${e.toString()}',
                '199991'));
      }

      try {
        print('iiiiiiiiiiiiiiiiiiiiiii    subject   rrrrrrrrrrrr:  $userId');

        await tokenService.removeAllRefreshTokenByUserId(userId);
      } catch (e) {
        return Response.internalServerError(
            body: responseErrMsg(
                "There was an issue logging out. Please check and try again.",
                '199991'));
      }

      return Response.ok(responseErrMsg(
          "Successfully Loggedout from All USer sessions  ", "200"));
    });

    ///----------------------- Change PAssword  ----------/

    router.post('/password/change', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }
      final payload = await req.readAsString();

      final Map<String, dynamic> userInfo = json.decode(payload);
      print(userInfo);

      final auth = req.context['authDetails'];
      final userId = ((auth as JWT)).subject.toString();
      if (userInfo['password'] == null) {
        return Response.forbidden(
            responseErrMsg(" New PAssword need to be provided!!.", "403"));
      }
      User oldUserInfo = await findUserByID(userId, db, authStore);

      final newPassword =
          hashPassword(userInfo['password'].toString(), oldUserInfo.salt);

      List<Map<String, dynamic>> paramslist = [];
      List<String> sqllist = [];

      sqllist.add(
          'UPDATE pharmaplay.$authStore SET password = @password  WHERE id = @userid ');
      paramslist.add({"userid": userId, "password": newPassword});
      print(userId);

      print(sqllist);

      var resault = 0;
      try {
        resault = await db.mutliTransaction(sqllist, paramslist);
      } catch (err) {
        print(err.toString());
        rethrow;
      }
      if (resault == 0) {
        throw ('No Password  Changed!!!');
      } else {
        return Response.ok(responseErrMsg(
            "Successfully password Changed  you may need to signout All USer sessions  ",
            "200"));
      }
    });

    ///----------------------- reset  PAssword By Email  ----------/

    router.post('/password/reset', (Request req) async {
      final payload = await req.readAsString();

      if (payload.isEmpty) {
        return Response.forbidden(
            responseErrMsg(' Please provide your email     ', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }

      final Map<String, dynamic> userInfo = json.decode(payload);
      print(userInfo);

      String userEmail = userInfo['email'];

      // Ensure email and password fields are present
      if (userEmail == null || userEmail.isEmpty) {
        return Response.forbidden(
            responseErrMsg(' Please provide your email     ', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }
      if (!EmailValidator.validate(userEmail)) {
        return Response.forbidden(
            responseErrMsg(' Please provide a vaild  Email ', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }

      User oldUserInfo; // = await findUserByEmail(userEmail, db, authStore);

      try {
        oldUserInfo = await findUserByEmail(userEmail, db, authStore);

        print("founded_user------:" + userInfo.toString());
      } catch (err) {
        return Response.forbidden(responseErrMsg("$err", "9004"), headers: {
          'content-type': 'application/json',
        });
      }
      final randomPasswd = RandomCode.randomdString(8);
      print(randomPasswd);
      final newPassword = hashPassword(randomPasswd, oldUserInfo.salt);

      List<Map<String, dynamic>> paramslist = [];
      List<String> sqllist = [];

      sqllist.add(
          'UPDATE pharmaplay.$authStore SET password = @password  WHERE id = @userid ');
      paramslist.add({"userid": oldUserInfo.id, "password": newPassword});

      print(sqllist);

      var resault = 0;
      try {
        resault = await db.mutliTransaction(sqllist, paramslist);
      } catch (err) {
        print(err.toString());
        rethrow;
      }
      if (resault == 0) {
        throw ('No Password  Changed!!!');
      } else {
        try {
          await sendVrandomPasswdByMail(randomPasswd, userEmail);
        } catch (err) {
          print(err.toString());
          rethrow;
        }

        return Response.ok(responseErrMsg(
            "Successfully password reseted and cent to you By Email    Go and SignIn now with new passwd ",
            "200"));
      }
    });

// ================== Sessions RElated to users /sessions/   route
    router.post('/sessions', (Request req) async {
      dynamic result;
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }
      final auth = req.context['authDetails'];
      try {
        final userId = ((auth as JWT)).subject.toString();

        result = await tokenService.AllRefreshTokenByScanUserId(userId);
      } catch (err) {
        return Response.internalServerError(
            body: responseErrMsg(
                "There was an issue getting sessions  out $err. Please check and try again.",
                "199991"));
      }

      //var json1 = json.encode(result.toString());
      return Response.ok(result.toString(), headers: {
        'content-type': 'application/json',
      });
      //return Response.ok(json.encode(result));
    });

// ================== authrizee / Unrigster   route
    router.post('/unregister/', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            responseErrMsg(' Not authorised to perform this operation.', "403"),
            headers: {
              'content-type': 'application/json',
            });
      }
      final auth = req.context['authDetails'];
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      var resault =
          await userunRegister(auth, authDetails, authStore, db, tokenService);
      return resault;
    });

//  ================ authreize / refresh token route

    router.post('/refreshToken', (Request req) async {
      // sdfsdfsdfsdfsd
      final payload = await req.readAsString();
      print(payload);
      final payloadMap = json.decode(payload);

      print('Request refreshToken ' + payloadMap['refreshToken'].toString());

      final token = verifyJwt(payloadMap['refreshToken'], secret);
      if (token == null) {
        return Response(400,
            body: responseErrMsg('Refresh token is not valid.', '400'));
      }

//-----------------
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      final userId = authDetails.subject.toString();
      print(userId);
//----------------
      final dbToken = await tokenService.getRefreshToken(
          (token as JWT).jwtId.toString(), userId);
      if (dbToken == null) {
        return Response(400,
            body: responseErrMsg('Refresh token is not recognised.', '400'));
      }

      // Generate new token pair
      final oldJwt = (token as JWT);
      //final userId = (token as JWT).subject.toString();
      try {
        await tokenService.removeRefreshToken(
            (token as JWT).jwtId.toString(), userId);

        final tokenPair =
            await tokenService.createTokenPair(oldJwt.subject.toString());

        final Map<String, dynamic> tokenInfo = {
          "tokenInfo": {
            "tokenId": tokenPair.tokenId,
            "refreshToken": tokenPair.refreshToken
          },
          "requestResult": {
            "error": "Suucess",
            "errNO": "200",
          }
        };
        return Response.ok(
          json.encode(tokenInfo),
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          },
        );
      } catch (e) {
        return Response.internalServerError(
            body: responseErrMsg(
                "There was a problem creating a new token.(${e.toString()}) Please try again.",
                "199991"));
      }
    });

    return router;
  }
}

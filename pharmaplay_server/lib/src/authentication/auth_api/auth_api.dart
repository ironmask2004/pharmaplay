import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/authentication/authentication_repository/auth_repos.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';

class AuthApi {
  String authStore;
  String secret;
  TokenService tokenService;
  DB db;
  AuthApi(this.db, this.authStore, this.secret, this.tokenService);

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
    router.post('/resendcode', (Request req) async {
      final payload = await req.readAsString();
      final userRequestInfo = json.decode(payload);
      print(userRequestInfo);
      var resault = resendVerificationCode(userRequestInfo, db, authStore);
      return (resault);
    });

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
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }
      final auth = req.context['authDetails'];

      var resault = await userLogout(auth, authStore, db, tokenService);
      return resault;
    });

// ================== authrizee / logout All Sessions  route ================//
    router.post('/logout/allsessions', (Request req) async {
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }

      final auth = req.context['authDetails'];
      if (auth == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }

      final userId = ((auth as JWT)).subject.toString();

//---change status to logedin
      try {
        await changeUserStatus(userId, UserStatus.loggedOut, authStore, db);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \" There was a problem change status to  loggedOut. Please try again.\" ' +
                    e.toString() +
                    '\" , \"errorNo\" : \"199991\" }');
      }

//---

      try {
        print('iiiiiiiiiiiiiiiiiiiiiii    subject   rrrrrrrrrrrr:  $userId');

        await tokenService.removeAllRefreshTokenByUserId(userId);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \"There was an issue logging out. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
      }

      return Response.ok(
          '{ \"error\" : \"Successfully Loggedout from All USer sessions  \"   ,  \"errorNo\" : \"200\" }');
    });

// ================== Sessions RElated to users /sessions/   route
    router.post('/sessions', (Request req) async {
      dynamic result;
      if (req.context['authDetails'] == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }
      final auth = req.context['authDetails'];
      try {
        final userId = ((auth as JWT)).subject.toString();

        result = await tokenService.AllRefreshTokenByScanUserId(userId);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \"There was an issue getting sessions  out $e. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
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
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
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
      final payload = await req.readAsString();
      print(payload);
      final payloadMap = json.decode(payload);

      print(payloadMap['refreshToken'].toString());

      final token = verifyJwt(payloadMap['refreshToken'], secret);
      if (token == null) {
        return Response(400, body: 'Refresh token is not valid.');
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
        return Response(400, body: 'Refresh token is not recognised.');
      }

      // Generate new token pair
      final oldJwt = (token as JWT);
      //final userId = (token as JWT).subject.toString();
      try {
        await tokenService.removeRefreshToken(
            (token as JWT).jwtId.toString(), userId);

        final tokenPair =
            await tokenService.createTokenPair(oldJwt.subject.toString());
        return Response.ok(
          json.encode(tokenPair.toJson()),
          headers: {
            HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          },
        );
      } catch (e) {
        return Response.internalServerError(
            body:
                "{ \"error\" : \"'There was a problem creating a new token. Please try again.'\"   ,  \"errorNo\" : \"199991\" }" +
                    e.toString());
      }
    });

    return router;
  }
}

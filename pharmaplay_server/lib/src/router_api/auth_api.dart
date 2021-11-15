import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';

class AuthApi {
  String authStore;
  String secret;
  TokenService tokenService;
  DB db;
  AuthApi(this.db, this.authStore, this.secret, this.tokenService);

  Router get router {
    final router = Router();
    // =============== authraize /register route

    router.post('/register', (Request req) async {
      final payload = await req.readAsString();
      final userInfo = json.decode(payload);
      print(userInfo);
      final email = userInfo['email'];
      final password = userInfo['password'];
      final firstname = userInfo['firstname'];
      final lastname = userInfo['lastname'];
      final mobile = userInfo['mobile'];

      // Ensure email and password fields are present
      if (email == null ||
          email.isEmpty ||
          password == null ||
          password.isEmpty) {
        // return Response(HttpStatus.badRequest,
        // body: 'Please provide your email and password');

        return Response.forbidden(
            "{ \"error\" : \"Please provide your email and password \" ,  \"errorNo\" : \"403\"  }");
      }

      print(firstname);
      print(lastname);
      if (firstname == null ||
          firstname.isEmpty ||
          lastname == null ||
          lastname.isEmpty) {
        return Response.forbidden(
            "{ \"error\" : \"Please provide your firstname and lastname \" ,  \"errorNo\" : \"403\"  }");
      }

      if (mobile == null || mobile.isEmpty) {
        return Response.forbidden(
            "{ \"error\" : \"Please provide your Mobile Number!! \" ,  \"errorNo\" : \"403\"  }");
      }
      String sql =
          "SELECT idx  FROM pharmaplay.$authStore WHERE email =  @email ";
      Map<String, dynamic> params = {"email": email};
      dynamic resultSet = await db.query(sql, values: params);

      if (resultSet.length > 0) {
        return Response.forbidden(
            "{ \"error\" : \"Email:  $email  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
      }

      sql =
          "SELECT idx  FROM pharmaplay.$authStore WHERE firstname= @firstname and lastname =  @lastname ";
      params = {"firstname": firstname, "lastname": lastname};
      resultSet = await db.query(sql, values: params);

      if (resultSet.length > 0) {
        return Response.forbidden(
            "{ \"error\" : \"User name:  $firstname $lastname  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
      }

      sql = "SELECT idx  FROM pharmaplay.$authStore WHERE mobile =  @mobile ";
      params = {"mobile": mobile};
      resultSet = await db.query(sql, values: params);

      if (resultSet.length > 0) {
        return Response.forbidden(
            "{ \"error\" : \"mobile Number:  $mobile  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
      }

      final id = ObjectId().toString();
      final salt = generateSalt();
      final hashedPassword = hashPassword(password, salt);
      try {
        sql =
            "insert into  pharmaplay.$authStore (firstname,lastname, id, email, password,salt,mobile, createdate, updatedate) values (@firstname,@lastname, @id, @email, @password,@salt , @mobile ,  @createdate, @updatedate ) returning idx";
        params = {
          "firstname": firstname,
          "lastname": lastname,
          "id": id,
          "email": email,
          "password": hashedPassword,
          "salt": salt,
          "mobile": mobile,
          "createdate": DateTime.now().millisecondsSinceEpoch,
          "updatedate": DateTime.now().millisecondsSinceEpoch
        };
        resultSet = await db.query(sql, values: params);

        print(resultSet.first.toString());
        if (resultSet.length == 0) {
          return Response.forbidden(
              "{ \"error\" : \" facing error while adding user\" ,  \"errorNo\" : \"403\"  }");
        }
      } catch (error) {
        print(' error while adding user  ' + error.toString());
        return Response(HttpStatus.badRequest, body: 'error while adding user');
      }
      return Response.ok(
          "{ \"error\" : \"Successfully registered user\"   ,  \"errorNo\" : \"200\" }");
    });

    //=============== authraize /LOGiN route

    router.post('/login', (Request req) async {
      print('----------Start Login REquest -------------');
      final payload = await req.readAsString();
      final userInfo = json.decode(payload);
      final email = userInfo['email'];
      final password = userInfo['password'];

      // Ensure email and password fields are present
      if (email == null ||
          email.isEmpty ||
          password == null ||
          password.isEmpty) {
        return Response(HttpStatus.badRequest,
            body:
                '"{ \"error\" : \"Please provide your email and password\" }"');
      }

      //final user = await store.findOne(where.eq('email', email));
      String sql =
          "SELECT *  FROM pharmaplay.$authStore WHERE email =  @email ";
      Map<String, dynamic> params = {"email": email};
      dynamic resultSet = await db.query(sql, values: params);

      if (resultSet.length == 0) {
        return Response.forbidden(
            "{ \"error\" : \"Incorrect user  Login\" ,  \"errorNo\" : \"403\"  }");
      }
      print(resultSet.first.toString());

      final user = resultSet.first['$authStore'];
      // User Myuser = User.fromMap(user);

      // print("My userrrrrr: " + Myuser.toString());

      print('fided user :   ======== ');
      print(user.toString());

      final hashedPassword = hashPassword(password, user['salt']);
      if (hashedPassword != user['password']) {
        return Response.forbidden(
            "{ \"error\" : \"Incorrect  password!!\" ,  \"errorNo\" : \"403\"  }");
      }

      ;

      // Generate JWT and send with response
      print('User ID:' + user['id']);
      // final userId = (user['id'] as ObjectId).toHexString();
      final userId = ObjectId.fromHexString(user['id']).toString();
      print('User ID:' + userId);

      try {
        final tokenPair = await tokenService.createTokenPair(userId);
        user['token'] = tokenPair.toJson()['token'];
        user['refreshToken'] = tokenPair.toJson()['refreshToken'];
        user["'error'"] = "\"" + 'Suucess' + "\"";
        user["'errorNo'"] = "\"" + '200' + "\"";

        print('------------------' + user.toString());
        var jsonString = json.encode(user);

        print('-----======================================--' + jsonString);
        return Response.ok(jsonString, headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        });
      } catch (e) {
        print('----------end Login Request--------------');

        return Response.internalServerError(
            body:
                '{ \"error\" : \" There was a problem logging you in. Please try again.\" ' +
                    e.toString() +
                    '\" , \"errorNo\" : \"199991\" }');
      }
    });

// ================== authrizee / logout  route
    router.post('/logout', (Request req) async {
      final auth = req.context['authDetails'];
      if (auth == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }

      try {
        final userId = ((auth as JWT)).subject.toString();
        print('iiiiiiiiiiiiiiiiiiiiiii    subject   rrrrrrrrrrrr:  $userId');

        await tokenService.removeRefreshToken(
            ((auth as JWT)).jwtId.toString(), userId);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \"There was an issue logging out. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
      }

      return Response.ok(
          '{ \"error\" : \"Successfully Loggedout user\"   ,  \"errorNo\" : \"200\" }');
    });

// ================== authrizee / Unrigster   route
    router.post('/unregister/', (Request req) async {
      final auth = req.context['authDetails'];
      if (auth == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }

      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      try {
//-----------
        final String id = authDetails.subject.toString();
        String sql =
            "delete  FROM pharmaplay.$authStore WHERE id =  @id returning 1 ";
        Map<String, dynamic> params = {"id": id};
        dynamic resultSet = await db.query(sql, values: params);

        if (resultSet.length == 0) {
          return Response.forbidden(
              "{ \"error\" : \"Failed to remove user\" ,  \"errorNo\" : \"403\"  }");
        }
        print(resultSet.first.toString());
//------------
        final userId = ((auth as JWT)).subject.toString();
        await tokenService.removeRefreshTokenByUserId(userId);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \"There was an issue unregistering  user. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
      }

      return Response.ok(
          '{ \"error\" : \"Successfully Unrigested  user \"   ,  \"errorNo\" : \"200\" }');
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

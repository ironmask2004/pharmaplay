import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';

class AuthApi {
  String store;
  String secret;
  TokenService tokenService;
  DB db;
  AuthApi(this.db, this.store, this.secret, this.tokenService);

  Router get router {
    final router = Router();

    router.post('/register', (Request req) async {
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
            body: 'Please provide your email and password');
      }

      // Ensure user is unique
      //final user = await store_findOne(where.eq('email', email));
      print(db.toString());
      dynamic resultSet =
          db.query('SELECT id FROM Users WHERE email = \"' + email + '\"');
      if (resultSet.length > 0) {
        return Response(HttpStatus.badRequest, body: 'User already exists');
      }

      // Create user
      //final authDetails = req.context['authDetails'] as JWT;
      //print (authDetails.subject.toString());
      final id = ObjectId().toString();
      final salt = generateSalt();
      final hashedPassword = hashPassword(password, salt);
      try {
        var stmt = db.query(
            'INSERT INTO Users (email, password,salt,id ) VALUES (?,?,?, ?)');

        //stmt.execute([email, hashedPassword, salt, id]);

        //  stmt.dispose();
      } catch (error) {
        print(' error while adding user  ' + error.toString());
        return Response(HttpStatus.badRequest, body: 'error while adding user');
      }
      return Response.ok(
          "{ \"error\" : \"Successfully registered user\"   ,  \"errorNo\" : \"200\" }");
    });

    ///------ LOGiN
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
      final dynamic resultSet =
          db.query('SELECT *  FROM Users WHERE email = \"' + email + "\"");
      if (resultSet.isEmpty) {
        return Response.forbidden(
            "{ \"error\" : \"Incorrect user and/or password\" ,  \"errorNo\" : \"403\"  }");
      }
      print(resultSet.first.toString());
      final user = ({
        'id': resultSet.first['id'],
        'email': resultSet.first['email'],
        'password': resultSet.first['password'],
        'salt': resultSet.first['salt']
      });
      // final user = resultSet.toList ();
      print(user.toString());

      final hashedPassword = hashPassword(password, user['salt']);
      if (hashedPassword != user['password']) {
        return Response.forbidden(
            "{ \"error\" : \"Incorrect user and/or password\" ,  \"errorNo\" : \"403\"  }");
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
        print(tokenPair.toJson().toString());
        user["'error'"] = "\"" + 'Suucess' + "\"";
        user["'errorNo'"] = "\"" + '200' + "\"";
        print("==============================" + user.toString());

        return Response.ok(json.encode(user), headers: {
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

    router.post('/logout', (Request req) async {
      final auth = req.context['authDetails'];
      if (auth == null) {
        return Response.forbidden(
            '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
      }

      try {
        await tokenService.removeRefreshToken(((auth as JWT)).jwtId.toString());
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \"There was an issue logging out. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
      }

      return Response.ok(
          '{ \"error\" : \"Successfully Loggedout user\"   ,  \"errorNo\" : \"200\" }');
    });

    router.post('/refreshToken', (Request req) async {
      final payload = await req.readAsString();
      print(payload);
      final payloadMap = json.decode(payload);

      print(payloadMap['refreshToken'].toString());

      final token = verifyJwt(payloadMap['refreshToken'], secret);
      if (token == null) {
        return Response(400, body: 'Refresh token is not valid.');
      }

      final dbToken =
          await tokenService.getRefreshToken((token as JWT).jwtId.toString());
      if (dbToken == null) {
        return Response(400, body: 'Refresh token is not recognised.');
      }

      // Generate new token pair
      final oldJwt = (token as JWT);
      try {
        await tokenService.removeRefreshToken((token as JWT).jwtId.toString());

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

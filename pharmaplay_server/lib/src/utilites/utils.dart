import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/utilites/config.dart';
import 'package:pharmaplay_server/src/utilites/token_service.dart';
import 'package:shelf/shelf.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

Middleware handleCors() {
  const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS"
  };

  return createMiddleware(
    requestHandler: (Request request) {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: corsHeaders);
      }
      return null;
    },
    responseHandler: (Response response) {
      return response.change(headers: corsHeaders);
    },
  );
}

String generateSalt([int length = 32]) {
  final rand = Random.secure();
  final saltBytes = List<int>.generate(length, (_) => rand.nextInt(256));
  return base64.encode(saltBytes);
}

String hashPassword(String password, String salt) {
  final codec = Utf8Codec();
  final key = codec.encode(password);
  final saltBytes = codec.encode(salt);
  final hmac = Hmac(sha256, key);
  final digest = hmac.convert(saltBytes);
  return digest.toString();
}

String generateJwt(
  String subject,
  String issuer,
  String secret, {
  required String jwtId,
  Duration expiry = const Duration(seconds: 4333),
}) {
  final jwt = JWT(
    {
      'iat': DateTime.now().millisecondsSinceEpoch,
    },
    subject: subject,
    issuer: issuer,
    jwtId: jwtId,
  );
  return jwt.sign(SecretKey(secret), expiresIn: expiry);
}

dynamic verifyJwt(String token, String secret) {
  try {
    final jwt = JWT.verify(token, SecretKey(secret));
    return jwt;
  } on JWTExpiredError catch (err0) {
    // TODO Handle error
    print('JWTExpiredError' + err0.toString());
  } on JWTError catch (err) {
    // TODO Handle error
    print('JWTError' + err.toString());
  }
}

Middleware handleAuth(String secret, TokenService tokenService) {
  return (Handler innerHandler) {
    return (Request request) async {
      final authHeader = request.headers['authorization'];
      print('===============aaaaaaaaaaaaaaaaaaa========' +
          request.headers['authorization'].toString());
      var token, jwt;

      if (authHeader != null && authHeader.startsWith('Bearer')) {
        token = authHeader.substring(7);
        jwt = verifyJwt(token, secret);

//---------------------
        if (jwt != null) {
          //   final Env sysEnv = Env();
          //var refreshtoken = authHeader.substring(7);
          //  final tokenService =
          //       TokenService(RedisConnection(), sysEnv.secretKey);
          final dbToken =
              await tokenService.getRefreshToken((jwt as JWT).jwtId.toString());

//------------------
          if (dbToken == null) {
            jwt = null;
          }
        }
      }

      final updatedRequest = request.change(context: {
        'authDetails': jwt,
      });
      return await innerHandler(updatedRequest);
    };
  };
}

Middleware checkAuthorisation() {
  return createMiddleware(
    requestHandler: (Request request) {
      print('----------rrrrrrrrrrrrrrrrr----------------' +
          request.context['authDetails'].toString());
      if (request.context['authDetails'] == null) {
        //return Response.forbidden('Not authorised to perform this action.');
        return Response.forbidden(
            "{ \"error\" : \"Not authorised to perform this action\"   ,  \"errorNo\" : \"403\" }");
      }
      return null;
    },
  );
}

Handler fallback(String indexPath) => (Request request) {
      final indexFile = File(indexPath).readAsStringSync();
      return Response.ok(indexFile, headers: {'content-type': 'text/html'});
    };

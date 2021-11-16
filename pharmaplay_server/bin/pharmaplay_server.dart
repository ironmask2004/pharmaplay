//11/11/2021

import 'dart:io';
import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/authentication/auth_api/auth_api.dart';
import 'package:pharmaplay_server/src/router_api/static_assets_api.dart';
import 'package:pharmaplay_server/src/user/route_api/user_api.dart';
import 'package:pharmaplay_server/src/utilites/config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

//
/*
app.get('/users/<userName>/whoami', (Request request) async {
  // The matched values can be read with params(request, param)
  var userName = request.params['userName'];
  return Response.ok('You are ${userName}');
});

*/

void main(List<String> args) async {
  /// TODO   Run DynDns Script
  print(' ===========Dont forget to Run Dyndns Script========= ');

  final Env sysEnv = Env();
  final tokenService = TokenService(RedisConnection(), sysEnv.secretKey);

  print(sysEnv.redisPort);
  await tokenService.start(sysEnv.redisHost, sysEnv.redisPort);
  print('Token Service running...');

  //var db_api = dbSqlite_api(sysEnv);   print('Connected to our database');
  var dbApi = DBPGsqlAPI(sysEnv);
  await dbApi.initdb();
  print(dbApi.db);
  print('Connected to our database');
  // Configure a pipeline that logs requests.
  //final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  final authStore = 'users000';
  final app = Router()
    ..mount('/auth/',
        AuthApi(dbApi.db, authStore, sysEnv.secretKey, tokenService).router)
    ..mount('/users/', UserApi(dbApi.db, authStore).router)
    ..mount('/assets/', StaticAssetsApi('public').router)
    ..all('/<name|.*>', fallback('public/index.html'));

  final _handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(handleCors())
      .addMiddleware(handleAuth(sysEnv.secretKey, tokenService))
      .addHandler(app);

  // For running in containers, we respect the PORT environment variable.

  final server = await serve(_handler, sysEnv.serverHost, sysEnv.serverPort);
  print('Server listening on port ${server.address.host}:${server.port}');
}

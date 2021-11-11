//11/11/2021

import 'dart:io';
import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/router_api/auth_api.dart';
import 'package:pharmaplay_server/src/router_api/static_assets_api.dart';
import 'package:pharmaplay_server/src/router_api/user_api.dart';
import 'package:pharmaplay_server/src/utilites/config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  // final message = params(request, 'message');
  final message = request.params['message'];
  return Response.ok('$message\n');
}

/*
app.get('/users/<userName>/whoami', (Request request) async {
  // The matched values can be read with params(request, param)
  var userName = request.params['userName'];
  return Response.ok('You are ${userName}');
});

*/

void main(List<String> args) async {
  final Env sysEnv = Env();
  final tokenService = TokenService(RedisConnection(), sysEnv.secretKey);

  await tokenService.start(sysEnv.redisHost, sysEnv.redisPort);
  print('Token Service running...');

  //   var dbSqlite_api1 = dbSqlite_api(dbname);   print('Connected to our database');

  // Configure a pipeline that logs requests.
  //final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  final authStore = 'users';
  final app = Router();
  app.mount(
      '/auth/',
      AuthApi(dbSqlite_api1.MyDatabase, authStore, sysEnv.secretKey,
              tokenService)
          .router);
  app.mount('/users/', UserApi(dbSqlite_api1.MyDatabase, authStore).router);
  app.mount('/assets/', StaticAssetsApi('public').router);
  app.all('/<name|.*>', fallback('public/index.html'));

  final _handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(handleCors())
      .addMiddleware(handleAuth(sysEnv.secretKey))
      .addHandler(app);

  // For running in containers, we respect the PORT environment variable.

  final server = await serve(_handler, sysEnv.serverHost, sysEnv.serverPort);
  print('Server listening on port ${server.address.host}:${server.port}');
}


/*


import 'package:spa_server/spa_server.dart';

void main(List<String> arguments) async {
  const secret = Env.secretKey;
  const port = Env.serverPort;
  const dbname = Env.sqliteName;
  const serverHost = Env.serverHost;
  const serverPort = Env.serverPort;

  final tokenService = TokenService(RedisConnection(), secret);

  //await db.openDB();
  // open the database
  //Future<Database> database= openDB();
  var dbSqlite_api1 = dbSqlite_api(dbname);

  print('Connected to our database');

  await tokenService.start(Env.redisHost, int.parse(Env.redisPort));
  print('Token Service running...');

  final store = 'users';
  final app = Router();
  app.mount('/auth/',
      AuthApi(dbSqlite_api1.MyDatabase, store, secret, tokenService).router);
  app.mount('/users/', UserApi(dbSqlite_api1.MyDatabase, store).router);
  app.mount('/assets/', StaticAssetsApi('public').router);
  app.all('/<name|.*>', fallback('public/index.html'));

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(handleCors())
      .addMiddleware(handleAuth(secret))
      .addHandler(app);

  print('HTTP Service running on  $serverHost port $port');
  await serve(handler, serverHost, int.parse(serverPort));

  //await serve(app, 'localhost', int.parse(serverPort));
}

*/
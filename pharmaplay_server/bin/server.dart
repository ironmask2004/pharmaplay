//11/11/2021

import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

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
  load(); //env load
  print('read all vars? ${isEveryDefined(['APP_NAME', 'HOME'])}');

  print('value of APP_NAME is ${env['APP_NAME']}');

  print('your PHARMAPLAY_HOST directory is: ${env['PHARMAPLAY_HOST']}');

  clean(); //env clean

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = Platform.environment['PHARMAPLAY_HOST'] ?? InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PHARMAPLAY_PORT'] ?? '9093');

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.

  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.address.host}:${server.port}');
}

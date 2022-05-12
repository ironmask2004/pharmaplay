import 'package:dotenv/dotenv.dart';

class Env {
  late final String serverHost;
  late final int serverPort;
  late final String baseUrl;

  Env() {
//! dotenv package : adding .env file  to platform.environment
    var env = DotEnv(includePlatformEnvironment: true)..load();

    serverPort = int.parse(env['serverPort'] ?? '9093');
    serverHost = env['serverHost'] ?? 'localhost';
    baseUrl = env['baseUrl'] ?? 'pharmaplay.mywire.org:9093';
    env.clear(); //env clean
  }
}

/*
! .env file

 
serverPort = '9091'
serverHost = 'pharmaplay.mywire.org'
baseUrl =  'pharmaplay.mywire.org:9093'
 
*/

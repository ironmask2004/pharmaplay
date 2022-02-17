import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

class Env {
  late final String serverHost;
  late final int serverPort;
  late final String baseUrl;

  Env() {
//! dotenv package : adding .env file  to platform.environment
    load(); //env load

    serverPort = int.parse(env['serverPort'] ?? '9093');
    serverHost = env['serverHost'] ?? 'localhost';
    baseUrl = env['baseUrl'] ?? 'pharmaplay.mywire.org:9093';
    clean(); //env clean
  }
}

/*
! .env file

 
serverPort = '9091'
serverHost = 'pharmaplay.mywire.org'
baseUrl =  'pharmaplay.mywire.org:9093'
 
*/

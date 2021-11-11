import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

class Env {
  late final String secretKey;
  late final String dbName;
  late final String redisHost;
  late final int redisPort;
  late final int serverPort;
  late final String serverHost;
  late final int dbServerPort;
  late final String dbServerHost;

  Env() {
//! dotenv package : adding .env file  to platform.environment
    load(); //env load
    secretKey = env['secretKey'] ?? '25BBD3FF-975D-4D45-8FFF-B3FA92155CFF';
    dbName = env['dbName'] ?? 'pharmadb';
    redisHost = env['redisHost'] ?? 'localhost';
    redisPort = int.parse(env['redisPort'] ?? '5432');
    serverPort = int.parse(env['serverPort'] ?? '9093');
    serverHost = env['serverHost'] ?? 'localhost';
    dbServerPort = int.parse(env['dbServerPort'] ?? '5432');
    dbServerHost = env['dbServerHost'] ?? 'localhost';
    clean(); //env clean
  }
}




/*
APP_NAME='PharmaPlay Server'
secretKey = '25BBD3DF-975D-4D45-8FDF-B3FA92155CDF'
dbName = 'pharmadb'
serverPort = '9093'
serverHost = 'pharmaplay.mywire.org'
dbServerPort = '5432'
dbServerHost = 'pharmaplay.mywire.org'
redisHost = 'pharmaplay.mywire.org'
redisPort = '6379'
*/
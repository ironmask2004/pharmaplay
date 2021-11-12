import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/utilites/config.dart';

import 'package:postgres/postgres.dart';

class DB {
  late PostgreSQLConnection _connection;
  late final Env _sysEnv;

  static Future<DB> connect(Env sysEnv) async {
    final int _port = sysEnv.dbServerPort;
    final String _host = sysEnv.dbServerHost;
    final String _user = sysEnv.dbUser;
    final String _pass = sysEnv.dbPassword;
    final String _name = sysEnv.dbName;

    DB db = DB();
    db._sysEnv = sysEnv;
    print('$_host  $_port  $_name     $_user   $_pass ');

    db._connection = PostgreSQLConnection(_host, _port, _name,
        username: _user, password: _pass);

    await db._connection.open();

    print('db connect');
    var usersList = await db.testConn();
    for (var element in usersList) {
      print(element);
    }
    return db;
  }

  Future<List<dynamic>> query(String sql,
      {Map<String, dynamic>? values}) async {
    try {
      return await _connection.mappedResultsQuery(sql,
          substitutionValues: values);
    } catch (e) {
      print(e.toString());
      return Future.value([]);
    }
  }

  @override
  String toString() => (' DBNAME:  ' +
      _sysEnv.dbName +
      ' DBuser:  ' +
      _sysEnv.dbUser +
      ' Host: ' +
      _sysEnv.dbServerHost +
      ' Port :' +
      _sysEnv.dbServerPort.toString() +
      ' Connection Info:' +
      _connection.settings.toString());

  Future<List<dynamic>> testConn() async {
    List<Map<String, dynamic>> items = [];
    dynamic result = await query(
        'select idx, email from pharmaplay.users000 ORDER BY idx ASC LIMIT 4 ');

    for (final row in result) {
      items.add(row['users000']);
    }
    return items;
  }
}

class DBPGsqlAPI {
  late final Env _sysEnv;
  late DB db;
  DBPGsqlAPI(this._sysEnv);

  initdb() async {
    db = await DB.connect(_sysEnv);
  }

  Future<List<dynamic>> getUsersList() async {
    List<Map<String, dynamic>> items = [];
    dynamic result =
        await db.query('select idx, email from pharmaplay.users000');

    for (final row in result) {
      items.add(row['users000']);
    }
    return items;
  }
}

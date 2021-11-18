library authentication_repository;

import 'package:pharmaplay_server/src/repository/database_api.dart';

//----------------------
Future<bool> userVerifcation(
    String id, DB db, String authStore, String verficationCode) async {
  try {
    String sql =
        'SELECT *  FROM pharmaplay.verficationcodes WHERE id =  @id and verficationcode = @verficationcode ';
    print(id);
    Map<String, dynamic> params = {
      "id": id,
      "verficationcode": verficationCode
    };
    print(sql);

    dynamic resultSet = await db.query(sql, values: params);

    if (resultSet.length > 0) {
      sql =
          'DELETE FROM pharmaplay.verficationcodes WHERE id =  @id and verficationcode = @verficationcode ';
      resultSet = await db.query(sql, values: params);

      sql =
          'UPDATE pharmaplay.$authStore SET status = @status WHERE id =  @id ';
      params = {"id": id, "status": 1};
      print(sql);
      resultSet = await db.query(sql, values: params);

      return true;
    } else {
      print(' User with verficationCode: $verficationCode   Not Found ');
      return false;
    }
  } catch (err) {
    print(err.toString());
    rethrow;
  }
}

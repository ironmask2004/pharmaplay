library authentication_repository;

import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/utilites/random_code.dart';

//----------------------
Future<bool> userVerifyCode(
    String userId, DB db, String authStore, String verificationcode) async {
  print('userId: $userId, $db , $authStore   : $verificationcode ');
  try {
    Map<String, dynamic> params = {
      "userid": userId,
      "verificationcode": verificationcode
    };
    String sql =
        'SELECT userid   FROM pharmaplay.verificationcodes  WHERE userid =  @userid  and verificationcode = @verificationcode ';
    print(userId);
    print(params);
    print(sql);

    dynamic resultSet = await db.query(sql, values: params);

    if (resultSet.length > 0) {
      sql =
          'DELETE FROM pharmaplay.verificationcodes WHERE userid =  @userid   and verificationcode = @verificationcode ';
      print(sql);
      resultSet = await db.query(sql, values: params);

      params = {"userid": userId};

      sql =
          'UPDATE pharmaplay.$authStore SET status = @status WHERE id = @userid ';
      params = {"userid": userId, "status": 1};
      print(sql);
      resultSet = await db.query(sql, values: params);

      return true;
    } else {
      print(' User with verificationcode: $verificationcode   Not Found ');
      return false;
    }
  } catch (err) {
    print(err.toString());
    rethrow;
  }
}

//----------------------
Future<String> createUserVerifcationCode(String id, DB db) async {
  String verificationcode = RandomCode.nextInter();
  print(verificationcode);
  Map<String, dynamic> params = {
    "id": id,
    "verificationcode": verificationcode
  };
  try {
    String sql =
        'SELECT verificationcode  FROM pharmaplay.verificationcodes WHERE userid =  @id  ';
    print(id);

    print(sql);

    dynamic resultSet = await db.query(sql, values: params);

    if (resultSet.length > 0) {
      return (resultSet.first['verificationcodes']['verificationcode']);
    }

    //=====
    sql =
        'insert into pharmaplay.verificationcodes ( userid,verificationcode ) values (  @id , @verificationcode  )  returning idx ';
    print(id);

    print(sql);

    resultSet = await db.query(sql, values: params);

    if (resultSet.length > 0) {
      return verificationcode;
    } else {
      print(' Generate Code  User   verfication Erororororo  ');
      throw ('error while generate codes ');
    }
  } catch (err) {
    print(err.toString());
    rethrow;
  }
}

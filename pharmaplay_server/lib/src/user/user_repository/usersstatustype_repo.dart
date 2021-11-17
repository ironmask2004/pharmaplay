/* Future<List<Countries>> getCountries() async {
    List<Map> list = await _db.rawQuery('SELECT * FROM Countries');
    return list.map((countries) => Countries.fromMapObject(countries)).toList();
  }*/

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/user/model/userstatustype.dart';

//----------------------
Future<UserStatusType> getUserStatusTypeByIDx(String idx, DB db) async {
  String sql = "SELECT *  FROM pharmaplay.userstatustype WHERE idx =  @idx ";
  print(idx);
  Map<String, dynamic> params = {"idx": idx};
  //print(sql);
  dynamic resultSet = await db.query(sql, values: params);
  // print(resultSet.first['$authStore']);
  if (resultSet.length > 0) {
    return UserStatusType.fromMap(resultSet.first['userstatustype']);
  } else {
    print(' userstatustype ID($id) Not Found ');
    throw ' userstatustype ID($id) Not Found ';
  }
}

Future<UserStatusTypeList> getAllUserStatusType(DB db) async {
  List<UserStatusType> resultquery = <UserStatusType>[];
  String sql = "SELECT *  FROM pharmaplay.userstatustype  order by statustype ";

  dynamic resultSet = await db.query(sql);
  print(resultSet);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print(element['userstatustype']);
      resultquery.add(UserStatusType.fromMap(element['userstatustype']));
    });
    UserStatusTypeList resultquery1 = UserStatusTypeList(items: resultquery);
    return (resultquery1);
  } else {
    print(' UserStatusTypeList is Empty ');
    throw ' UserStatusTypeList is Empty ';
  }
}

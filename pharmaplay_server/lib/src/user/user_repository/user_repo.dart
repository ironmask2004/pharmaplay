// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';

// !using EITHER
/*
Future<Either<ApiResponse, String>> logOutUser(String userToken) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = new Uri.http(Env.baseUrl, "users/logout");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $userToken'
    };
    print(url.toString() + " Headrs:  " + _headers.toString());
    final client = http.Client();
    final http.Response response = await client.post(url, headers: _headers);
    final _response = response.statusCode;
    print("LLLLLLLLLLLLLLLLLLLLLLogout + error $_response");

    if (_response == 200) {
      // _apiResponse.Data = User.fromJson(response.body);
      _apiResponse.ApiError = ApiError.fromJson(
          {"error": "Get User LogOut Success", "errorNo": "200"});
      return right("Get User LogOut Success");
    } else {
      _apiResponse.ApiError = ApiError(
          error: json.decode(response.body), errorNo: _response.toString());
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(
        error: "Server SocketException error. Please retry",
        errorNo: "1999991");
  }
  return left(_apiResponse);
}
*/

//----------------------

Future<List<User>> findUserByParams(
    DB db, String authStore, Map<String, dynamic> params) async {
  String sql;

//---- params to where condetion
  String whereCond = '';
  params.forEach((k, v) => whereCond =
      (whereCond.isEmpty ? 'WHERE ' : whereCond + ' and ') + '${k} = @${k} ');

//---

  dynamic resultSet;
  sql = 'SELECT *  FROM pharmaplay.$authStore  $whereCond ';
  print(sql + '    ' + params.toString());
  try {
    resultSet = await db.query(sql, values: params);
  } catch (err) {
    throw params.toString() + err.toString();
  }
  print(resultSet);
  List<User> resaultUsers = [];

  for (final row in resultSet) {
    resaultUsers.add(User.fromMap(row[authStore]));
  }

  if (resultSet.length > 0) {
    print(resaultUsers);
    return resaultUsers;
  } else {
    print(params.toString() + '  Not Found ');
    throw params.toString() + '  Not Found ';
  }
}

//----------------------
Future<User> findUserByID(String id, DB db, String authStore) async {
  String sql = "SELECT *  FROM pharmaplay.$authStore WHERE id =  @id ";
  print(id);
  Map<String, dynamic> params = {"id": id};
  print(sql);

  dynamic resultSet = await db.query(sql, values: params);

  print('founded by id: ' + resultSet.first[authStore].toString());

  if (resultSet.length > 0) {
    return User.fromMap((resultSet.first[authStore]));
  } else {
    print(' User ID($id) Not Found ');
    throw ' User ID($id) Not Found ';
  }
}

Future<List<User>> findUserAll(DB db, String authStore) async {
  List<User> resultUsers = <User>[];
  String sql = "SELECT *  FROM pharmaplay.$authStore   ";

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      // print(element);
      resultUsers.add(User.fromJson(element));
    });

    return (resultUsers);
  } else {
    print(' Users is Empty ');
    throw ' Users is Empty ';
  }
}

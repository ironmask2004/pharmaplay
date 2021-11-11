import 'package:pharmaplay_server/pharmaplay_server.dart';
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

Future<User> findUserByID(String id, Database db) async {
  final resultSet = db.select('SELECT * FROM Users WHERE id = \"' + id + '\"');
  if (resultSet.isNotEmpty) {
    return User.fromJson(resultSet.first);
  } else {
    print(' User ID($id) Not Found ');
    throw ' User ID($id) Not Found ';
  }
}

Future<List<User>> findUserAll(Database db) async {
  List<User> resultUsers = <User>[];
  final resultSet = db.select('SELECT * FROM Users ');
  if (resultSet.isNotEmpty) {
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

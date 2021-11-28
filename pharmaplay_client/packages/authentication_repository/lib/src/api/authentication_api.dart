import 'package:authentication_repository/src/model/api_error.dart';
import 'package:authentication_repository/src/model/token_pair.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'dart:io';
import '../model/api_response.dart';

/*
curl --location --request GET 'localhost:9093/users/' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJpYXQiOjE2MzIyNTQzMjksImV4cCI6MTYzMjI1NDQ1OSwic3ViIjoiNjE0OGRmM2M1NW
E5NjQ2NzdiNDMxOGZiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImp0aSI6IjMyYTBmODllLTY3YTItNDgyZC1iZmUzLTMzMzQzYjRjNjMwYiJ9.KQyxOPodML_Zqam7LKGauYCJ0IBqlXKCfjiuGu3WIII'
 */

Future<Either<ApiResponse, TokenPair>> loginUser(
    String email, String password, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  TokenPair _tokenPair;
  try {
    final _url = Uri.parse('http://' + baseUrl + "/auth/login");
    final _headers = {"Content-type": "application/json"};
    final _json = '{ \"email\": \"$email\" ,  \"password\": \"$password\" }';
    final http.Response response =
        await http.post(_url, headers: _headers, body: _json);

    print(response.body.toString() +
        'error No:' +
        response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> _tokeninfo = json.decode(response.body);

      print('TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT' +
          _tokeninfo['tokenInfo'].toString());

      var token = TokenPair.fromMap(_tokeninfo['tokenInfo']);
      print(token);

      _apiResponse.Data = token.toString(); //TokenPair.fromMap(token);

      print('TOOTOTOTOTOTOT:' + _apiResponse.Data.toString());

      _apiResponse.ApiError = ApiError(error: "Login suscess", errorNo: "200");
      return right(token);
    } else {
      print('else -----------');
      _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
    }
  } on SocketException {
    _apiResponse.ApiError =
        ApiError(error: "Server error. Please retry", errorNo: "199991");
  }
  return left(_apiResponse);
}

Future<Either<ApiResponse, String>> logOutUser(
    String userToken, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = new Uri.http(baseUrl, "users/logout");
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

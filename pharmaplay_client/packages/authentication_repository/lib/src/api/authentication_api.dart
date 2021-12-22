import 'package:authentication_repository/src/model/api_error.dart';
import 'package:authentication_repository/src/model/token_pair.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dartz/dartz.dart' as dartz;
import 'dart:io';
import '../model/api_response.dart';

/*
curl --location --request GET 'localhost:9093/users/' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.
eyJpYXQiOjE2MzIyNTQzMjksImV4cCI6MTYzMjI1NDQ1OSwic3ViIjoiNjE0OGRmM2M1NW
E5NjQ2NzdiNDMxOGZiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImp0aSI6IjMyYTBmODllLTY3YTItNDgyZC1iZmUzLTMzMzQzYjRjNjMwYiJ9.KQyxOPodML_Zqam7LKGauYCJ0IBqlXKCfjiuGu3WIII'
 */

Future<dartz.Either<ApiResponse, ApiError>> apiLoginUser(
    String email, String password, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);
  try {
    final _url = Uri.parse('http://' + baseUrl + "/auth/login");
    final _headers = {"Content-type": "application/json"};
    final _json = '{ \"email\": \"$email\" ,  \"password\": \"$password\" }';
    final http.Response response =
        await http.post(_url, headers: _headers, body: _json);

    print(response.body.toString() +
        '    ==== error No:' +
        response.statusCode.toString());

    final _responseMap = json.decode(response.body);
    final _reqResultMap = _responseMap['requestResult'];
    print(_reqResultMap.toString());

    if (response.statusCode == 200) {
      print('202020202020');
      print(_responseMap);

      print(_reqResultMap);
      _apiResponse.Data = _responseMap['tokenInfo'];
      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError = ApiError(error: 'Login Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-098765434567890-09876' +
          _responseMap['requestResult'].toString());

      _apiError = ApiError(
          error: _responseMap['requestResult']['error'].toString(),
          errorNo: response.statusCode.toString());
      print('0000000000000000000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "199991");
    return dartz.right(_apiError);
  }
}

//== apiLoginUserWithVerfication

Future<dartz.Either<ApiResponse, ApiError>> apiLoginUserWithVerfication(
    String email, String password, String confirmCode, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);
  try {
    final _url = Uri.parse('http://' + baseUrl + "/auth/login");
    final _headers = {"Content-type": "application/json"};
    final _json =
        '{ \"email\": \"$email\" ,  \"password\": \"$password\" ,  \"verificationcode\": \"$confirmCode\"}';
    final http.Response response =
        await http.post(_url, headers: _headers, body: _json);

    print(response.body.toString() +
        '    ==== error No:' +
        response.statusCode.toString());

    final _responseMap = json.decode(response.body);
    final _reqResultMap = _responseMap['requestResult'];
    print(_reqResultMap.toString());

    if (response.statusCode == 200) {
      print('202020202020');
      print(_responseMap);

      print(_reqResultMap);
      _apiResponse.Data = _responseMap['tokenInfo'];
      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError = ApiError(error: 'Login Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-098765434567890-09876' +
          _responseMap['requestResult'].toString());

      _apiError = ApiError(
          error: _responseMap['requestResult']['error'].toString(),
          errorNo: response.statusCode.toString());
      print('0000000000000000000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "199991");
    return dartz.right(_apiError);
  }
}

//===

Future<dartz.Either<ApiResponse, String>> logOutUser(
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
      return dartz.right("Get User LogOut Success");
    } else {
      _apiResponse.ApiError = ApiError(
          error: json.decode(response.body), errorNo: _response.toString());
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(
        error: "Server SocketException error. Please retry",
        errorNo: "1999991");
  }
  return dartz.left(_apiResponse);
}

Future<dartz.Either<ApiResponse, ApiError>> registerUser(
    String firstname,
    String lastname,
    String mobile,
    String email,
    String password,
    String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);
  try {
    final _url = Uri.parse('http://' + baseUrl + "/auth/register");
    final _headers = {"Content-type": "application/json"};
    final _json =
        '{ \"firstname\": \"$firstname\" ,  \"lastname\": \"$lastname\" , \"mobile\": \"$mobile\" ,  \"email\": \"$email\", \"password\": \"$password\"  }';
    print('body to cent for sign up $_json');
    final http.Response response =
        await http.post(_url, headers: _headers, body: _json);

    print(response.body.toString() +
        '    ==== error No:' +
        response.statusCode.toString());

    final _responseMap = json.decode(response.body);
    final _reqResultMap = _responseMap['requestResult'];
    print(_reqResultMap.toString());

    if (response.statusCode == 200) {
      print('3434343');
      print(_responseMap);

      print(_reqResultMap);
      _apiResponse.Data = TokenPair.empty().toJson().toString();
      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError = ApiError(
          error: 'SignUp Success Email Cent to $email with verifcation Code',
          errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-098765434567890-09876' +
          _responseMap['requestResult'].toString());

      _apiError = ApiError(
          error: _responseMap['requestResult']['error'].toString(),
          errorNo: response.statusCode.toString());
      print('00000000rtrtrt00000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "199993");
    return dartz.right(_apiError);
  }
}

import 'package:dartz/dartz.dart' as dartz;
import 'package:http/http.dart' as http;
import 'package:user_repository/src/models/models.dart';
/*
curl --location --request GET 'localhost:9093/users/' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MzIyNTQzMjksImV4cCI6MTYzMjI1NDQ1OSwic3ViIjoiNjE0OGRmM2M1NWE5NjQ2NzdiNDMxOGZiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImp0aSI6IjMyYTBmODllLTY3YTItNDgyZC1iZmUzLTMzMzQzYjRjNjMwYiJ9.KQyxOPodML_Zqam7LKGauYCJ0IBqlXKCfjiuGu3WIII'
 */
/*
Future<Either<ApiResponse, User>> getUserInfo(
    String userToken, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = Uri.http(baseUrl, "users/info/");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $userToken'
    };
    print(_headers.toString());
    final client = http.Client();
    print('kkkkkkkkkkkkk0000000000000000000kkkkkkkkkkkkkkk');
    final http.Response response = await client.get(url, headers: _headers);
    final _response = response.statusCode;
    print(response.body.toString());
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    if (_response == 200) {
      print('Get user info444444444444444444444:' + response.body.toString());
      // print('Token:' + User.token! + 'refreshToken:' + User.refreshToken!);
      _apiResponse.Data = User.fromJsonwithoutToken(
          response.body, User.token!, User.refreshToken!);

      print(_apiResponse.Data.toString());
      _apiResponse.ApiError = ApiError.fromJson(
          {"error": "Get User Info Success", "errorNo": "200"});
      return right(_apiResponse.Data as User);
    } else {
      _apiResponse.ApiError = ApiError(
          error: json.decode(response.body), errorNo: _response.toString());
    }
  } catch (err) {
    _apiResponse.ApiError = ApiError(error: err.toString(), errorNo: "199991");
  }
  return left(_apiResponse);
}

/*
--header 'Content-Type: application/json' \
--data-raw '{"email": "melocalcom1" , "password": "123456"}'
 */
*/

Future<dartz.Either<ApiResponse, ApiError>> getUserByTokenId(
    String tokenId, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);

  try {
    var url = Uri.http(baseUrl, "users/info/");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $tokenId'
    };
    print(_headers.toString());
    final client = http.Client();
    print('kkkkkkkkkkkkk0000000000000000000kkkkkkkkkkkkkkk');
    final http.Response response = await client.get(url, headers: _headers);
    final _response = response.statusCode;
    print(response.body.toString());
    print('kkkkkkkkkkkkkkkkkkkk');
    final _responseMap = json.decode(response.body);
    final _reqResultMap = _responseMap['requestResult'];
    print(_reqResultMap.toString());

    if (response.statusCode == 200) {
      print('202020202020');
      print(_responseMap);

      print(_reqResultMap);
      _apiResponse.Data = _responseMap['userinfo'];
      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError =
          ApiError(error: 'Get USer By tokenID Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-6666666666-09876' +
          _responseMap['requestResult'].toString());

      _apiError = ApiError(
          error: _responseMap['requestResult']['error'].toString(),
          errorNo: response.statusCode.toString());
      print('0000000000000000000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "188991");
    return dartz.right(_apiError);
  }
}

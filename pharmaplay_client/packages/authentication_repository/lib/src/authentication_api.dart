import 'package:authentication_repository/src/api_error.dart';
import 'package:http/http.dart' as http;

import 'api_response.dart';

/*
curl --location --request GET 'localhost:9093/users/' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MzIyNTQzMjksImV4cCI6MTYzMjI1NDQ1OSwic3ViIjoiNjE0OGRmM2M1NWE5NjQ2NzdiNDMxOGZiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImp0aSI6IjMyYTBmODllLTY3YTItNDgyZC1iZmUzLTMzMzQzYjRjNjMwYiJ9.KQyxOPodML_Zqam7LKGauYCJ0IBqlXKCfjiuGu3WIII'
 */
Future<ApiResponse> getUserDetails(String userId) async {
  ApiResponse _apiResponse = ApiResponse();
  String envBaseUrl = '';
  try {
    var url = new Uri.http(envBaseUrl, "users/info/");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $userId'
    };
    print(url.toString() + " Headrs:  " + _headers.toString());
    final client = http.Client();
    final http.Response response = await client.get(url, headers: _headers);
    print(' Get returned response:' +
        response.statusCode.toString() +
        '  returned body:' +
        response.body);

    final _response = response.statusCode;
    _apiResponse.ApiError = ApiError.fromJson({"error": "$_response"});
    switch (response.statusCode) {
      case 200:
        _apiResponse.Data = User.fromJson(response.body);
        print('get user details success 200');
        _apiResponse.ApiError = ApiError.fromJson({"error": "200"});
        break;
      case 401:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      case 403:
        print(
            "Not authorised to perform this action--------------------------->>>");
        print((_apiResponse.ApiError as ApiError).error);

        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}

/*
--header 'Content-Type: application/json' \
--data-raw '{"email": "melocalcom1" , "password": "123456"}'
 */

Future<ApiResponse> authenticateUser(String email, String password) async {
  ApiResponse _apiResponse = new ApiResponse();

  try {
    final _url = Uri.parse('http://' + envBaseUrl + "/auth/login");
    final _headers = {"Content-type": "application/json"};
    final _json = '{ \"email\": \"$email\" ,  \"password\": \"$password\" }';
    final http.Response response =
        await http.post(_url, headers: _headers, body: _json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    print('response: ' +
        response.statusCode.toString() +
        '====' +
        response.body.toString());
    print('start responce analyize');
    switch (response.statusCode) {
      case 200:
        print('----1-----');
        final String _token = json.decode(response.body)['token'];
        print(
            '{\"id\": \"$_token\", \"email\": \"$email\" ,  \"password\": \"$password\" }');

        _apiResponse.Data = User.fromJson(
            '{\"id\": \"$_token\", \"email\": \"$email\" ,  \"password\": \"$password\" }');
        print('----------2-------');
        _apiResponse.ApiError = ApiError.fromJson({"error": "200"});
        break;
      case 401:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      case 403:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}

Future<ApiResponse> logOutUser(String userId) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = new Uri.http(envBaseUrl, "users/logout");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $userId'
    };
    print(url.toString() + " Headrs:  " + _headers.toString());
    final client = http.Client();
    final http.Response response = await client.post(url, headers: _headers);
    /* print(' Get returned response:' +
        response.statusCode.toString() +
        '  returned body:' +
        response.body);
*/
    final _response = response.statusCode;
    print("LLLLLLLLLLLLLLLLLLLLLLogout + error $_response");

    _apiResponse.ApiError = ApiError.fromJson({"error": "$_response"});

    switch (response.statusCode) {
      case 200:
        // _apiResponse.Data = User.fromJson(response.body);
        print('logOut User  end success 200');
        _apiResponse.ApiError = ApiError.fromJson({"error": "200"});
        break;
      case 401:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      case 403:
        print(
            "Not authorised to perform this action--------------------------->>>");
        print((_apiResponse.ApiError as ApiError).error);

        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
      default:
        print((_apiResponse.ApiError as ApiError).error);
        _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  }
  return _apiResponse;
}

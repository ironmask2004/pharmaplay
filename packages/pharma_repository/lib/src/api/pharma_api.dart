import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:http/http.dart' as http;

import 'api_error.dart';
import 'api_response.dart';
/*
curl --location --request GET 'localhost:9093/users/' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2MzIyNTQzMjksImV4cCI6MTYzMjI1NDQ1OSwic3ViIjoiNjE0OGRmM2M1NWE5NjQ2NzdiNDMxOGZiIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdCIsImp0aSI6IjMyYTBmODllLTY3YTItNDgyZC1iZmUzLTMzMzQzYjRjNjMwYiJ9.KQyxOPodML_Zqam7LKGauYCJ0IBqlXKCfjiuGu3WIII'
 */
/*
 
/*
--header 'Content-Type: application/json' \
--data-raw '{"email": "melocalcom1" , "password": "123456"}'
 */
*/

Future<dartz.Either<ApiResponse, ApiError>> apiGetDrugGroupAll(
    String localUI, String whereCond, String baseUrl) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);

  try {
    whereCond = whereCond != '' ? ' ,  $whereCond ' : '';
    final _json = '{ \"localUI\": \"$localUI\"   $whereCond     }';

    var url = Uri.http(baseUrl, "pharma/drug/druggroups");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    print(_headers.toString() + 'Body :  $_json');
    final client = http.Client();

    print('-000-0--0-0-0-0--0');
    final http.Response response =
        await client.post(url, headers: _headers, body: _json);
    print(response.body.toString());
    print('kkkkkkkkkkkkkkkkkkkk');

    final _response = json.decode(response.body);

    if (response.statusCode == 200) {
      print('202020202020');

      _apiResponse.Data = _response;

      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError =
          ApiError(error: 'Get GetDrugGroup Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-6666666666-09876' + _response.toString());

      _apiError = ApiError(
          error: 'Error retriving DrugGroups from REpository',
          errorNo: response.statusCode.toString());
      print('0000000000000000000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "188991");
    return dartz.right(_apiError);
  }
}

/*===========

pharmaplay.mywire.org:9093/pharma/drug/fuzzyfindbypage

{ "startfrompage": "1" , "pagelength": "5" , 
 "orderbyfields": "drug.\"chemicalDrugID\",drug.\"en__brandName\""  , 
"fuzzycond":  "البلسم" , "localUI": "ar"  }



pharmaplay.mywire.org:9093/pharma/drug/findlistbypage

{ "startfrompage": "1" , "pagelength": "5" , 
 "orderbyfields": "drug.\"chemicalDrugID\",drug.\"en__brandName\""  , 
"wherecond": "WHERE drug.\"dosageFormID\" = 44 and drug.\"drugID\" <=8810  " , "localUI": "ar"  }

//----*/

Future<dartz.Either<ApiResponse, ApiError>> apiGetDrugAll(
    {String? startFromPage,
    String? pageLength,
    String? orderByFields,
    String? localUI,
    String? whereCond,
    required String baseUrl}) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);

  try {
    localUI = localUI == null
        ? ' \"localUI\": \"en\" '
        : ' \"localUI\": \"$localUI\" ';

    whereCond = whereCond == null ? ' ' : ' ,  $whereCond ';

    startFromPage = startFromPage == null
        ? ' , "startfrompage": "1" '
        : ' , "startfrompage": "$startFromPage" ';
    pageLength = pageLength == null
        ? ' , "pageLength": "25" '
        : ' , "pageLength": "$pageLength" ';
    orderByFields = orderByFields == null
        ? ' , drug.\"en__brandName\"" '
        : ' ,  "orderByFields": "$orderByFields" ';

    final _json =
        ' {  $localUI  $whereCond  "$startFromPage"  "$pageLength"   "$orderByFields"     }';

    var url = Uri.http(baseUrl, "pharma/drug/findlistbypage");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    print(_headers.toString() + 'Body :  $_json');
    final client = http.Client();

    print('-000-0--0-0-0-0--0');

    final http.Response response =
        await client.post(url, headers: _headers, body: _json);
    print(response.body.toString());
    print('kkkkkkkkkkkkkkkkkkkk');

    final _response = json.decode(response.body);

    if (response.statusCode == 200) {
      print('202020202020');

      _apiResponse.Data = _response;

      print('----------------------' + _apiResponse.Data.toString());

      _apiResponse.ApiError =
          ApiError(error: 'Get GetDrugGroup Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      print('response error' + _apiResponse.ApiError.toString());
      return dartz.left(_apiResponse);
    } else {
      print('4345654345678p-6666666666-09876' + _response.toString());

      _apiError = ApiError(
          error: 'Error retriving DrugGroups from REpository',
          errorNo: response.statusCode.toString());
      print('0000000000000000000000000000');
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "188991");
    return dartz.right(_apiError);
  }
}

import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:http/http.dart' as http;

import 'api_error.dart';
import 'api_response.dart';

Future<dartz.Either<ApiResponse, ApiError>> apiGetDrugsSearch(
    {String? startFromPage,
    String? pageLength,
    String? orderByFields,
    String? localUI,
    String? whereCond,
    String? fuzzyCond,
    required String baseUrl}) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);

  try {
    localUI = localUI ?? 'en';

    var _jsonlocalUI = ' \"localUI\": \"$localUI\" ';

    whereCond =
        whereCond == null || whereCond.isEmpty ? ' ' : ' ,  $whereCond ';

    startFromPage = startFromPage == null || startFromPage.isEmpty
        ? ' , "startfrompage": "1" '
        : ' , "startfrompage": "$startFromPage" ';
    pageLength = pageLength == null || pageLength.isEmpty
        ? ' , "pagelength": "16" '
        : ' , "pagelength": "$pageLength" ';
    orderByFields = orderByFields == null || orderByFields.isEmpty
        ? ' ,  "orderbyfields": "drug.\\"${localUI}__brandName\\"" '
        : ' ,  "orderbyfields": "$orderByFields" ';

    var url;
    final _json;
    if (fuzzyCond == null || fuzzyCond.isEmpty) {
      url = Uri.http(baseUrl, "pharma/drug/search");
      _json =
          ' {  $_jsonlocalUI  $whereCond  $startFromPage  $pageLength   $orderByFields     }';
    } else {
      url = Uri.http(baseUrl, "pharma/drug/searchfuzzy");
      _json =
          ' {  $_jsonlocalUI  $fuzzyCond  $startFromPage  $pageLength   $orderByFields     }';
    }

    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final client = http.Client();

    final http.Response response =
        await client.post(url, headers: _headers, body: _json);
    print(_headers.toString() + 'Body :  $_json URL: $url ');

    final _response = json.decode(response.body);

    if (response.statusCode == 200) {
      _apiResponse.Data = _response;

      _apiResponse.ApiError =
          ApiError(error: 'Get GetDrugGroup Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      return dartz.left(_apiResponse);
    } else {
      _apiError = ApiError(
          error: 'Error retriving DrugGroups from REpository',
          errorNo: response.statusCode.toString());
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "188991");
    return dartz.right(_apiError);
  }
}

///==================================
///
Future<dartz.Either<ApiResponse, ApiError>> apiGetDrugGroupsSearch(
    {String? startFromPage,
    String? pageLength,
    String? orderByFields,
    String? localUI,
    String? whereCond,
    String? fuzzyCond,
    required String baseUrl}) async {
  ApiResponse _apiResponse = ApiResponse();
  ApiError _apiError; // = ApiError(error: error, errorNo: errorNo);

  try {
    localUI = localUI ?? 'en';

    var _jsonlocalUI = ' \"localUI\": \"$localUI\" ';

    whereCond =
        whereCond == null || whereCond.isEmpty ? ' ' : ' ,  $whereCond ';

    startFromPage = startFromPage == null || startFromPage.isEmpty
        ? ' , "startfrompage": "1" '
        : ' , "startfrompage": "$startFromPage" ';
    pageLength = pageLength == null || pageLength.isEmpty
        ? ' , "pagelength": "10" '
        : ' , "pagelength": "$pageLength" ';
    orderByFields = orderByFields == null || orderByFields.isEmpty
        ? ' ,  "orderbyfields": "druggroup.\\"${localUI}__drugGroupName\\"" '
        : ' ,  "orderbyfields": "$orderByFields" ';

    var url;
    final _json;
    if (fuzzyCond == null || fuzzyCond.isEmpty) {
      url = Uri.http(baseUrl, "pharma/druggroups/search");
      _json =
          ' {  $_jsonlocalUI  $whereCond  $startFromPage  $pageLength   $orderByFields     }';
    } else {
      url = Uri.http(baseUrl, "pharma/druggroups/search");
      _json =
          ' {  $_jsonlocalUI  $fuzzyCond  $startFromPage  $pageLength   $orderByFields     }';
    }

    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    print(_headers.toString() + 'Body :  $_json URL: $url ');

    final client = http.Client();

    final http.Response response =
        await client.post(url, headers: _headers, body: _json);

    final _response = json.decode(response.body);

    if (response.statusCode == 200) {
      _apiResponse.Data = _response;

      _apiResponse.ApiError =
          ApiError(error: 'Get GetDrugGroup Success', errorNo: '200');
      //    ApiError.fromJson(json.decode(_reqResultMap.toString()));

      return dartz.left(_apiResponse);
    } else {
      _apiError = ApiError(
          error: 'Error retriving DrugGroups from REpository',
          errorNo: response.statusCode.toString());
      return dartz.right(_apiError);
    }
  } catch (err) {
    _apiError = ApiError(error: '$err', errorNo: "188991");
    return dartz.right(_apiError);
  }
}

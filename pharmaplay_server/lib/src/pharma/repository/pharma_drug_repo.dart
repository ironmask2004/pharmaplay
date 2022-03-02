// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pharmaplay_server/pharmaplay_server.dart';

import 'dart:convert';

// !using EITHER
/*
Future<Either<ApiResponse, String>> logOutDrug(String DrugToken) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = new Uri.http(Env.baseUrl, "Drug/logout");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $DrugToken'
    };
    print(url.toString() + " Headrs:  " + _headers.toString());
    final client = http.Client();
    final http.Response response = await client.post(url, headers: _headers);
    final _response = response.statusCode;
    print("LLLLLLLLLLLLLLLLLLLLLLogout + error $_response");

    if (_response == 200) {
      // _apiResponse.Data = Drug.fromJson(response.body);
      _apiResponse.ApiError = ApiError.fromJson(
          {"error": "Get Drug LogOut Success", "errorNo": "200"});
      return right("Get Drug LogOut Success");
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

Future<List<DrugRecord>> findDrugByParams(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required Map<String, dynamic> params,
    required DB db,
    required String drugStore,
    required String localUI}) async {
  // String sql;

//---- params to where condetion
  String whereCond = '';
  params.forEach((k, v) => whereCond =
      (whereCond.isEmpty ? 'WHERE ' : whereCond + ' and ') +
          '${k} = ${v}'); // @${k} ');

//---

  // dynamic resultSet;
  // sql = 'SELECT *  FROM pharmaplay.$drugStore  $whereCond ';
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugRecord> resultDrugs = <DrugRecord>[];
  String sql = '''   SELECT drug."drugID",drug."drugNo",
    drug."${localUI}__brandName" as "brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",
    manufactory."${localUI}__manufactoryName" as "manufactoryName",  manufactory."manufactoryRating" ,
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",
    chemicalDrug."${localUI}__chemicalDrugName" as "chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",
    genericDrug."${localUI}__genericDrugName" as "genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",
    dosageForm."${localUI}__dosageForm" as  "dosageForm" ,
    drug."drugClassID",drugClass."drugClassID",drugClass."${localUI}__drugClassName" as "drugClassName" ,
    drugClass."drugGroupID", drug."drugGroupID",drugGroup."drugGroupID", 
    drugGroup."${localUI}__drugGroupName" as "drugGroupName",
    drug."drugFamilyID",drugFamily."drugFamilyID", drugFamily."drugClassID",
    drugFamily."${localUI}__drugFamilyName" as "drugFamilyName", drug."licenseNumber",
    drug."licenseDate",drug."drugPrice",drug."drugRating"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    LEFT JOIN pharmaplay."drugFamily" drugFamily ON drug."drugFamilyID" = drugFamily."drugFamilyID"
    LEFT JOIN pharmaplay."drugClass" drugClass ON drug."drugClassID" = drugClass."drugClassID"
    LEFT JOIN pharmaplay."drugGroup" drugGroup  ON drug."drugGroupID" = drugGroup."drugGroupID"

    $whereCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  // resultSet = await db.query(sql);
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length >= 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultDrugs.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultDrugs);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

//----------------------
Future<DrugRecord> findDrugByID(
    String drugID, DB db, String drugStore, String localUI) async {
  String sql = '''     SELECT drug."drugID",drug."drugNo",
    drug."${localUI}__brandName" as "brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",
    manufactory."${localUI}__manufactoryName" as "manufactoryName",  manufactory."manufactoryRating" ,
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",
    chemicalDrug."${localUI}__chemicalDrugName" as "chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",
    genericDrug."${localUI}__genericDrugName" as "genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",
    dosageForm."${localUI}__dosageForm" as  "dosageForm" ,
    drug."drugClassID",drugClass."drugClassID",drugClass."${localUI}__drugClassName" as "drugClassName" ,
    drugClass."drugGroupID", drug."drugGroupID",drugGroup."drugGroupID",
    drugGroup."${localUI}__drugGroupName" as "drugGroupName",
    drug."drugFamilyID",drugFamily."drugFamilyID", drugFamily."drugClassID",
    drugFamily."${localUI}__drugFamilyName" as "drugFamilyName", drug."licenseNumber",
    drug."licenseDate",drug."drugPrice",  drug."drugRating"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    LEFT JOIN pharmaplay."drugFamily" drugFamily ON drug."drugFamilyID" = drugFamily."drugFamilyID"
    LEFT JOIN pharmaplay."drugClass" drugClass ON drug."drugClassID" = drugClass."drugClassID"
    LEFT JOIN pharmaplay."drugGroup" drugGroup  ON drug."drugGroupID" = drugGroup."drugGroupID"

    WHERE  drug."drugID"  =  @drugID ''';
  print('-------------- drug ID-----:' + drugID);
  Map<String, dynamic> params = {"drugID": drugID};
  print(params);

  dynamic resultSet = await db.query(sql, values: params);
  print('No Rows: ' + resultSet.length.toString());
  if (resultSet.length > 0) {
    print(resultSet.first);
    print('founded by drugID: ' + resultSet.first.toString());

    return (DrugRecord.fromJson(resultSet.first));
  } else {
    print(' Drug ID($drugID) Not Found ');
    throw ' Drug ID($drugID) Not Found ';
  }
}

///---------------------

Future<List<DrugRecord>> findDrugAll(
    DB db, String drugStore, String localUI) async {
  List<DrugRecord> resultDrugs = <DrugRecord>[];
  String sql = '''  SELECT drug."drugID",drug."drugNo",
    drug."${localUI}__brandName" as "brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",
    manufactory."${localUI}__manufactoryName" as "manufactoryName",  manufactory."manufactoryRating" ,
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",
    chemicalDrug."${localUI}__chemicalDrugName" as "chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",
    genericDrug."${localUI}__genericDrugName" as "genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",
    dosageForm."${localUI}__dosageForm" as  "dosageForm" ,
    drug."drugClassID",drugClass."drugClassID",drugClass."${localUI}__drugClassName" as "drugClassName" ,
    drugClass."drugGroupID", drug."drugGroupID",drugGroup."drugGroupID",
    drugGroup."${localUI}__drugGroupName" as "drugGroupName",
    drug."drugFamilyID",drugFamily."drugFamilyID", drugFamily."drugClassID",
    drugFamily."${localUI}__drugFamilyName" as "drugFamilyName", drug."licenseNumber",
    drug."licenseDate",drug."drugPrice",drug."drugRating"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    LEFT JOIN pharmaplay."drugFamily" drugFamily ON drug."drugFamilyID" = drugFamily."drugFamilyID"
    LEFT JOIN pharmaplay."drugClass" drugClass ON drug."drugClassID" = drugClass."drugClassID"
    LEFT JOIN pharmaplay."drugGroup" drugGroup  ON drug."drugGroupID" = drugGroup."drugGroupID"

    LIMIT 10  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultDrugs.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultDrugs);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

///----------------------
//{ "startfrompage": "3" , "pagelength": "2" , "orderbyfields": "drug.\"chemicalDrugID\",drug.\"brandName\""  }
//----
Future<List<DrugRecord>> findDrugByPage(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required String whereCond,
    required DB db,
    required String drugStore,
    required String localUI}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugRecord> resultDrugs = <DrugRecord>[];
  String sql = '''  SELECT drug."drugID",drug."drugNo",
    drug."${localUI}__brandName" as "brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",
    manufactory."${localUI}__manufactoryName" as "manufactoryName",  manufactory."manufactoryRating" ,
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",
    chemicalDrug."${localUI}__chemicalDrugName" as "chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",
    genericDrug."${localUI}__genericDrugName" as "genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",
    dosageForm."${localUI}__dosageForm" as  "dosageForm" ,
    drug."drugClassID",drugClass."drugClassID",drugClass."${localUI}__drugClassName" as "drugClassName" ,
    drugClass."drugGroupID", drug."drugGroupID",drugGroup."drugGroupID",
    drugGroup."${localUI}__drugGroupName" as "drugGroupName",
    drug."drugFamilyID",drugFamily."drugFamilyID", drugFamily."drugClassID",
    drugFamily."${localUI}__drugFamilyName" as "drugFamilyName",
    drug."licenseNumber",drug."licenseDate",drug."drugPrice",drug."drugRating"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    LEFT JOIN pharmaplay."drugFamily" drugFamily ON drug."drugFamilyID" = drugFamily."drugFamilyID"
    LEFT JOIN pharmaplay."drugClass" drugClass ON drug."drugClassID" = drugClass."drugClassID"
    LEFT JOIN pharmaplay."drugGroup" drugGroup  ON drug."drugGroupID" = drugGroup."drugGroupID"

    $whereCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length >= 0) {
    resultSet.forEach((element) {
      print(element);
      //print(Drug.fromJson(element['drug']).toString());
      print('----------------');
      resultDrugs.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultDrugs);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

///----------------------
//{ "startfrompage": "3" , "pagelength": "2" , "orderbyfields": "drug.\"chemicalDrugID\",drug.\"brandName\""  }
//----
Future<List<DrugRecord>> fuzzyFindDrugByPage(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required String fuzzyCond,
    required DB db,
    required String drugStore,
    required String localUI}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugRecord> resultDrugs = <DrugRecord>[];
  String sql = '''  SELECT drug."drugID",drug."drugNo",
    drug."${localUI}__brandName" as "brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",
    manufactory."${localUI}__manufactoryName" as "manufactoryName",  manufactory."manufactoryRating" ,
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",
    chemicalDrug."${localUI}__chemicalDrugName" as "chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",
    genericDrug."${localUI}__genericDrugName" as "genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",
    dosageForm."${localUI}__dosageForm" as  "dosageForm" ,
    drug."drugClassID",drugClass."drugClassID",drugClass."${localUI}__drugClassName" as "drugClassName" ,
    drugClass."drugGroupID", drug."drugGroupID",drugGroup."drugGroupID",
    drugGroup."${localUI}__drugGroupName" as "drugGroupName",
    drug."drugFamilyID",drugFamily."drugFamilyID", drugFamily."drugClassID",
    drugFamily."${localUI}__drugFamilyName" as "drugFamilyName", drug."licenseNumber",
    drug."licenseDate",drug."drugPrice",drug."drugRating" 
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    LEFT JOIN pharmaplay."drugFamily" drugFamily ON drug."drugFamilyID" = drugFamily."drugFamilyID"
    LEFT JOIN pharmaplay."drugClass" drugClass ON drug."drugClassID" = drugClass."drugClassID"
    LEFT JOIN pharmaplay."drugGroup" drugGroup  ON drug."drugGroupID" = drugGroup."drugGroupID"
    where    similarity (manufactory."en__manufactoryName" ,'$fuzzyCond' )  > 0.2
    OR       similarity (manufactory."ar__manufactoryName" ,'$fuzzyCond' )  > 0.2
    OR       similarity (drug."en__brandName" ,'$fuzzyCond' )  > 0.2
    OR       similarity (drug."ar__brandName" ,'$fuzzyCond' )  > 0.2
    OR       similarity (genericDrug."en__genericDrugName",'$fuzzyCond' )  > 0.2
    OR       similarity (genericDrug."ar__genericDrugName",'$fuzzyCond' )  > 0.2
    OR       similarity (drugGroup."ar__drugGroupName",'$fuzzyCond' )  > 0.2
    OR       similarity (drugGroup."en__drugGroupName",'$fuzzyCond' )  > 0.2

    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length >= 0) {
    resultSet.forEach((element) {
      print(element);
      //print(Drug.fromJson(element['drug']).toString());
      print('----------------');
      resultDrugs.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultDrugs);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

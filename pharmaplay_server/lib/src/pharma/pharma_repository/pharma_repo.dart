// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pharmaplay_server/pharmaplay_server.dart';

import '../model/drugrecord.dart';

// !using EITHER
/*
Future<Either<ApiResponse, String>> logOutMedicine(String MedicineToken) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
    var url = new Uri.http(Env.baseUrl, "Medicine/logout");
    Map<String, String> _headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'authorization': 'Bearer $MedicineToken'
    };
    print(url.toString() + " Headrs:  " + _headers.toString());
    final client = http.Client();
    final http.Response response = await client.post(url, headers: _headers);
    final _response = response.statusCode;
    print("LLLLLLLLLLLLLLLLLLLLLLogout + error $_response");

    if (_response == 200) {
      // _apiResponse.Data = Medicine.fromJson(response.body);
      _apiResponse.ApiError = ApiError.fromJson(
          {"error": "Get Medicine LogOut Success", "errorNo": "200"});
      return right("Get Medicine LogOut Success");
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

Future<List<DrugRecord>> findMedicineByParams(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required Map<String, dynamic> params,
    required DB db,
    required String medicineStore}) async {
  // String sql;

//---- params to where condetion
  String whereCond = '';
  params.forEach((k, v) => whereCond =
      (whereCond.isEmpty ? 'WHERE ' : whereCond + ' and ') +
          '${k} = ${v}'); // @${k} ');

//---

  // dynamic resultSet;
  // sql = 'SELECT *  FROM pharmaplay.$medicineStore  $whereCond ';
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugRecord> resultMedicines = <DrugRecord>[];
  String sql = '''  SELECT drug."drugID",
    drug."en__brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",manufactory."en__manufactoryName",
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",chemicalDrug."en__chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",genericDrug."en__genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",  dosageForm."dosageForm" ,
    drug."licenseNumber",drug."licenseDate"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    $whereCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  // resultSet = await db.query(sql);
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

//----------------------
Future<DrugRecord> findMedicineByID(
    String medicineID, DB db, String medicineStore) async {
  String sql = '''   SELECT drug."drugID",
    drug."en__brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",manufactory."en__manufactoryName",
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",chemicalDrug."en__chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",genericDrug."en__genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",  dosageForm."dosageForm" ,
    drug."licenseNumber",drug."licenseDate"
    FROM pharmaplay.drug drug
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    WHERE  medicine."medicineID"  =  @medicineID ''';
  print('-------------- medicine ID-----:' + medicineID);
  Map<String, dynamic> params = {"medicineID": medicineID};
  print(params);

  dynamic resultSet = await db.query(sql, values: params);
  print('No Rows: ' + resultSet.length.toString());
  if (resultSet.length > 0) {
    print(resultSet.first);
    print('founded by medicineID: ' + resultSet.first.toString());

    // print('medicFactory founded by medicineID: ' +
    //    resultSet.first.map['medicFactory'].toString());

    return DrugRecord.fromMap((resultSet.first));
  } else {
    print(' Medicine ID($medicineID) Not Found ');
    throw ' Medicine ID($medicineID) Not Found ';
  }
}

///---------------------

Future<List<DrugRecord>> findMedicineAll(DB db, String medicineStore) async {
  List<DrugRecord> resultMedicines = <DrugRecord>[];
  String sql = '''  SELECT drug."drugID",
    drug."en__brandName",drug.caliber,
    drug."manufactoryID",manufactory."manufactoryID",manufactory."en__manufactoryName",
    drug."chemicalDrugID", chemicalDrug."chemicalDrugID",chemicalDrug."en__chemicalDrugName",
    drug."genericDrugID",genericDrug."genericDrugID",genericDrug."en__genericDrugName",
    drug."dosageFormID",dosageForm."dosageFormID",  dosageForm."dosageForm" ,
    drug."licenseNumber",drug."licenseDate"
    
    FROM pharmaplay.drug drug
    
    LEFT JOIN pharmaplay."manufactory" manufactory ON drug."manufactoryID" = manufactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON drug."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON drug."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrug" genericDrug ON drug."genericDrugID" = genericDrug."genericDrugID"
    
    LIMIT 10  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

///----------------------
//{ "startfrompage": "3" , "pagelength": "2" , "orderbyfields": "medicine.\"chemicalDrugID\",medicine.\"tradeName\""  }
//----
Future<List<DrugRecord>> findMedicineByPage(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required String weherCond,
    required DB db,
    required String medicineStore}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugRecord> resultMedicines = <DrugRecord>[];
  String sql = '''  SELECT medicine."medicineID",
    medicine."tradeName",medicine.caliber,
    medicine."formulaID",formula."formulaID",formula."formulaName",
    medicine."manufactoryID",medicFactory."manufactoryID",medicFactory."manufactoryName",
    medicine."chemicalDrugID", chemicalDrug."chemicalDrugID",chemicalDrug."chemicalDrug",
    medicine."genericDrugID",genericDrugName."genericDrugID",genericDrugName."genericDrugName",
    medicine."dosageFormID",dosageForm."dosageFormID",  dosageForm."dosageForm" ,
    medicine."licenseNumber",medicine."licenseDate"
    FROM pharmaplay.medicine medicine
    LEFT JOIN pharmaplay."medicFactory" medicFactory ON medicine."manufactoryID" = medicFactory."manufactoryID"
    LEFT JOIN pharmaplay."dosageForm" dosageForm ON medicine."dosageFormID" = dosageForm."dosageFormID"
    LEFT JOIN pharmaplay.formula formula ON medicine."formulaID" = formula."formulaID"
    LEFT JOIN pharmaplay."chemicalDrug" chemicalDrug ON medicine."chemicalDrugID" = chemicalDrug."chemicalDrugID"
    LEFT JOIN pharmaplay."genericDrugName" genericDrugName ON medicine."genericDrugID" = genericDrugName."genericDrugID"
    $weherCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(DrugRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

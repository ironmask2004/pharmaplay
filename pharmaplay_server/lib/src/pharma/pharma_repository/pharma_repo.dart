// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pharmaplay_server/pharmaplay_server.dart';

import '../model/medicinerecord.dart';

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

Future<List<MedicineRecord>> findMedicineByParams(
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
  List<MedicineRecord> resultMedicines = <MedicineRecord>[];
  String sql = '''  SELECT medicine."medicineID",
    medicine."tradeName",medicine.caliber,
    medicine."formulaID",formula."formulaID",formula."formulaName",
    medicine."medicFactoryID",medicFactory."medicFactoryID",medicFactory."medicFactoryName",
    medicine."chemicalNameID", chemicalName."chemicalNameID",chemicalName."chemicalName",
    medicine."genericNameID",genericName."genericNameID",genericName."genericName",
    medicine."pharmaFormID",pharmaForm."pharmaFormID",  pharmaForm."pharmaForm" ,
    medicine."licenseNumber",medicine."licenseDate"
    FROM pharmaplay.medicine medicine
    LEFT JOIN pharmaplay."medicFactory" medicFactory ON medicine."medicFactoryID" = medicFactory."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" pharmaForm ON medicine."pharmaFormID" = pharmaForm."pharmaFormID"
    LEFT JOIN pharmaplay.formula formula ON medicine."formulaID" = formula."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chemicalName ON medicine."chemicalNameID" = chemicalName."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" genericName ON medicine."genericNameID" = genericName."genericNameID"
    $whereCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  // resultSet = await db.query(sql);
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(MedicineRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

//----------------------
Future<MedicineRecord> findMedicineByID(
    String medicineID, DB db, String medicineStore) async {
  String sql = '''  SELECT medicine."medicineID",
    medicine."tradeName",medicine.caliber,
    medicine."formulaID",formula."formulaID",formula."formulaName",
    medicine."medicFactoryID",medicFactory."medicFactoryID",medicFactory."medicFactoryName",
    medicine."chemicalNameID", chemicalName."chemicalNameID",chemicalName."chemicalName",
    medicine."genericNameID",genericName."genericNameID",genericName."genericName",
    medicine."pharmaFormID",pharmaForm."pharmaFormID",  pharmaForm."pharmaForm" ,
    medicine."licenseNumber",medicine."licenseDate"
    FROM pharmaplay.medicine medicine
    LEFT JOIN pharmaplay."medicFactory" medicFactory ON medicine."medicFactoryID" = medicFactory."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" pharmaForm ON medicine."pharmaFormID" = pharmaForm."pharmaFormID"
    LEFT JOIN pharmaplay.formula formula ON medicine."formulaID" = formula."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chemicalName ON medicine."chemicalNameID" = chemicalName."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" genericName ON medicine."genericNameID" = genericName."genericNameID"
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

    return MedicineRecord.fromMap((resultSet.first));
  } else {
    print(' Medicine ID($medicineID) Not Found ');
    throw ' Medicine ID($medicineID) Not Found ';
  }
}

///---------------------

Future<List<MedicineRecord>> findMedicineAll(
    DB db, String medicineStore) async {
  List<MedicineRecord> resultMedicines = <MedicineRecord>[];
  String sql = '''  SELECT medicine."medicineID",
    medicine."tradeName",medicine.caliber,
    medicine."formulaID",formula."formulaID",formula."formulaName",
    medicine."medicFactoryID",medicFactory."medicFactoryID",medicFactory."medicFactoryName",
    medicine."chemicalNameID", chemicalName."chemicalNameID",chemicalName."chemicalName",
    medicine."genericNameID",genericName."genericNameID",genericName."genericName",
    medicine."pharmaFormID",pharmaForm."pharmaFormID",  pharmaForm."pharmaForm" ,
    medicine."licenseNumber",medicine."licenseDate"
    FROM pharmaplay.medicine medicine
    LEFT JOIN pharmaplay."medicFactory" medicFactory ON medicine."medicFactoryID" = medicFactory."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" pharmaForm ON medicine."pharmaFormID" = pharmaForm."pharmaFormID"
    LEFT JOIN pharmaplay.formula formula ON medicine."formulaID" = formula."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chemicalName ON medicine."chemicalNameID" = chemicalName."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" genericName ON medicine."genericNameID" = genericName."genericNameID"
    LIMIT 10  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(MedicineRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

///----------------------
//{ "startfrompage": "3" , "pagelength": "2" , "orderbyfields": "medicine.\"chemicalNameID\",medicine.\"tradeName\""  }
//----
Future<List<MedicineRecord>> findMedicineByPage(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required String weherCond,
    required DB db,
    required String medicineStore}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<MedicineRecord> resultMedicines = <MedicineRecord>[];
  String sql = '''  SELECT medicine."medicineID",
    medicine."tradeName",medicine.caliber,
    medicine."formulaID",formula."formulaID",formula."formulaName",
    medicine."medicFactoryID",medicFactory."medicFactoryID",medicFactory."medicFactoryName",
    medicine."chemicalNameID", chemicalName."chemicalNameID",chemicalName."chemicalName",
    medicine."genericNameID",genericName."genericNameID",genericName."genericName",
    medicine."pharmaFormID",pharmaForm."pharmaFormID",  pharmaForm."pharmaForm" ,
    medicine."licenseNumber",medicine."licenseDate"
    FROM pharmaplay.medicine medicine
    LEFT JOIN pharmaplay."medicFactory" medicFactory ON medicine."medicFactoryID" = medicFactory."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" pharmaForm ON medicine."pharmaFormID" = pharmaForm."pharmaFormID"
    LEFT JOIN pharmaplay.formula formula ON medicine."formulaID" = formula."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chemicalName ON medicine."chemicalNameID" = chemicalName."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" genericName ON medicine."genericNameID" = genericName."genericNameID"
    $weherCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow  ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultMedicines.add(MedicineRecord.fromJson(element));
    });
    print('---- return------------');

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

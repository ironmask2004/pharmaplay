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

Future<List<Medicine>> findMedicineByParams(
    DB db, String medicineStore, Map<String, dynamic> params) async {
  String sql;

//---- params to where condetion
  String whereCond = '';
  params.forEach((k, v) => whereCond =
      (whereCond.isEmpty ? 'WHERE ' : whereCond + ' and ') + '${k} = @${k} ');

//---

  dynamic resultSet;
  sql = 'SELECT *  FROM pharmaplay.$medicineStore  $whereCond ';
  print(sql + '    ' + params.toString());
  try {
    resultSet = await db.query(sql, values: params);
  } catch (err) {
    throw params.toString() + err.toString();
  }
  print(resultSet);
  List<Medicine> resaultMedicines = [];

  for (final row in resultSet) {
    resaultMedicines.add(Medicine.fromMap(row[medicineStore]));
  }

  if (resultSet.length > 0) {
    print(resaultMedicines);
    return resaultMedicines;
  } else {
    print(params.toString() + '  Not Found ');
    throw params.toString() + '  Not Found ';
  }
}

//----------------------
Future<MedicineRecord> findMedicineByID(
    String medicineID, DB db, String medicineStore) async {
  String sql = '''  SELECT md0."medicineID",
    md0."tradeName",md0.caliber,
    md0."formulaID",frm0."formulaID",frm0."formulaName",
    md0."medicFactoryID",fac0."medicFactoryID",fac0."medicFactoryName",
    md0."chemicalNameID", chmn0."chemicalNameID",chmn0."chemicalName",
    md0."genericNameID",grn0."genericNameID",grn0."genericName",
    md0."pharmaFormID",ff0."pharmaFormID",  ff0."pharmaForm" ,
    md0."licenseNumber",md0."licenseDate"
    FROM pharmaplay.medicine md0
    LEFT JOIN pharmaplay."medicFactory" fac0 ON md0."medicFactoryID" = fac0."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
    LEFT JOIN pharmaplay.formula frm0 ON md0."formulaID" = frm0."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" grn0 ON md0."genericNameID" = grn0."genericNameID"
    WHERE  md0."medicineID"  =  @medicineID ''';
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
  String sql = '''  SELECT md0."medicineID",
    md0."tradeName",md0.caliber,
    md0."formulaID",frm0."formulaID",frm0."formulaName",
    md0."medicFactoryID",fac0."medicFactoryID",fac0."medicFactoryName",
    md0."chemicalNameID", chmn0."chemicalNameID",chmn0."chemicalName",
    md0."genericNameID",grn0."genericNameID",grn0."genericName",
    md0."pharmaFormID",ff0."pharmaFormID",  ff0."pharmaForm" ,
    md0."licenseNumber",md0."licenseDate"
    FROM pharmaplay.medicine md0
    LEFT JOIN pharmaplay."medicFactory" fac0 ON md0."medicFactoryID" = fac0."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
    LEFT JOIN pharmaplay.formula frm0 ON md0."formulaID" = frm0."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" grn0 ON md0."genericNameID" = grn0."genericNameID"
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

///---------------------

Future<List<MedicineRecord>> findMedicineByPage(
    {required int startFromPage,
    required int pageLength,
    required DB db,
    required String medicineStore}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<MedicineRecord> resultMedicines = <MedicineRecord>[];
  String sql = '''  SELECT md0."medicineID",
    md0."tradeName",md0.caliber,
    md0."formulaID",frm0."formulaID",frm0."formulaName",
    md0."medicFactoryID",fac0."medicFactoryID",fac0."medicFactoryName",
    md0."chemicalNameID", chmn0."chemicalNameID",chmn0."chemicalName",
    md0."genericNameID",grn0."genericNameID",grn0."genericName",
    md0."pharmaFormID",ff0."pharmaFormID",  ff0."pharmaForm" ,
    md0."licenseNumber",md0."licenseDate"
    FROM pharmaplay.medicine md0
    LEFT JOIN pharmaplay."medicFactory" fac0 ON md0."medicFactoryID" = fac0."medicFactoryID"
    LEFT JOIN pharmaplay."pharmaForm" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
    LEFT JOIN pharmaplay.formula frm0 ON md0."formulaID" = frm0."formulaID"
    LEFT JOIN pharmaplay."chemicalName" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
    LEFT JOIN pharmaplay."genericName" grn0 ON md0."genericNameID" = grn0."genericNameID"
    ORDER BY  md0."medicineID"
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

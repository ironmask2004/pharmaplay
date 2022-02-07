// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:pharmaplay_server/pharmaplay_server.dart';

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
Future<Medicine> findMedicineByID(
    String medicineID, DB db, String medicineStore) async {
  String sql = '''  SELECT md0."medicineID",
    md0.tradename,md0.caliber,md0."formulaID",frm0.formula,
    md0."factoryID",fac0."factoryName",md0."chemicalNameID",chmn0."chemicalName",
    md0."genericnameID",grn0.genericname,md0."pharmaFormID",
    ff0."pharmaForm" ,md0."licenseNumber",md0."licenseDate" AS licensedate
   FROM pharmaplay.medicines000 md0
     LEFT JOIN pharmaplay.factory000 fac0 ON md0."factoryID" = fac0."factoryID"
     LEFT JOIN pharmaplay."pharmaForm000" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
     LEFT JOIN pharmaplay.formula000 frm0 ON md0."formulaID" = frm0."formulaID"
     LEFT JOIN pharmaplay."chemicalNames000" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
     LEFT JOIN pharmaplay."genericNames000" grn0 ON md0."genericnameID" = grn0."genericnameID"
     where  md0."medicineID"  =  @medicineID ''';
  print('-------------- medicine ID-----:' + medicineID);
  Map<String, dynamic> params = {"medicineID": medicineID};
  print(params);

  dynamic resultSet = await db.query(sql, values: params);
  print('No Rows: ' + resultSet.length.toString());
  if (resultSet.length > 0) {
    print(resultSet.first);
    print(
        'founded by medicineID: ' + resultSet.first['medicines000'].toString());
    return Medicine.fromMap((resultSet.first['medicines000']));
  } else {
    print(' Medicine ID($medicineID) Not Found ');
    throw ' Medicine ID($medicineID) Not Found ';
  }
}

///---------------------

Future<List<Medicine>> findMedicineAll(DB db, String medicineStore) async {
  List<Medicine> resultMedicines = <Medicine>[];
  String sql = '''  SELECT md0."medicineID",
    md0.tradename,    md0.caliber,
    md0."formulaID",    frm0.formula,
    md0."factoryID",    fac0."factoryName",
    md0."chemicalNameID",
    chmn0."chemicalName",
    md0."genericnameID",
    grn0.genericname,
    md0."pharmaFormID",
    ff0."pharmaForm",
    md0."licenseNumber",
    md0."licenseDate" AS licensedate
   FROM pharmaplay.medicines000 md0
     LEFT JOIN pharmaplay.factory000 fac0 ON md0."factoryID" = fac0."factoryID"
     LEFT JOIN pharmaplay."pharmaForm000" ff0 ON md0."pharmaFormID" = ff0."pharmaFormID"
     LEFT JOIN pharmaplay.formula000 frm0 ON md0."formulaID" = frm0."formulaID"
     LEFT JOIN pharmaplay."chemicalNames000" chmn0 ON md0."chemicalNameID" = chmn0."chemicalNameID"
     LEFT JOIN pharmaplay."genericNames000" grn0 ON md0."genericnameID" = grn0."genericnameID"
      ''';

  dynamic resultSet = await db.query(sql);

  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      // print(element);
      resultMedicines.add(Medicine.fromJson(element));
    });

    return (resultMedicines);
  } else {
    print(' Medicine is Empty ');
    throw ' Medicine is Empty ';
  }
}

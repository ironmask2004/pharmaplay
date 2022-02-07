import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/utilites/error_response.dart';

import '../pharma_repository/pharma_repo.dart';

class PharmaApi {
  String medicineStore;
  DB db;
  PharmaApi(this.db, this.medicineStore);
  Handler get router {
    final router = Router();

    //============= /medicine/test  ROUTE

    router.get('/medicine/test', (Request req) async {
      /*  // final authDetails = req.context['authDetails'] as JWT;
      try {
        final payload = await req.readAsString();
        print(payload);
        final Map<String, dynamic> querybody = json.decode(payload);
        print(querybody);

        List<Medicine> medicinesInfo = await findMedicineByParams(db, medicineStore, querybody);
        print("founded_medicine------:" + medicinesInfo.toString());
        print(medicinesInfo.toString());
        String response = "";
        for (int i = 0; i < medicinesInfo.length; i++) {
          response = response + (medicinesInfo[i].toJson().toString());
        }

        return Response.ok(response, headers: {
          'content-type': 'application/json',
        });
      } catch (e) {
        print('----------end test  Request--------------');

        return Response.internalServerError(
            body: '{"error" :" There was a problem test  ." ' +
                e.toString() +
                '" ,"errorNo" :"199991" }');
      }
    }
    */
      // sendMail('ironmask2004@gmail.com', 'Veervication Cdoe from Pharma Play',
      //    'The Code is: ${RandomCode.nextInter()} ');
      return Response.internalServerError(
          body: responseErrMsg("medicine test route", "333333"));
    });

    //============= /medicines/INFO ROUTE
    router.get('/info/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      Medicine medicineInfo;
      try {
        medicineInfo = await findMedicineByID(
            authDetails.subject.toString(), db, medicineStore);

        print("founded_medicine------:" + medicineInfo.toString());
      } catch (err) {
        return Response.forbidden(responseErrMsg("$err", "9004"), headers: {
          'content-type': 'application/json',
        });
      }

      final Map<String, dynamic> medicineWithresault = {
        "medicineinfo": medicineInfo.toMap(),
        "requestResult": {'error': 'Success', 'errNO': '200'}
      };

      print(medicineWithresault);
      var jsonString = json.encode(medicineWithresault);

      return Response.ok(jsonString, headers: {
        'content-type': 'application/json',
      });
    });

    //============= /medicine/  ROUTE

    router.get('/medicine/id', (Request req) async {
      //final authDetails = req.context['authDetails'] as JWT;
      print(req.context.toString());
      Medicine medicineInfo;
      final payload = await req.readAsString();
      final Map<String, dynamic> requestBody = json.decode(payload);
      print(requestBody);
      try {
        medicineInfo = await findMedicineByID(
            requestBody['medicineID'].toString(), db, medicineStore);

        print("founded_medicine------:" + medicineInfo.toString());
      } catch (err) {
        return Response.forbidden(responseErrMsg("$err", "9004"), headers: {
          'content-type': 'application/json',
        });
      }

      final Map<String, dynamic> medicineWithresault = {
        "medicineinfo": medicineInfo.toMap(),
        "requestResult": {'error': 'Success', 'errNO': '200'}
      };

      print(medicineWithresault);
      var jsonString = json.encode(medicineWithresault);

      return Response.ok(jsonString, headers: {
        'content-type': 'application/json',
      });
    });

    //============= /medicines/UPDATE  ROUTE

    /* router.post('/update/', (Request req) async {
      String sql;
      Map<String, dynamic> params;
      dynamic resultSet;
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      final payload = await req.readAsString();
      final Map<String, dynamic> medicineInfo = json.decode(payload);
      print(medicineInfo);
      final email = medicineInfo['email'];
      final password = medicineInfo['password'];
      final firstname = medicineInfo['firstname'];
      final lastname = medicineInfo['lastname'];
      final mobile = medicineInfo['mobile'];

      print('-------------------------');
      Medicine oldMedicineInfo = await findMedicineByID(
          authDetails.subject.toString(), db, medicineStore);
      print('-------------------------');
      print("founded_old_medicine_data: ------:" + oldMedicineInfo.toString());
      //print(oldMedicineInfo);
      medicineInfo['updatedate'] = DateTime.now();

      Medicine updatedMedicineInfo =
          oldMedicineInfo.copyWithFromMap(medicineInfo);

      print("updared _medicine_data: ------:" + updatedMedicineInfo.toString());

      if (oldMedicineInfo.email != updatedMedicineInfo.email) {
        if (!EmailValidator.validate(updatedMedicineInfo.email)) {
          return Response(HttpStatus.badRequest,
              body: responseErrMsg("Please provide a vaild  Email", '403'));
        }
        sql =
            "SELECT idx  FROM pharmaplay.$medicineStore WHERE email =  @email  and idx != @idx";
        params = {
          "email": updatedMedicineInfo.email,
          "idx": updatedMedicineInfo.idx
        };
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          print(resultSet.toString());
          return Response.forbidden(responseErrMsg(
              "Email:  $email  was already registerd! with some one else !",
              "403"));
        }
      }

      if (oldMedicineInfo.firstname != updatedMedicineInfo.firstname ||
          oldMedicineInfo.lastname != updatedMedicineInfo.lastname) {
        sql =
            "SELECT idx  FROM pharmaplay.$medicineStore WHERE firstname= @firstname and lastname =  @lastname   and idx != @idx";
        params = {
          "firstname": updatedMedicineInfo.firstname,
          "lastname": updatedMedicineInfo.lastname,
          "idx": updatedMedicineInfo.idx
        };
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          return Response.forbidden(responseErrMsg(
              "Medicine name:  $firstname $lastname  was already takedn for some one else !!",
              "403"));
        }
      }

      if (oldMedicineInfo.mobile != updatedMedicineInfo.mobile) {
        sql =
            "SELECT idx  FROM pharmaplay.$medicineStore WHERE mobile =  @mobile and idx != @idx  ";
        params = {"mobile": mobile, "idx": updatedMedicineInfo.idx};
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          return Response.forbidden(responseErrMsg(
              "mobile Number:  $mobile  was already taken !!", "403"));
        }
      }
      try {
        // updatedMedicineInfo.updatedate = DateTime.now();
        sql =
            'update pharmaplay.$medicineStore SET   id=@id, firstname=@firstname, lastname=@lastname, email=@email, password=@password, salt=@salt, mobile=@mobile, createdate=@createdate, updatedate=@updatedate ,  status=@status 	where idx= @idx returning idx';
        params = updatedMedicineInfo.toMap();
        resultSet = await db.query(sql, values: params);

        print(resultSet.first.toString());
        if (resultSet.length == 0) {
          return Response.forbidden(
              responseErrMsg(' facing error while updating  medicine', "403"));
        }
      } catch (error) {
        print(' error while Updating  medicine  ' + error.toString());
        return Response(HttpStatus.badRequest,
            body: responseErrMsg('error while Updateing  medicine', '403'));
      }
      return Response.ok(
          responseErrMsg("Successfully Updated medicine", "200"));
    });*/

    final handler = Pipeline().addHandler(router);

    //    Pipeline().addMiddleware(checkAuthorisation()).addHandler(router);
    return handler;
  }
}

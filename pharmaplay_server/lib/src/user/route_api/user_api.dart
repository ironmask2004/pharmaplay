import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/user/model/user.dart';
import 'package:pharmaplay_server/src/user/user_repository/user_repo.dart';
import 'package:pharmaplay_server/src/utilites/random_code.dart';

class UserApi {
  String authStore;
  DB db;
  UserApi(this.db, this.authStore);
  Handler get router {
    final router = Router();

    //============= /users/test  ROUTE

    router.post('/test', (Request req) async {
      /*  // final authDetails = req.context['authDetails'] as JWT;
      try {
        final payload = await req.readAsString();
        print(payload);
        final Map<String, dynamic> querybody = json.decode(payload);
        print(querybody);

        List<User> usersInfo = await findUserByParams(db, authStore, querybody);
        print("founded_user------:" + usersInfo.toString());
        print(usersInfo.toString());
        String response = "";
        for (int i = 0; i < usersInfo.length; i++) {
          response = response + (usersInfo[i].toJson().toString());
        }

        return Response.ok(response, headers: {
          'content-type': 'application/json',
        });
      } catch (e) {
        print('----------end test  Request--------------');

        return Response.internalServerError(
            body: '{ \"error\" : \" There was a problem test  .\" ' +
                e.toString() +
                '\" , \"errorNo\" : \"199991\" }');
      }
    }
    */
      sendMail('ironmask2004@gmail.com', 'Veervication Cdoe from Pharma Play',
          'The Code is: ${RandomCode.nextInter()} ');
      return Response.internalServerError(
          body: '{ "VerCode" : " ؟؟؟-؟؟؟ " , "errorNo" : "199991" }');
    });

//============= /users/userstatuslist  ROUTE

    router.post('/userstatuslist', (Request req) async {
      // final authDetails = req.context['authDetails'] as JWT;

      String response = UserStatusEnumMap.toString();

      return Response.ok(response, headers: {
        'content-type': 'application/json',
      });
    });

    //============= /users/INFO ROUTE
    router.get('/info/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      User userInfo;
      try {
        userInfo =
            await findUserByID(authDetails.subject.toString(), db, authStore);

        print("founded_user------:" + userInfo.toString());
      } catch (err) {
        return Response.forbidden(
            '{"requestResult": {"error": "$err", "errNO": "9004"}',
            headers: {
              'content-type': 'application/json',
            });
      }

      final Map<String, dynamic> userWithresault = {
        "userinfo": userInfo.toMap(),
        "requestResult": {'error': 'Success', 'errNO': '200'}
      };

      print(userWithresault);
      var jsonString = json.encode(userWithresault);

      return Response.ok(jsonString, headers: {
        'content-type': 'application/json',
      });
    });

    //============= /users/  ROUTE

    router.post('/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      User userInfo;
      try {
        userInfo =
            await findUserByID(authDetails.subject.toString(), db, authStore);

        print("founded_user------:" + userInfo.toString());
      } catch (err) {
        return Response.forbidden(
            '{"requestResult": {"error": "$err", "errNO": "9004"}',
            headers: {
              'content-type': 'application/json',
            });
      }

      final Map<String, dynamic> userWithresault = {
        "userinfo": userInfo.toMap(),
        "requestResult": {'error': 'Success', 'errNO': '200'}
      };

      print(userWithresault);
      var jsonString = json.encode(userWithresault);

      return Response.ok(jsonString, headers: {
        'content-type': 'application/json',
      });
    });

    //============= /users/UPDATE  ROUTE

    router.post('/update/', (Request req) async {
      String sql;
      Map<String, dynamic> params;
      dynamic resultSet;
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());
      final payload = await req.readAsString();
      final Map<String, dynamic> userInfo = json.decode(payload);
      print(userInfo);
      final email = userInfo['email'];
      final password = userInfo['password'];
      final firstname = userInfo['firstname'];
      final lastname = userInfo['lastname'];
      final mobile = userInfo['mobile'];

      print('-------------------------');
      User oldUserInfo =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print('-------------------------');
      print("founded_old_user_data: ------:" + oldUserInfo.toString());
      //print(oldUserInfo);
      userInfo['updatedate'] = DateTime.now();
      User UpdatedUserInfo = oldUserInfo.copyWithFromMap(userInfo);

      print("updared _user_data: ------:" + UpdatedUserInfo.toString());

      if (oldUserInfo.email != UpdatedUserInfo.email) {
        if (!EmailValidator.validate(UpdatedUserInfo.email)) {
          return Response(HttpStatus.badRequest,
              body: '"{ \"error\" : \"Please provide a vaild  Email \" }"');
        }
        sql =
            "SELECT idx  FROM pharmaplay.$authStore WHERE email =  @email  and idx != @idx";
        params = {"email": UpdatedUserInfo.email, "idx": UpdatedUserInfo.idx};
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          print(resultSet.toString());
          return Response.forbidden(
              "{ \"error\" : \"Email:  $email  was already registerd! with some one else !\" ,  \"errorNo\" : \"403\"  }");
        }
      }

      if (oldUserInfo.firstname != UpdatedUserInfo.firstname ||
          oldUserInfo.lastname != UpdatedUserInfo.lastname) {
        sql =
            "SELECT idx  FROM pharmaplay.$authStore WHERE firstname= @firstname and lastname =  @lastname   and idx != @idx";
        params = {
          "firstname": UpdatedUserInfo.firstname,
          "lastname": UpdatedUserInfo.lastname,
          "idx": UpdatedUserInfo.idx
        };
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          return Response.forbidden(
              "{ \"error\" : \"User name:  $firstname $lastname  was already takedn for some one else !!\" ,  \"errorNo\" : \"403\"  }");
        }
      }

      if (oldUserInfo.mobile != UpdatedUserInfo.mobile) {
        sql =
            "SELECT idx  FROM pharmaplay.$authStore WHERE mobile =  @mobile and idx != @idx  ";
        params = {"mobile": mobile, "idx": UpdatedUserInfo.idx};
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
          return Response.forbidden(
              "{ \"error\" : \"mobile Number:  $mobile  was already taken !!\" ,  \"errorNo\" : \"403\"  }");
        }
      }
      try {
        // UpdatedUserInfo.updatedate = DateTime.now();
        sql =
            'update pharmaplay.$authStore SET   id=@id, firstname=@firstname, lastname=@lastname, email=@email, password=@password, salt=@salt, mobile=@mobile, createdate=@createdate, updatedate=@updatedate ,  status=@status 	where idx= @idx returning idx';
        params = UpdatedUserInfo.toMap();
        resultSet = await db.query(sql, values: params);

        print(resultSet.first.toString());
        if (resultSet.length == 0) {
          return Response.forbidden(
              "{ \"error\" : \" facing error while updating  user\" ,  \"errorNo\" : \"403\"  }");
        }
      } catch (error) {
        print(' error while Updating  user  ' + error.toString());
        return Response(HttpStatus.badRequest,
            body: 'error while Updateing  user');
      }
      return Response.ok(
          "{ \"error\" : \"Successfully Updated user\"   ,  \"errorNo\" : \"200\" }");
    });

    final handler =
        Pipeline().addMiddleware(checkAuthorisation()).addHandler(router);
    return handler;
  }
}

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/user/model/user.dart';
import 'package:pharmaplay_server/src/user/user_repository/user_repo.dart';

class UserApi {
  String authStore;
  DB db;
  UserApi(this.db, this.authStore);
  Handler get router {
    final router = Router();
    //============= /users/INFO ROUTE
    router.get('/info/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      User userInfo =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print("founded_user------:" + userInfo.toString());
      print(userInfo.toJson().toString());
      return Response.ok(userInfo.toJson().toString(), headers: {
        'content-type': 'application/json',
      });
    });

    //============= /users/  ROUTE

    router.post('/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      User userInfo =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print("founded_user------:" + userInfo.toString());
      print(userInfo.toJson().toString());
      return Response.ok(userInfo.toJson().toString(), headers: {
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

      User oldUserInfo =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print("founded_old_user_data: ------:" + oldUserInfo.toString());

      User UpdatedUserInfo = oldUserInfo.copyWithFromMap(userInfo);
      print("updared _user_data: ------:" + UpdatedUserInfo.toString());

      if (oldUserInfo.email != UpdatedUserInfo.email) {
        sql =
            "SELECT idx  FROM pharmaplay.$authStore WHERE email =  @email  and idx != @idx";
        params = {"email": UpdatedUserInfo.email, "idx": UpdatedUserInfo.idx};
        resultSet = await db.query(sql, values: params);

        if (resultSet.length > 0) {
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
      // final id = ObjectId().toString();
      // final salt = generateSalt();
      // final hashedPassword = hashPassword(password, salt);
      try {
        sql =
            'update pharmaplay.$authStore SET   id=@id, firstname=@firstname, lastname=@lastname, email=@email, password=@password, salt=@salt, mobile=@mobile, createdate=@createdate, updatedate=@updatedate 	where idx= @idx returning idx';
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

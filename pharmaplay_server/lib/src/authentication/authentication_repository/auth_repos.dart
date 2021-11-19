library authentication_repository;

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/utilites/random_code.dart';

//----------------------
Future<bool> userVerifyCode(
    String userId, DB db, String authStore, String verificationcode) async {
  print('userId: $userId, $db , $authStore   : $verificationcode ');
  try {
    Map<String, dynamic> params = {
      "userid": userId,
      "verificationcode": verificationcode
    };
    String sql =
        'SELECT userid   FROM pharmaplay.verificationcodes  WHERE userid =  @userid  and verificationcode = @verificationcode ';
    print(userId);
    print(params);
    print(sql);

    dynamic resultSet = await db.query(sql, values: params);

    if (resultSet.length > 0) {
      /*sql =
          'DELETE FROM pharmaplay.verificationcodes WHERE userid =  @userid   and verificationcode = @verificationcode ';
      print(sql);
      resultSet = await db.query(sql, values: params);

      params = {"userid": userId};

      sql =
          'UPDATE pharmaplay.$authStore SET status = @status WHERE id = @userid ';
      params = {"userid": userId, "status": 1};
      print(sql);
      resultSet = await db.query(sql, values: params);
*/
      List<Map<String, dynamic>> paramslist = [];
      List<String> sqllist = [];
      sqllist.add(
          'DELETE FROM pharmaplay.verificationcodes WHERE userid =  @userid   and verificationcode = @verificationcode ');
      paramslist.add(
          params = {"userid": userId, "verificationcode": verificationcode});

      sqllist.add(
          'UPDATE pharmaplay.$authStore SET status = @status WHERE id = @userid ');
      paramslist.add(params = {"userid": userId, "status": 1});

      await db.mutliTransaction(sqllist, paramslist);

      return true;
    } else {
      print(' User with verificationcode: $verificationcode   Not Found ');
      return false;
    }
  } catch (err) {
    print(err.toString());
    rethrow;
  }
}

//----------------------
Future<Response> createUserWithVerifcationCode(
    var userRequestInfo, DB db, String authStore) async {
  final email = userRequestInfo['email'];
  final password = userRequestInfo['password'];
  final firstname = userRequestInfo['firstname'];
  final lastname = userRequestInfo['lastname'];
  final mobile = userRequestInfo['mobile'];

  // Ensure email and password fields are present
  if (email == null || email.isEmpty || password == null || password.isEmpty) {
    // return Response(HttpStatus.badRequest,
    // body: 'Please provide your email and password');

    return Response.forbidden(
        "{ \"error\" : \"Please provide your email and password \" ,  \"errorNo\" : \"403\"  }");
  }
  if (!EmailValidator.validate(email)) {
    return Response(HttpStatus.badRequest,
        body: '"{ \"error\" : \"Please provide a vaild  Email \" }"');
  }

  print(firstname);
  print(lastname);
  if (firstname == null ||
      firstname.isEmpty ||
      lastname == null ||
      lastname.isEmpty) {
    return Response.forbidden(
        "{ \"error\" : \"Please provide your firstname and lastname \" ,  \"errorNo\" : \"403\"  }");
  }

  if (mobile == null || mobile.isEmpty) {
    return Response.forbidden(
        "{ \"error\" : \"Please provide your Mobile Number!! \" ,  \"errorNo\" : \"403\"  }");
  }
  String sql = "SELECT idx  FROM pharmaplay.$authStore WHERE email =  @email ";
  Map<String, dynamic> params = {"email": email};
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length > 0) {
    return Response.forbidden(
        "{ \"error\" : \"Email:  $email  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
  }

  sql =
      "SELECT idx  FROM pharmaplay.$authStore WHERE firstname= @firstname and lastname =  @lastname ";
  params = {"firstname": firstname, "lastname": lastname};
  resultSet = await db.query(sql, values: params);

  if (resultSet.length > 0) {
    return Response.forbidden(
        "{ \"error\" : \"User name:  $firstname $lastname  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
  }

  sql = "SELECT idx  FROM pharmaplay.$authStore WHERE mobile =  @mobile ";
  params = {"mobile": mobile};
  resultSet = await db.query(sql, values: params);

  if (resultSet.length > 0) {
    return Response.forbidden(
        "{ \"error\" : \"mobile Number:  $mobile  was already registerd!!\" ,  \"errorNo\" : \"403\"  }");
  }

  final id = ObjectId().toString();
  final salt = generateSalt();
  final hashedPassword = hashPassword(password, salt);
  String vrifycode;

  List<Map<String, dynamic>> paramslist = [];
  List<String> sqllist = [];

  sqllist.add(
      "insert into  pharmaplay.$authStore (firstname,lastname, id, email, password,salt,mobile, createdate, updatedate) values (@firstname,@lastname, @id, @email, @password,@salt , @mobile ,  @createdate, @updatedate ) returning idx");
  paramslist.add(params = {
    "firstname": firstname,
    "lastname": lastname,
    "id": id,
    "email": email,
    "password": hashedPassword,
    "salt": salt,
    "mobile": mobile,
    "createdate": DateTime.now().millisecondsSinceEpoch,
    "updatedate": DateTime.now().millisecondsSinceEpoch
  });

  sql =
      'SELECT verificationcode  FROM pharmaplay.verificationcodes WHERE userid =  @id  ';
  params = {"id": id};

  resultSet = await db.query(sql, values: params);
  String verificationcode;

  if (resultSet.length == 0) {
    verificationcode = RandomCode.nextInter();
    print(verificationcode);

    paramslist.add(params = {"id": id, "verificationcode": verificationcode});
    // return (resultSet.first['verificationcodes']['verificationcode']);
    sqllist.add(
        'insert into pharmaplay.verificationcodes ( userid,verificationcode ) values (  @id , @verificationcode  )  returning idx ');

    print(id);

    print(sql);
  } else {
    verificationcode = resultSet.first['verificationcodes']['verificationcode'];
  }
  try {
    await db.mutliTransaction(sqllist, paramslist);

    //=====

    // resultSet = await db.query(sql, values: params);

  } catch (err) {
    print(err.toString());
    rethrow;
  }

  return Response.ok(
      "{ \"error\" : \"Successfully registered user $verificationcode\"   ,  \"errorNo\" : \"200\" }");
}

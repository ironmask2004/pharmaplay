library authentication_repository;

import 'package:pharmaplay_server/pharmaplay_server.dart';

//----------------------
Future<int?> changeUserStatus(
    String userId, UserStatus newStatus, String authStore, DB db) async {
  List<Map<String, dynamic>> paramslist = [];
  List<String> sqllist = [];

  sqllist.add(
      'UPDATE pharmaplay.$authStore SET status = @status WHERE id = @userid ');
  paramslist.add({"userid": userId, "status": UserStatusEnumMap[newStatus]});
  print(userId);

  print(sqllist);

  var resault = 0;
  try {
    resault = await db.mutliTransaction(sqllist, paramslist);
  } catch (err) {
    print(err.toString());
    rethrow;
  }
  if (resault == 0) {
    throw ('No Status HAs Been Changed!!!');
  } else {
    return UserStatusEnumMap[newStatus];
  }
}

///-------- resend verfication code

Future<Response> resendVerificationCode(
    var userRequestInfo, DB db, String authStore) async {
  print('----------Start resend Code REquest -------------');

  final email = userRequestInfo['email'];
  final password = userRequestInfo['password'];

  // Ensure email and password fields are present
  if (email == null || email.isEmpty || password == null || password.isEmpty) {
    return Response(HttpStatus.badRequest,
        body: '"{ \"error\" : \"Please provide your email and password\" }"');
  }
  if (!EmailValidator.validate(email)) {
    return Response(HttpStatus.badRequest,
        body: '"{ \"error\" : \"Please provide a vaild  Email \" }"');
  }

  //final user = await store.findOne(where.eq('email', email));
  String sql = "SELECT *  FROM pharmaplay.$authStore WHERE email =  @email ";
  Map<String, dynamic> params = {"email": email};
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length == 0) {
    return Response.forbidden(
        "{ \"error\" : \"Incorrect user  Login\" ,  \"errorNo\" : \"403\"  }");
  }
  print(resultSet.first.toString());

  final user = resultSet.first['$authStore'];

  print('fided user :   ======== ');
  print(user.toString());

  final hashedPassword = hashPassword(password, user['salt']);
  if (hashedPassword != user['password']) {
    return Response.forbidden(
        "{ \"error\" : \"Incorrect  password!!\" ,  \"errorNo\" : \"403\"  }");
  }

  if (user['status'] != 0) {
    return Response.forbidden(
        "{ \"error\" : \"User Email ${user['email']} & Mobile ${user['mobile']}  Already Verifide!!\" ,  \"errorNo\" : \"403\"  }");
  }

  List<Map<String, dynamic>> paramslist = [];
  List<String> sqllist = [];

  sqllist.add(
      "   UPDATE  pharmaplay.$authStore SET     updatedate = @updatedate where id= @id");
  paramslist.add(params = {
    "id": user['id'],
    "updatedate": DateTime.now() //.millisecondsSinceEpoch
  });

  sqllist.add('DELETE  FROM pharmaplay.verificationcodes WHERE userid =  @id ');
  paramslist.add(params = {"id": user['id']});

  String verificationcode = RandomCode.nextInter();
  print(verificationcode);

  paramslist
      .add(params = {"id": user['id'], "verificationcode": verificationcode});
  // return (resultSet.first['verificationcodes']['verificationcode']);
  sqllist.add(
      'insert into pharmaplay.verificationcodes ( userid,verificationcode ) values (  @id , @verificationcode  )  returning idx ');

  print(id);

  print(sql);

  try {
    await db.mutliTransaction(sqllist, paramslist);

    //=====

    // resultSet = await db.query(sql, values: params);

  } catch (err) {
    print(err.toString());
    rethrow;
  }

  try {
    await sendVerificationCodeByMail(verificationcode, user['email']);
  } catch (err) {
    print(err.toString());
    rethrow;
  }

  return Response.ok(
      "{ \"error\" : \"Successfully resend new  user  verificationcode  \"   ,  \"errorNo\" : \"200\" }");
}

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
      print(' User with verificationcode   Not Found ');
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
    "createdate": DateTime.now(),
    "updatedate": DateTime.now() //.millisecondsSinceEpoch
  });

  sqllist
      .add('DELETE  FROM pharmaplay.verificationcodes WHERE userid =  @id  ');
  paramslist.add(params = {"id": id});

  String verificationcode = RandomCode.nextInter();
  print(verificationcode);

  paramslist.add(params = {"id": id, "verificationcode": verificationcode});
  // return (resultSet.first['verificationcodes']['verificationcode']);
  sqllist.add(
      'insert into pharmaplay.verificationcodes ( userid,verificationcode ) values (  @id , @verificationcode  )  returning idx ');

  print(id);

  print(sql);

  try {
    await db.mutliTransaction(sqllist, paramslist);

    //=====

    // resultSet = await db.query(sql, values: params);

  } catch (err) {
    print(err.toString());
    rethrow;
  }
  try {
    await sendVerificationCodeByMail(verificationcode, email);
  } catch (err) {
    print(err.toString());
    rethrow;
  }

  return Response.ok(
      "{ \"error\" : \"Successfully registered user   \"   ,  \"errorNo\" : \"200\" }");
}

///----------------- Login User

Future<Response> userLogin(var userRequestInfo, DB db, String authStore,
    TokenService tokenService) async {
  final email = userRequestInfo['email'];
  final password = userRequestInfo['password'];

  // Ensure email and password fields are present
  if (email == null || email.isEmpty || password == null || password.isEmpty) {
    return Response(HttpStatus.badRequest,
        body: '"{ \"error\" : \"Please provide your email and password\" }"');
  }
  if (!EmailValidator.validate(email)) {
    return Response(HttpStatus.badRequest,
        body: '"{ \"error\" : \"Please provide a vaild  Email \" }"');
  }

  //final user = await store.findOne(where.eq('email', email));
  String sql = "SELECT *  FROM pharmaplay.$authStore WHERE email =  @email ";
  Map<String, dynamic> params = {"email": email};
  dynamic resultSet = await db.query(sql, values: params);

  if (resultSet.length == 0) {
    return Response.forbidden(
        "{ \"error\" : \"Incorrect user  Login\" ,  \"errorNo\" : \"403\"  }");
  }
  print(resultSet.first.toString());

  final user = resultSet.first['$authStore'];
  // User Myuser = User.fromMap(user);

  // print("My userrrrrr: " + Myuser.toString());

  print('fided user :   ======== ');
  print(user.toString());

  final hashedPassword = hashPassword(password, user['salt']);
  if (hashedPassword != user['password']) {
    return Response.forbidden(
        "{ \"error\" : \"Incorrect  password!!\" ,  \"errorNo\" : \"403\"  }");
  }

  if (user['status'] == 0) {
    print(userRequestInfo['verificationcode']);
    if (userRequestInfo['verificationcode'] == null) {
      return Response.forbidden(
          "{ \"error\" : \"User Need Verifcation!\" ,  \"errorNo\" : \"403\"  }");
    } else {
      print('user code verificationcode');
      bool ans = await userVerifyCode(
          user['id'], db, authStore, userRequestInfo['verificationcode']);

      if (!ans) {
        return Response.forbidden(
            "{ \"error\" : \"User   verification Code Error!!!\" ,  \"errorNo\" : \"403\"  }");
      }
    }
  }

//---change status to logedin
  if (user['status'] != UserStatusEnumMap[UserStatus.loggedIn]) {
    try {
      user['status'] = await changeUserStatus(
          user['id'], UserStatus.loggedIn, authStore, db);
    } catch (e) {
      return Response.internalServerError(
          body:
              '{ \"error\" : \" There was a problem change status to  loggedIn. Please try again.\" ' +
                  e.toString() +
                  '\" , \"errorNo\" : \"199991\" }');
    }
  }
//---

  // Generate JWT and send with response
  print('User ID:' + user['id']);
  // final userId = (user['id'] as ObjectId).toHexString();
  final userId = ObjectId.fromHexString(user['id']).toString();
  print('------User ID:---' + userId);
  try {
    final tokenPair = await tokenService.createTokenPair(userId);
    final userWithToken = User.fromMap(user).toJson();
    userWithToken['token'] = tokenPair.toJson()['token'];
    userWithToken['refreshToken'] = tokenPair.toJson()['refreshToken'];
    userWithToken["'error'"] = "\"" + 'Suucess' + "\"";
    userWithToken["'errorNo'"] = "\"" + '200' + "\"";

    var jsonString = json.encode(userWithToken);

    print('-----======================================--' + jsonString);
    return Response.ok(jsonString, headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
    });
  } catch (e) {
    print('----------end Login Request--------------');

    return Response.internalServerError(
        body:
            '{ \"error\" : \" There was a problem logging you in. Please try again.\" ' +
                e.toString() +
                '\" , \"errorNo\" : \"199991\" }');
  }
}

//==================mLogout user ==================//
Future<Response> userLogout(
    var auth, String authStore, DB db, TokenService tokenService) async {
  if (auth == null) {
    return Response.forbidden(
        '"{ \"error\" : \"Not authorised to perform this operation."  ,  \"errorNo\" : \"403\" }");');
  }

  final userId = ((auth as JWT)).subject.toString();
  try {
    Map<dynamic, dynamic> result =
        await tokenService.AllRefreshTokenByScanUserId(userId);
    print('llllllllllllllllllllll' + result.toString());
    print(result.length);
    if (result.length == 1) {
//---change status to logedout

      try {
        await changeUserStatus(userId, UserStatus.loggedOut, authStore, db);
      } catch (e) {
        return Response.internalServerError(
            body:
                '{ \"error\" : \" There was a problem change status to  loggedOut  Please try again.\" ' +
                    e.toString() +
                    '\" , \"errorNo\" : \"199991\" }');
      }
//---
    }
  } catch (e) {
    return Response.internalServerError(
        body:
            '{ \"error\" : \"There was an issue getting sessions  out $e. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
  }

  try {
    print('iiiiiiiiiiiiiiiiiiiiiii    subject   rrrrrrrrrrrr:  $userId');

    await tokenService.removeRefreshToken(
        ((auth as JWT)).jwtId.toString(), userId);
  } catch (e) {
    return Response.internalServerError(
        body:
            '{ \"error\" : \"There was an issue logging out. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
  }

  return Response.ok(
      '{ \"error\" : \"Successfully Loggedout user\"   ,  \"errorNo\" : \"200\" }');
}

//=========== User Unrigster ====================//

userunRegister(var auth, JWT authDetails, String authStore, DB db,
    TokenService tokenService) async {
  print('Unirgster id : $auth  ::::: JWT $authDetails');
  try {
//-----------
    final String id = authDetails.subject.toString();
    String sql =
        "delete  FROM pharmaplay.$authStore WHERE id =  @id returning 1 ";
    Map<String, dynamic> params = {"id": id};
    dynamic resultSet = await db.query(sql, values: params);

    if (resultSet.length == 0) {
      return Response.forbidden(
          "{ \"error\" : \"Failed to remove user\" ,  \"errorNo\" : \"403\"  }");
    }
    print(resultSet.first.toString());
//------------
    final userId = ((auth as JWT)).subject.toString();
    print(userId);
    await tokenService.removeAllRefreshTokenByUserId(userId);
  } catch (e) {
    return Response.internalServerError(
        body:
            '{ \"error\" : \"There was an issue unregistering  user. Please check and try again.\"   ,  \"errorNo\" : \"199991\" }');
  }

  return Response.ok(
      '{ \"error\" : \"Successfully Unrigested  user \"   ,  \"errorNo\" : \"200\" }');
}

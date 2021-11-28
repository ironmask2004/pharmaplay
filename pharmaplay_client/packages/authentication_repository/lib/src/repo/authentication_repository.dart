import 'dart:async';
import 'package:authentication_repository/src/api/authentication_api.dart';
import 'package:authentication_repository/src/model/api_error.dart';
import 'package:authentication_repository/src/model/token_pair.dart';
import 'package:dartz/dartz.dart' as dartz;

import 'package:authentication_repository/src/model/api_response.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository(this.loggedinFlag, this.baseUrl);

  final bool loggedinFlag;
  final String baseUrl;
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));

    //bool loggedinFlag = await MySharedPreferences.instance.getBooleanValue("loggedin");
    if (loggedinFlag) {
      yield AuthenticationStatus.authenticated;
    } else {
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<dartz.Either<ApiError, TokenPair>> logIn(
      {required String email, required String password}) async {
    ApiResponse _apiResponse = ApiResponse();
    ApiError _apiError;

    var _loginUserResponse;

    try {
      //TokenPair _tokenInfo;
      _loginUserResponse = await loginUser(email, password, baseUrl);

      return _loginUserResponse.fold((left) {
        print((left.ApiError as ApiError).error.toString());

        _controller.add(AuthenticationStatus.unauthenticated);

        return (left);
      }, (right) {
        //showInSnackBar(context, ("Login Successs!!"));
        var _tokenPair = TokenPair.fromMap(right);
        _controller.add(AuthenticationStatus.authenticated);
        return (_tokenPair);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      // throw (err);
      return dartz.left(ApiError(error: '$err', errorNo: '1900202'));
      // showInSnackBar(context, err.toString());
    }
  }

  Future<void> logInByID({required String userID}) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}

mixin _email {}

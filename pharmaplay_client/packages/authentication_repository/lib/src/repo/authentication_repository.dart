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

  Future<dartz.Either<ApiResponse, TokenPair>> logIn(
      {required String email, required String password}) async {
    ApiResponse _apiResponse = ApiResponse();
    //-----

    final dartz.Either<ApiResponse, TokenPair> _tokenInfo;
    try {
      //TokenPair _tokenInfo;
      _tokenInfo = await loginUser(email, password, baseUrl);

      _tokenInfo.fold((left) {
        print((left.ApiError as ApiError).error.toString());
        _controller.add(AuthenticationStatus.unauthenticated);
        return (left);
      }, (right) {
        //showInSnackBar(context, ("Login Successs!!"));
        _controller.add(AuthenticationStatus.authenticated);
        return (right);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      throw (err);
      // showInSnackBar(context, err.toString());
    }
    return dartz.left(_apiResponse);
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

import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationLandingRequested>(_onAuthenticationLandingRequested);
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationSignUpRequested>(_onAuthenticationSignUpRequested);

    authRepoStateubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(
          status.status, status.tokenPair ?? TokenPair.empty())),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthRepoState> authRepoStateubscription;

  @override
  Future<void> close() {
    authRepoStateubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('changed status ${event.status}');
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        print("999999999999999999999999999999999999999999999999999999999999" +
            event.tokenPair!.tokenId);
        if (event.tokenPair!.tokenId == '') {
          print('TokinId is Empty');
          return emit(AuthenticationState.unauthenticated());
        }
        User? user = await _tryGetUser(event.tokenPair!.tokenId);
        print('Get user returnd 9999999');

        // print('try to Get User id : ${user.id}');
        if (user != null) {
          print(user.toString());
          MySharedPreferences.instance
              .setStringValue("tokenId", event.tokenPair!.tokenId);
          MySharedPreferences.instance
              .setStringValue("refreshToken", event.tokenPair!.refreshToken);

          print('Saved try to Get User : ${user.id}');
          //MySharedPreferences.instance.setStringValue("password", getPassword);
          MySharedPreferences.instance.setBooleanValue("loggedIn", true);
          return emit(AuthenticationState.authenticated(event.tokenPair!));
        } else {
          print('unauthenticated--------------------');
          return emit(AuthenticationState.unauthenticated());
        }

      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  _onAuthenticationSignUpRequested(
      AuthenticationSignUpRequested event, Emitter<AuthenticationState> emit) {
    emit(const AuthenticationState.authenticationSignUp());
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
    print('LOOOOOOgOOOOOUT!!');
    MySharedPreferences.instance.removeValue("tokenId");
    MySharedPreferences.instance.removeValue("refreshToken");
    //MySharedPreferences.instance.setStringValue("password", getPassword);
    MySharedPreferences.instance.setBooleanValue("loggedIn", false);
    print('LOOOOOOgOOOOOUT!! ---- outttt');
  }

  void _onAuthenticationLandingRequested(
    AuthenticationLandingRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('Start LAnding 11');
    // var userId = await MySharedPreferences.instance.getStringValue("user_id");
    //MySharedPreferences.instance.setStringValue("password", getPassword);
    bool loggedInFlag =
        await MySharedPreferences.instance.getBooleanValue("loggedIn");
    if (loggedInFlag) {
      print('Start LAnding 10000');
      String tokenId =
          await MySharedPreferences.instance.getStringValue("tokenId");
      String refreshToken =
          await MySharedPreferences.instance.getStringValue("refreshToken");

      TokenPair _tokenPair = TokenPair(tokenId, refreshToken);
      print('TokenPair: ${_tokenPair.tokenId}  ${_tokenPair.refreshToken} ');

      if (_tokenPair.isEmpty()) {
        print('Start LAnding 22');
        print('TokenPair: isEmpty');
        // emit(const AuthenticationState.unknown());
      } else {
        try {
          await _authenticationRepository.logInByID(tokenPair: _tokenPair);
          emit(AuthenticationState.authenticated((_tokenPair)));

          // emit();
        } catch (_) {
          emit(const AuthenticationState.unauthenticated());
        }
      }
    } else {
      print('131313');
      emit(const AuthenticationState.unauthenticated());
    }
    print('Start LAnding 33');
  }

  Future<User?> _tryGetUser(String userId) async {
    print(
        'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxx User Id to try get :$userId');

    final _getUserByIdResponse;

    try {
      _getUserByIdResponse = await _userRepository.getUserById(tokenId: userId);

      return _getUserByIdResponse.fold((left) {
        print('left33');
        // return (left);
        print(left.toJson().toString());

        print(left.toString());
        return (left);
      }, (right) {
        //showInSnackBar(context, ("Login Successs!!"));
        print('right');
        return (null);
      });
    } catch (err) {
      print('Error connectiing to server ' + err.toString());
      rethrow;
      // showInSnackBar(context, err.toString());
    }
  }
}

import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
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

    AuthRepoStateubscription = _authenticationRepository.status.listen(
      (status) =>
          add(AuthenticationStatusChanged(status.status, status.tokenPair)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthRepoState> AuthRepoStateubscription;

  @override
  Future<void> close() {
    AuthRepoStateubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        print("999999999999999999999999999999999999999999999999999999999999" +
            event.tokenPair!.tokenId);
        final user = await _tryGetUser(event.tokenPair!.tokenId);
        // print('try to Get User id : ${user.id}');
        if (user!.id != null) {
          MySharedPreferences.instance
              .setStringValue("tokenId", event.tokenPair!.tokenId);
          MySharedPreferences.instance
              .setStringValue("refreshToken", event.tokenPair!.refreshToken);

          print('Saved try to Get User : ${user.id}');
          //MySharedPreferences.instance.setStringValue("password", getPassword);
          MySharedPreferences.instance.setBooleanValue("loggedin", true);
          return emit(AuthenticationState.authenticated(event.tokenPair!));
        } else {
          print('unauthenticated--------------------');
          return emit(const AuthenticationState.unauthenticated());
        }

      default:
        return emit(const AuthenticationState.unknown());
    }
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
    MySharedPreferences.instance.setBooleanValue("loggedin", false);
  }

  void _onAuthenticationLandingRequested(
    AuthenticationLandingRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('Start LAnding');
    // var userId = await MySharedPreferences.instance.getStringValue("user_id");
    //MySharedPreferences.instance.setStringValue("password", getPassword);
    bool logFlag =
        await MySharedPreferences.instance.getBooleanValue("loggedin");
    if (logFlag) {
      String tokenId =
          await MySharedPreferences.instance.getStringValue("tokenId");
      String refreshToken =
          await MySharedPreferences.instance.getStringValue("refreshToken");

      TokenPair _tokenPair = TokenPair(tokenId, refreshToken);
      print('TokenPair: ${_tokenPair.tokenId}  ${_tokenPair.refreshToken} ');

      try {
        await _authenticationRepository.logInByID(tokenPair: _tokenPair);
        emit(AuthenticationState.authenticated((_tokenPair)));

        // emit();
      } catch (_) {
        emit(const AuthenticationState.unknown());
      }
/*
      final user = await _tryGetUser(userId: userId);
      if (user != null) {
        print('try get user from landifng ${user}');
        return emit(AuthenticationState.authenticated(user));
      } else {
        print('try get user from landifng NULLL ');
        return emit(const AuthenticationState.unknown());
      }*/
    }
  }

  Future<User00?> _tryGetUser(String userId) async {
    try {
      final user;
      print(
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxx User Id to try get :$userId');

      user = await _userRepository.getUser(userId);

      return user;
    } catch (_err) {
      print('Eroror Happend: ' + _err.toString());
      return null;
    }
  }
}

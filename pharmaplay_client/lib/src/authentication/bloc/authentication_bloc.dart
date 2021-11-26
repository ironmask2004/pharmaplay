import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_client/src/utiites/shared_pref.dart';
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

    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
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
        final user = await _tryGetUser(userId: state.user.id);
        print('try to Get User : ${user}');
        if (user!.id != '-') {
          MySharedPreferences.instance.setStringValue("user_id", user.id);
          print('Saved try to Get User : ${user.id}');
          //MySharedPreferences.instance.setStringValue("password", getPassword);
          MySharedPreferences.instance.setBooleanValue("loggedin", true);
          return emit(AuthenticationState.authenticated(user));
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
    MySharedPreferences.instance.removeValue("user_id");
    //MySharedPreferences.instance.setStringValue("password", getPassword);
    MySharedPreferences.instance.setBooleanValue("loggedin", false);
  }

  void _onAuthenticationLandingRequested(
    AuthenticationLandingRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    print('Start LAnding');
    var userId = await MySharedPreferences.instance.getStringValue("user_id");
    //MySharedPreferences.instance.setStringValue("password", getPassword);
    bool logFlag =
        await MySharedPreferences.instance.getBooleanValue("loggedin");
    if (logFlag) {
      try {
        await _authenticationRepository.logInByID(userID: userId);
        emit(AuthenticationState.authenticated(User00(userId)));

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

  Future<User00?> _tryGetUser({String? userId}) async {
    try {
      final user;
      print('User Id to try get :$userId');
      if (userId != '-') {
        user = await _userRepository.getUser(user_id: userId);
      } else {
        user = await _userRepository.getUser();
      }
      return user;
    } catch (_err) {
      print(_err.toString());
      return null;
    }
  }
}

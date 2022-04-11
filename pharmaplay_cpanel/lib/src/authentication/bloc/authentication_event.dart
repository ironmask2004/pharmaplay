part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status, this.tokenPair);

  final AuthenticationStatus status;
  final TokenPair? tokenPair;

  @override
  List<Object> get props => [status, tokenPair ?? TokenPair.empty()];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticateSignInRequested extends AuthenticationEvent {}

class AuthenticationLandingRequested extends AuthenticationEvent {}

class AuthenticationSignUpRequested extends AuthenticationEvent {}

class AuthenticationForgotRequested extends AuthenticationEvent {}

//class AuthenticationSettingsRequested extends AuthenticationEvent {}

//class AuthenticationSettingsDoneRequested extends AuthenticationEvent {}

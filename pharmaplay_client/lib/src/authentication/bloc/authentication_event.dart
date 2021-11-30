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

class AuthenticationLandingRequested extends AuthenticationEvent {}

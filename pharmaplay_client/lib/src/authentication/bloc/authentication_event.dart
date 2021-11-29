part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status, this.userId);

  final AuthenticationStatus status;
  final String? userId;

  @override
  List<Object> get props => [status, userId!];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationLandingRequested extends AuthenticationEvent {}

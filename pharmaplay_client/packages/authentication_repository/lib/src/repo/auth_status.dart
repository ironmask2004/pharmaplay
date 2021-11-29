part of 'authentication_repository.dart';

class AuthRepoState extends Equatable {
  const AuthRepoState._(
      {this.status = AuthenticationStatus.unknown, this.userId = null});

  const AuthRepoState.unknown() : this._();

  const AuthRepoState.authenticated(String userId)
      : this._(status: AuthenticationStatus.authenticated, userId: userId);

  const AuthRepoState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final String? userId;

  @override
  List<Object> get props => [status, userId!];
}

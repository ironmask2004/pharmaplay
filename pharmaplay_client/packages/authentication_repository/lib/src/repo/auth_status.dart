part of 'authentication_repository.dart';

class AuthRepoState extends Equatable {
  const AuthRepoState._(
      {this.status = AuthenticationStatus.unknown, this.tokenPair = null});

  const AuthRepoState.unknown() : this._();

  const AuthRepoState.authenticated(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.authenticated, tokenPair: tokenPair);

  const AuthRepoState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final TokenPair? tokenPair;

  @override
  List<Object> get props => [status, tokenPair!];
}

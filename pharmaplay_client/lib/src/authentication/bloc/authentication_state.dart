part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.tokenPair});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.authenticated, tokenPair: tokenPair);

  const AuthenticationState.unauthenticated(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.unauthenticated, tokenPair: tokenPair);

  final AuthenticationStatus status;
  final TokenPair? tokenPair;

  @override
  List<Object> get props => [status, tokenPair ?? TokenPair.empty()];
}

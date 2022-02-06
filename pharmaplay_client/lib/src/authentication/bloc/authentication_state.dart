part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.tokenPair});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticationSignUp()
      : this._(status: AuthenticationStatus.authenticateSignUp);

  const AuthenticationState.authenticationSignIn()
      : this._(status: AuthenticationStatus.authenticateSignIn);

  /*const AuthenticationState.authenticationSettings()
      : this._(status: AuthenticationStatus.authenticationSettings);

  const AuthenticationState.authenticationSettingsDone()
      : this._(status: AuthenticationStatus.authenticationSettingsDone);
*/
  const AuthenticationState.authenticationForgotPassword()
      : this._(status: AuthenticationStatus.authenticationForgotPassword);

  const AuthenticationState.authenticateConfirmCode(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.authenticateConfirmCode,
            tokenPair: tokenPair);

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

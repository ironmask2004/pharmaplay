part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  AuthenticationState._(
      {this.status = AuthenticationStatus.unknown, this.tokenPair, this.user});

  final AuthenticationStatus status;
  final TokenPair? tokenPair;
  final User? user;

  AuthenticationState.unknown(TokenPair tokenPair)
      : this._(status: AuthenticationStatus.unknown, tokenPair: tokenPair);

  AuthenticationState.authenticationSignUp()
      : this._(status: AuthenticationStatus.authenticateSignUp);

  AuthenticationState.authenticationSignIn()
      : this._(status: AuthenticationStatus.authenticateSignIn);

  /*const AuthenticationState.authenticationSettings()
      : this._(status: AuthenticationStatus.authenticationSettings);

  const AuthenticationState.authenticationSettingsDone()
      : this._(status: AuthenticationStatus.authenticationSettingsDone);
*/
  AuthenticationState.authenticationForgotPassword()
      : this._(status: AuthenticationStatus.authenticationForgotPassword);

  AuthenticationState.authenticateConfirmCode(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.authenticateConfirmCode,
            tokenPair: tokenPair);

  AuthenticationState.authenticated(TokenPair tokenPair, User user)
      : this._(
            status: AuthenticationStatus.authenticated,
            tokenPair: tokenPair,
            user: user);

  AuthenticationState.unauthenticated(TokenPair tokenPair)
      : this._(
            status: AuthenticationStatus.unauthenticated, tokenPair: tokenPair);

  @override
  List<Object> get props =>
      [status, tokenPair ?? TokenPair.empty(), user ?? User.Guest()];
}

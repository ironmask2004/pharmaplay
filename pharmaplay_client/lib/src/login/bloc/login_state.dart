part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.errMsg = ''});

  final FormzStatus status;
  final Email email;
  final Password password;
  final String errMsg;

  LoginState copyWith(
      {FormzStatus? status, Email? email, Password? password, String? errMsg}) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, email, password, errMsg];
}

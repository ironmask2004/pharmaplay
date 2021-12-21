part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.status = FormzStatus.pure,
      this.firstname = const InputString.pure(),
      this.lastname = const InputString.pure(),
      this.mobile = const Mobile.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const Password.pure(),
      this.errMsg = ''});

  final FormzStatus status;
  final InputString firstname;
  final InputString lastname;
  final Mobile mobile;
  final Email email;
  final Password password;
  final Password confirmPassword;

  final String errMsg;

  LoginState copyWith(
      {FormzStatus? status,
      InputString? firstname,
      InputString? lastname,
      Mobile? mobile,
      Email? email,
      Password? password,
      Password? confirmPassword,
      String? errMsg}) {
    return LoginState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [
        status,
        firstname,
        lastname,
        mobile,
        email,
        password,
        confirmPassword,
        errMsg
      ];
}

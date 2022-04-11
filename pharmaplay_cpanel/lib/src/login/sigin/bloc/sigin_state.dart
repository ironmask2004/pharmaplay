part of 'sigin_bloc.dart';

class SiginState extends Equatable {
  const SiginState(
      {this.status = FormzStatus.pure,
      this.firstname = const InputString.pure(),
      this.lastname = const InputString.pure(),
      this.mobile = const Mobile.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmPassword = const Password.pure(),
      this.confirmCode = const InputString.pure(),
      this.errMsg = ''});

  final FormzStatus status;
  final InputString firstname;
  final InputString lastname;
  final Mobile mobile;
  final Email email;
  final Password password;
  final Password confirmPassword;
  final InputString confirmCode;

  final String errMsg;

  SiginState copyWith(
      {FormzStatus? status,
      InputString? firstname,
      InputString? lastname,
      Mobile? mobile,
      Email? email,
      Password? password,
      Password? confirmPassword,
      InputString? confirmCode,
      String? errMsg}) {
    return SiginState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmCode: confirmCode ?? this.confirmCode,
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
        confirmCode,
        errMsg
      ];
}

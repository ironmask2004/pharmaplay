part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.errMsg = ''});

  final FormzStatus status;

  final Email email;

  final String errMsg;

  ForgotPasswordState copyWith(
      {FormzStatus? status,
      InputString? firstname,
      InputString? lastname,
      Mobile? mobile,
      Email? email,
      Password? password,
      Password? confirmPassword,
      InputString? confirmCode,
      String? errMsg}) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, email, errMsg];
}

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
      {FormzStatus? status, Email? email, String? errMsg}) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, email, errMsg];
}

part of 'confirm_code_bloc.dart';

class ConfirmCodeState extends Equatable {
  const ConfirmCodeState(
      {this.status = FormzStatus.pure,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmCode = const InputString.pure(),
      this.errMsg = ''});

  final FormzStatus status;
  final Email email;
  final Password password;
  final InputString confirmCode;

  final String errMsg;

  ConfirmCodeState copyWith(
      {FormzStatus? status,
      Email? email,
      Password? password,
      InputString? confirmCode,
      String? errMsg}) {
    return ConfirmCodeState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmCode: confirmCode ?? this.confirmCode,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object> get props => [status, email, password, confirmCode, errMsg];
}

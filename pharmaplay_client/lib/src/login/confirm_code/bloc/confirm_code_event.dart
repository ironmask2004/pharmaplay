part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();

  @override
  List<Object> get props => [];
}

class ConfirmFormEmailChanged extends ConfirmCodeEvent {
  const ConfirmFormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ConfirmFormPasswordChanged extends ConfirmCodeEvent {
  const ConfirmFormPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmCodeChanged extends ConfirmCodeEvent {
  const ConfirmCodeChanged(this.confirmCode);

  final String confirmCode;

  @override
  List<Object> get props => [confirmCode];
}

class ConfirmCodeSubmitted extends ConfirmCodeEvent {
  const ConfirmCodeSubmitted();
}

class ResendConfirmCodeSubmitted extends ConfirmCodeEvent {
  const ResendConfirmCodeSubmitted();
}

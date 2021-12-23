part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class SignUpFirstnameChanged extends LoginEvent {
  const SignUpFirstnameChanged(this.firstname);

  final String firstname;

  @override
  List<Object> get props => [firstname];
}

class SignUpLastnameChanged extends LoginEvent {
  const SignUpLastnameChanged(this.lastname);

  final String lastname;

  @override
  List<Object> get props => [lastname];
}

class SignUpEmailChanged extends LoginEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends LoginEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends LoginEvent {
  const SignUpConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class SignUpMobileChanged extends LoginEvent {
  const SignUpMobileChanged(this.mobile);

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class SignUpSubmitted extends LoginEvent {
  const SignUpSubmitted();
}

class ConfirmCodeChanged extends LoginEvent {
  const ConfirmCodeChanged(this.confirmCode);

  final String confirmCode;

  @override
  List<Object> get props => [confirmCode];
}

class ForgotEmailChanged extends LoginEvent {
  const ForgotEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ConfirmFormEmailChanged extends LoginEvent {
  const ConfirmFormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ConfirmFormPasswordChanged extends LoginEvent {
  const ConfirmFormPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmCodeSubmitted extends LoginEvent {
  const ConfirmCodeSubmitted();
}

class ResendConfirmCodeSubmitted extends LoginEvent {
  const ResendConfirmCodeSubmitted();
}

class ForgotPasswordSubmitted extends LoginEvent {
  const ForgotPasswordSubmitted();
}

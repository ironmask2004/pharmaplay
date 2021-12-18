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

class SignUpFirstNameChanged extends LoginEvent {
  const SignUpFirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class SignUpLastNameChanged extends LoginEvent {
  const SignUpLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
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

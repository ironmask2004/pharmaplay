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

class LoginFirstNameChanged extends LoginEvent {
  const LoginFirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LoginLastNameChanged extends LoginEvent {
  const LoginLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class LoginConfirmPasswordChanged extends LoginEvent {
  const LoginConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class LoginMobileChanged extends LoginEvent {
  const LoginMobileChanged(this.mobile);

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class SignUpSubmitted extends LoginEvent {
  const SignUpSubmitted();
}

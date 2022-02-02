part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupEmailChanged extends SignupEvent {
  const SignupEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignupPasswordChanged extends SignupEvent {
  const SignupPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}

class SignUpFirstnameChanged extends SignupEvent {
  const SignUpFirstnameChanged(this.firstname);

  final String firstname;

  @override
  List<Object> get props => [firstname];
}

class SignUpLastnameChanged extends SignupEvent {
  const SignUpLastnameChanged(this.lastname);

  final String lastname;

  @override
  List<Object> get props => [lastname];
}

class SignUpEmailChanged extends SignupEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignupEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends SignupEvent {
  const SignUpConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class SignUpMobileChanged extends SignupEvent {
  const SignUpMobileChanged(this.mobile);

  final String mobile;

  @override
  List<Object> get props => [mobile];
}

class SignUpSubmitted extends SignupEvent {
  const SignUpSubmitted();
}

class ConfirmCodeChanged extends SignupEvent {
  const ConfirmCodeChanged(this.confirmCode);

  final String confirmCode;

  @override
  List<Object> get props => [confirmCode];
}

class ForgotEmailChanged extends SignupEvent {
  const ForgotEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ConfirmFormEmailChanged extends SignupEvent {
  const ConfirmFormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class ConfirmFormPasswordChanged extends SignupEvent {
  const ConfirmFormPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmCodeSubmitted extends SignupEvent {
  const ConfirmCodeSubmitted();
}

class ResendConfirmCodeSubmitted extends SignupEvent {
  const ResendConfirmCodeSubmitted();
}

class ForgotPasswordSubmitted extends SignupEvent {
  const ForgotPasswordSubmitted();
}

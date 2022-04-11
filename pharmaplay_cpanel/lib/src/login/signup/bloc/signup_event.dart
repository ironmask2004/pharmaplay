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

class SignUpConfirmCodeChanged extends SignupEvent {
  const SignUpConfirmCodeChanged(this.confirmCode);

  final String confirmCode;

  @override
  List<Object> get props => [confirmCode];
}

class SignUpForgotEmailChanged extends SignupEvent {
  const SignUpForgotEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpConfirmFormEmailChanged extends SignupEvent {
  const SignUpConfirmFormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpConfirmFormPasswordChanged extends SignupEvent {
  const SignUpConfirmFormPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpCConfirmCodeSubmitted extends SignupEvent {
  const SignUpCConfirmCodeSubmitted();
}

class ResendSignUpCConfirmCodeSubmitted extends SignupEvent {
  const ResendSignUpCConfirmCodeSubmitted();
}

class SignupForgotPasswordSubmitted extends SignupEvent {
  const SignupForgotPasswordSubmitted();
}

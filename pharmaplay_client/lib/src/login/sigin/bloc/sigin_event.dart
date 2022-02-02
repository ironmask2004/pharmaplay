part of 'sigin_bloc.dart';

abstract class SiginEvent extends Equatable {
  const SiginEvent();

  @override
  List<Object> get props => [];
}

class SiginEmailChanged extends SiginEvent {
  const SiginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SiginPasswordChanged extends SiginEvent {
  const SiginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends SiginEvent {
  const LoginSubmitted();
}

class SignUpSubmitted extends SiginEvent {
  const SignUpSubmitted();
}

class ForgotPasswordSubmitted extends SiginEvent {
  const ForgotPasswordSubmitted();
}

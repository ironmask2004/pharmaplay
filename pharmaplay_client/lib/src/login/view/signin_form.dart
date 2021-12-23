import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class SignInForm extends StatelessWidget {
  final LoginFormsStyle style = LoginFormsStyle.defaultTemplate;
  SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var logo = Icon(
      Icons.android_rounded,
      size: 80,
    );

    var signInPage = LoginFormsSignInPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        context.read<LoginBloc>().add(const LoginSubmitted());
      },
      onChangedEmail: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      onChangedPassword: (password) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      onPressedSignUp: () {
        context.read<AuthenticationBloc>().add(AuthenticationSignUpRequested());
      },
      onPressedForgot: () {
        context.read<AuthenticationBloc>().add(AuthenticationForgotRequested());
      },
      term: LoginFormsTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('Operation  Failed: ${state.errMsg}')),
            );
        }
      },
      child: SingleChildScrollView(
        child: signInPage,
      ),
    );
  }
}

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class SignUpForm extends StatelessWidget {
  final LoginFormsStyle style = LoginFormsStyle.defaultTemplate;
  SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var logo = Icon(
      Icons.android_rounded,
      size: 80,
    );

    var signUpPage = LoginFormsSignUpPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationLandingRequested());
      },
      onPressedSignUp: () async {
        context.read<LoginBloc>().add(const SignUpSubmitted());
        do {
          print(context.read<LoginBloc>().state.status.toString());
          await Future.delayed(const Duration(seconds: 1), () {}); // ======
        } while (context.read<LoginBloc>().state.status ==
            FormzStatus.submissionInProgress);

        var _frmStatus = context.read<LoginBloc>().state.status;
        print(_frmStatus);

        if (_frmStatus.isSubmissionFailure || _frmStatus.isInvalid) {
          print(' Failed SignUp: ' +
              context.read<LoginBloc>().state.status.toString());
        } else {
          print(context.read<LoginBloc>().state.status.toString());
        }
        ;
      },
      onChangeFirstName: (firstName) =>
          context.read<LoginBloc>().add(SignUpFirstNameChanged(firstName)),
      onChangeLastName: (lastName) =>
          context.read<LoginBloc>().add(SignUpLastNameChanged(lastName)),
      onChangeMobile: (mobile) =>
          context.read<LoginBloc>().add(SignUpMobileChanged(mobile)),
      onchangeEmail: (email) =>
          context.read<LoginBloc>().add(SignUpEmailChanged(email)),
      onChangePassword: (password) =>
          context.read<LoginBloc>().add(SignUpPasswordChanged(password)),
      onChangeConfirmPassword: (confirmPassword) => context
          .read<LoginBloc>()
          .add(SignUpConfirmPasswordChanged(confirmPassword)),
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
        child: signUpPage,
      ),
    );
  }
}

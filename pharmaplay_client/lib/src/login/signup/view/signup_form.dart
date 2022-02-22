import 'dart:html';
import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/login/login.dart';

//import 'package:pharmaplay_client/src/login/login.dart';

class SignUpForm extends StatelessWidget {
  final LoginFormsStyle style = LoginFormsStyle.defaultTemplate.copyWith(
    inlineButtonTextStyle: const TextStyle(color: fontbodyColor),
    primary: primaryColor,
    textFieldTextStyle: const TextStyle(color: fontbodyColor),
  );
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
      buttonTextSignIn: SLang.current.backTo + SLang.current.signIn,
      onPressedSignIn: () {
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationLandingRequested());
      },
      onPressedSignUp: () async {
        context.read<SignupBloc>().add(const SignUpSubmitted());
        /*  do {
          print(context.read<SignupBloc>().state.status.toString());
          await Future.delayed(const Duration(seconds: 1), () {}); // ======
        } while (context.read<SignupBloc>().state.status ==
            FormzStatus.submissionInProgress);

        var _frmStatus = context.read<SignupBloc>().state.status;
        print(_frmStatus);

        if (_frmStatus.isSubmissionFailure || _frmStatus.isInvalid) {
          print(' Failed SignUp: ' +
              context.read<SignupBloc>().state.status.toString());
        } else {
          print(context.read<SignupBloc>().state.status.toString());
        }*/
      },
      onChangeFirstname: (firstname) =>
          context.read<SignupBloc>().add(SignUpFirstnameChanged(firstname)),
      onChangeLastname: (lastname) =>
          context.read<SignupBloc>().add(SignUpLastnameChanged(lastname)),
      onChangeMobile: (mobile) =>
          context.read<SignupBloc>().add(SignUpMobileChanged(mobile)),
      onchangeEmail: (email) =>
          context.read<SignupBloc>().add(SignUpEmailChanged(email)),
      onChangePassword: (password) =>
          context.read<SignupBloc>().add(SignUpPasswordChanged(password)),
      onChangeConfirmPassword: (confirmPassword) => context
          .read<SignupBloc>()
          .add(SignUpConfirmPasswordChanged(confirmPassword)),
      term: LoginFormsTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    return BlocListener<SignupBloc, SignupState>(
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

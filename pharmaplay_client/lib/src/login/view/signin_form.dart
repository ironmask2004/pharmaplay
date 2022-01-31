import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/login/login.dart';
import 'package:pharmaplay_client/src/settings/bloc/settings_bloc.dart';

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
      hintTextUser: SLang.of(context).email,
      hintTextPassword: SLang.of(context).password,
      buttonTextSignIn: SLang.of(context).signIn,
      buttonTextForgotPassword: SLang.of(context).forgotPassword,
      buttonTextSetLanguage: SLang.of(context).SetLanguage,
      buttonTextSignUp: SLang.of(context).signUp,
      onPressedSetLanguage: () {
        /* context
            .read<AuthenticationBloc>()
            .add(AuthenticationSettingsRequested());*/
        Locale currentLocale = context.read<SettingsBloc>().state.uiLocale;
        print('Chaneg Language pressed + current : $currentLocale');
        context.read<SettingsBloc>().add(UILocalChanged(
            currentLocale.languageCode == 'ar'
                ? const Locale('en')
                : const Locale('ar')));
      },
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

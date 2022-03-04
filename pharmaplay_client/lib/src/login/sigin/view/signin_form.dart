import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/dashboard/bloc/dashboard_bloc.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginFormsStyle style = LoginFormsStyle.defaultTemplate.copyWith(
      inlineButtonTextStyle:
          TextStyle(color: context.read<DashBoardBloc>().state.fontbodyColor),
      primary: context.read<DashBoardBloc>().state.primaryColor,
      textFieldTextStyle:
          TextStyle(color: context.read<DashBoardBloc>().state.fontbodyColor),
    );
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
      buttonTextBack: SLang.of(context).back,
      buttonTextSetLanguage: SLang.of(context).SignInchangeLanguage,
      buttonTextSignUp: SLang.of(context).signUp,
      onPressedSetLanguage: () {
        /*context
            .read<AuthenticationBloc>()
            .add(AuthenticationDashBoardRequested());
        Locale currentLocale = context.read<DashBoardBloc>().state.localeUI;
        print('Chaneg Language pressed + current : $currentLocale');
*/
        Locale currentLocale = context.read<DashBoardBloc>().state.localeUI;
        print('Chaneg Language pressed + current : $currentLocale');
        context.read<DashBoardBloc>().add(UILocalChanged(
            currentLocale.languageCode == 'ar'
                ? const Locale('en')
                : const Locale('ar')));
        // context.read<DashBoardBloc>().add(UIThemeModeChanged(ThemeMode.light));
      },
      onPressedSignIn: () {
        context.read<SiginBloc>().add(const LoginSubmitted());
      },
      onChangedEmail: (email) =>
          context.read<SiginBloc>().add(SiginEmailChanged(email)),
      onChangedPassword: (password) =>
          context.read<SiginBloc>().add(SiginPasswordChanged(password)),
      onPressedSignUp: () {
        context.read<AuthenticationBloc>().add(AuthenticationSignUpRequested());
      },
      onPressedForgot: () {
        context.read<AuthenticationBloc>().add(AuthenticationForgotRequested());
      },
      onPressedBack: () {
        context
            .read<AuthenticationBloc>()
            .add(AuthenticationLandingRequested());
        ;
      },
      term: LoginFormsTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    return BlocListener<SiginBloc, SiginState>(
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

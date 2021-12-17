import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class MyLoginForm extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum _State {
  signIn,
  signUp,
  forgot,
  confirm,
  create,
}

class _MyAppState extends State<MyLoginForm> {
  late LoginFormsStyle style;
  bool backfromSighUp = false;
  _State state = _State.signIn;

  @override
  void initState() {
    style = LoginFormsStyle.defaultTemplate;
    super.initState();
  }

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
        setState(() {
          state = _State.signUp;
        });
      },
      onPressedForgot: () {
        setState(() {
          state = _State.forgot;
        });
      },
      socialButtons: [
        LoginFormsSocialButton(
          text: 'Apple',
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_sharp,
            size: 16,
            color: style.socialButtonTextStyle.color,
          ),
          style: style,
        ),
        LoginFormsSocialButton(
          text: 'Google',
          onPressed: () {},
          icon: Icon(
            Icons.android,
            size: 16,
            color: style.socialButtonTextStyle.color,
          ),
          style: style,
        )
      ],
      term: LoginFormsTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var signUpPage = LoginFormsSignUpPage(
      logo: logo,
      style: style,
      onPressedSignIn: () {
        setState(() {
          state = _State.signIn;
        });
      },
      onPressedSignUp: () {
        context.read<LoginBloc>().add(const SignUpSubmitted());

        setState(() {
          state = _State.confirm;
        });
      },
      onChangeFirstName: (firstName) =>
          context.read<LoginBloc>().add(LoginFirstNameChanged(firstName)),
      onChangeLastName: (lastName) =>
          context.read<LoginBloc>().add(LoginLastNameChanged(lastName)),
      onChangeMobile: (mobile) =>
          context.read<LoginBloc>().add(LoginMobileChanged(mobile)),
      onchangeEmail: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      onChangePassword: (password) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      onChangeConfirmPassword: (confirmPassword) => context
          .read<LoginBloc>()
          .add(LoginConfirmPasswordChanged(confirmPassword)),
      term: LoginFormsTerm(
        style: style,
        onPressedTermOfService: () {},
        onPressedPrivacyPolicy: () {},
      ),
    );

    var forgotPasswordPage = LoginFormsForgotPasswordPage(
        logo: logo,
        style: style,
        onPressedNext: () {
          setState(() {
            state = _State.confirm;
          });
        });

    var confirmCodePage = LoginFormsConfirmCodePage(
      logo: logo,
      style: style,
      onPressedNext: () {
        setState(() {
          state = _State.create;
        });
      },
      onPressedResend: () {},
    );

    var createPassword = LoginFormsCreatePasswordPage(
      logo: logo,
      style: style,
      errorTextPassword:
          'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
      onPressedNext: () {
        setState(() {
          state = _State.signIn;
        });
      },
    );

    Widget body;
    switch (state) {
      case _State.signUp:
        backfromSighUp = true;
        body = signUpPage;
        break;
      case _State.forgot:
        body = forgotPasswordPage;
        break;
      case _State.confirm:
        body = confirmCodePage;
        break;
      case _State.create:
        if (backfromSighUp) {
          backfromSighUp = false;
          body = signInPage;
        } else {
          body = createPassword;
        }
        break;
      case _State.signIn:
      default:
        body = signInPage;
        break;
    }

/*
    return MaterialApp(
      title: 'PharmaPlay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.orangeAccent),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Login Forms'),
        ),
        body: SingleChildScrollView(
          child: body,
      ),
        ),
    );*/

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('-- Login Failed: ${state.errMsg}--')),
            );
        }
      },
      child: SingleChildScrollView(
        child: body,
      ),
    );
  }
}

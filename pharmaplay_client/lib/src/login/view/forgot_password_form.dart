import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class ForgotPasswordForm extends StatelessWidget {
  final LoginFormsStyle style = LoginFormsStyle.defaultTemplate;
  ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var logo = Icon(
      Icons.android_rounded,
      size: 80,
    );

    var forgotPasswordPage = LoginFormsForgotPasswordPage(
        logo: logo,
        style: style,
        onChangeEmail: (email) {
          context.read<LoginBloc>().add(ForgotEmailChanged(email));
        },
        onPressedNext: () {
          context.read<LoginBloc>().add(const ForgotPasswordSubmitted());
        });

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
        child: forgotPasswordPage,
      ),
    );
  }
}

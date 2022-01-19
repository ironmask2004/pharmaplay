import 'dart:html';
import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/forgot_password/forgot_password.dart';
//import 'package:pharmaplay_client/src/login/login.dart';

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
          context.read<ForgotPasswordBloc>().add(ForgotEmailChanged(email));
        },
        onPressedNext: () {
          context
              .read<ForgotPasswordBloc>()
              .add(const ForgotPasswordSubmitted());
        });

    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        print(
            '-------------------Subemission status -----------: ${state.status.toString()} ');
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text('Login Failed: ${state.errMsg}')),
            );
        } else if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(' : ${state.errMsg}')),
            );
        } else if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(' ${state.errMsg}')),
            );
        }
      },
      child: SingleChildScrollView(
        child: forgotPasswordPage,
      ),
    );
  }
}

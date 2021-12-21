import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/login.dart';

class ConfirmCodeForm extends StatelessWidget {
  final LoginFormsStyle style = LoginFormsStyle.defaultTemplate;
  final String email;
  final String password;
  ConfirmCodeForm(this.email, this.password, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    var logo = Icon(
      Icons.android_rounded,
      size: 80,
    );

    var confirmCodePage = LoginFormsConfirmCodePage(
      logo: logo,
      style: style,
      onChangedConfirmCode: (confirmCode) {
        context.read<LoginBloc>().add(ConfirmFormEmailChanged(email));
        context.read<LoginBloc>().add(ConfirmFormPasswordChanged(password));
        context.read<LoginBloc>().add(ConfirmCodeChanged(confirmCode));
      },
      onPressedNext: () {
        print('Confirm Pressd!');

        context.read<LoginBloc>().add(const ConfirmCodeSubmitted());
      },
      onPressedResend: () {
        context.read<LoginBloc>().add(const ResendConfirmCodeSubmitted());
      },
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
        child: confirmCodePage,
      ),
    );
  }
}

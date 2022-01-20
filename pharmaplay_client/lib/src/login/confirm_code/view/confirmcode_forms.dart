import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_client/src/login/confirm_code/bloc/confirm_code_bloc.dart';

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
        context.read<ConfirmCodeBloc>().add(ConfirmFormEmailChanged(email));
        context
            .read<ConfirmCodeBloc>()
            .add(ConfirmFormPasswordChanged(password));
        context.read<ConfirmCodeBloc>().add(ConfirmCodeChanged(confirmCode));
      },
      onPressedNext: () {
        print('Confirm Pressd!');

        context.read<ConfirmCodeBloc>().add(const ConfirmCodeSubmitted());
      },
      onPressedResend: () {
        context.read<ConfirmCodeBloc>().add(ConfirmFormEmailChanged(email));
        context
            .read<ConfirmCodeBloc>()
            .add(ConfirmFormPasswordChanged(password));
        context.read<ConfirmCodeBloc>().add(const ConfirmCodeChanged('test'));
        context.read<ConfirmCodeBloc>().add(const ResendConfirmCodeSubmitted());
      },
    );

    return BlocListener<ConfirmCodeBloc, ConfirmCodeState>(
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
        child: confirmCodePage,
      ),
    );
  }
}

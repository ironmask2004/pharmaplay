import 'package:flutter/material.dart';
import 'package:login_forms/login_forms.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pharmaplay_cpanel/src/dashboard/dashboard.dart';
import 'package:pharmaplay_cpanel/src/login/login.dart';

class ConfirmCodeForm extends StatelessWidget {
  final String email;
  final String password;
  const ConfirmCodeForm(this.email, this.password, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final LoginFormsStyle style = LoginFormsStyle.defaultTemplate.copyWith(
      inlineButtonTextStyle:
          TextStyle(color: context.read<DashBoardBloc>().state.fontbodyColor),
      primary: context.read<DashBoardBloc>().state.primaryColor,
      textFieldTextStyle:
          TextStyle(color: context.read<DashBoardBloc>().state.fontbodyColor),
    );

    var logo = const Icon(
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
        context
            .read<ConfirmCodeBloc>()
            .add(ResendConfirmCodeSubmitted(email, password));
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

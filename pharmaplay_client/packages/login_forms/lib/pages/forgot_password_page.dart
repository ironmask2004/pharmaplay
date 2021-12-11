import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_forms/commons.dart';

/// LoginFormsForgotPasswordPage is used to show a page, lets the users could create their password when they forgot it.
class LoginFormsForgotPasswordPage extends StatelessWidget {
  /// See [LoginFormsStyle]
  final LoginFormsStyle style;

  /// Your product logo
  final Widget logo;

  /// The message is used to explain to users.
  final String textMessage;

  /// The text of button to go to next step.
  final String buttonTextNext;

  /// The action of button to go to next step.
  final Function() onPressedNext;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final TextInputAction textInputActionUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final TextInputType keyboardTypeUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final String hintTextUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final String? errorTextUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final Function()? onTapUser;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final TextEditingController? controllerUser;

  /// Constructor
  const LoginFormsForgotPasswordPage({
    Key? key,
    required this.logo,
    required this.style,
    this.buttonTextNext: 'Send',
    required this.onPressedNext,
    this.textInputActionUser: TextInputAction.next,
    this.keyboardTypeUser: TextInputType.emailAddress,
    this.hintTextUser: 'Email / Phone number',
    this.errorTextUser,
    this.inputFormattersUser,
    this.onTapUser,
    this.controllerUser,
    this.textMessage:
        'Enter the email or phone number associated with your account and we will send an introductions to reset your password.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: style.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: style.verticalSpacingBetweenGroup,
            ),
            child: Center(
              child: logo,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: style.screenPadding.top + style.verticalSpacingBetweenGroup,
            ),
            child: Text(
              textMessage,
              style: style.messageTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: style.verticalSpacingBetweenGroup,
            ),
            child: LoginFormsTextField(
              style: style,
              textInputAction: textInputActionUser,
              keyboardType: keyboardTypeUser,
              hintText: hintTextUser,
              controller: controllerUser,
              onTap: onTapUser,
              errorText: errorTextUser,
              inputFormatters: inputFormattersUser,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsButton(
              text: buttonTextNext,
              onPressed: onPressedNext,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}

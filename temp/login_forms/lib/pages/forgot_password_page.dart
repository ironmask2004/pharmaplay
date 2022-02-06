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
  final TextInputAction textInputActionEmail;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final TextInputType keyboardTypeEmail;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final String hintTextEmail;

  /// The text of SignIn button.
  final String buttonTextSignIn;

  /// The action of SignIn button to navigate to [LoginFormsSignInPage]

  final Function() onPressedSignIn;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final String? errorTextEmail;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersEmail;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final Function()? onTapEmail;
  final Function(String)? onChangeEmail;

  /// Use for the TextField lets the users input their email or phone number to confirm for creating new password. See also [LoginFormsTextField]
  final TextEditingController? controllerEmail;

  /// Constructor
  const LoginFormsForgotPasswordPage({
    Key? key,
    required this.logo,
    required this.style,
    required this.onPressedSignIn,
    this.buttonTextNext: 'Send',
    required this.onPressedNext,
    this.textInputActionEmail: TextInputAction.next,
    this.keyboardTypeEmail: TextInputType.emailAddress,
    this.hintTextEmail: 'Email',
    this.errorTextEmail,
    this.inputFormattersEmail,
    this.onTapEmail,
    this.onChangeEmail,
    this.controllerEmail,
    this.buttonTextSignIn: 'Sign In',
    this.textMessage:
        'Enter the email associated with your account and we will send an introductions to reset your password.',
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
              textInputAction: textInputActionEmail,
              keyboardType: keyboardTypeEmail,
              hintText: hintTextEmail,
              controller: controllerEmail,
              onTap: onTapEmail,
              onChanged: onChangeEmail,
              errorText: errorTextEmail,
              inputFormatters: inputFormattersEmail,
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
          Padding(
            padding: EdgeInsets.only(
              top: style.verticalSpacingBetweenGroup,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginFormsInlineButton(
                  text: buttonTextSignIn,
                  onPressed: onPressedSignIn,
                  style: style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

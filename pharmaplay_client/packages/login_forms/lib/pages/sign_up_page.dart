import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_forms/commons.dart';
import 'package:login_forms/login_forms.dart';

/// LoginFormsSignUpPage is used for sign up page.
class LoginFormsSignUpPage extends StatelessWidget {
  /// See [LoginFormsStyle]
  final LoginFormsStyle style;

  /// The action of SignUp button.
  final Function() onPressedSignUp;

  /// The action of SignIn button to navigate to [LoginFormsSignInPage]
  final Function() onPressedSignIn;

  /// Your product logo
  final Widget logo;

  /// The text of SignIn button.
  final String buttonTextSignIn;

  /// The text of SignUp button.
  final String buttonTextSignUp;

  /// See [LoginFormsTerm]
  final LoginFormsTerm? term;

  /// The text of SignIn button.
  final String textMessageAlreadyHaveAccount;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final TextInputAction textInputActionUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final TextInputType keyboardTypeUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final String hintTextUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final String? errorTextUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final Function()? onTapUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final TextEditingController? controllerUser;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final TextInputAction textInputActionFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypeFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final String hintTextFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final String? errorTextFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final Function()? onTapFullName;

  /// Use for the TextField lets the users input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerFullName;

  const LoginFormsSignUpPage({
    Key? key,
    required this.logo,
    required this.onPressedSignIn,
    required this.onPressedSignUp,
    required this.style,
    this.textInputActionUser: TextInputAction.next,
    this.keyboardTypeUser: TextInputType.emailAddress,
    this.hintTextUser: 'User name / Email / Phone number',
    this.errorTextUser,
    this.inputFormattersUser,
    this.onTapUser,
    this.controllerUser,
    this.textInputActionFullName: TextInputAction.done,
    this.keyboardTypeFullName: TextInputType.name,
    this.hintTextFullName: 'Full name',
    this.errorTextFullName,
    this.inputFormattersFullName,
    this.onTapFullName,
    this.controllerFullName,
    this.buttonTextSignIn: 'Sign In',
    this.buttonTextSignUp: 'Create Account',
    this.term,
    this.textMessageAlreadyHaveAccount: 'Already have an account? ',
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
            child: LoginFormsTextField(
              textInputAction: textInputActionFullName,
              keyboardType: keyboardTypeFullName,
              hintText: hintTextFullName,
              controller: controllerFullName,
              onTap: onTapFullName,
              errorText: errorTextFullName,
              inputFormatters: inputFormattersFullName,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
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
              text: buttonTextSignUp,
              onPressed: onPressedSignUp,
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
                Text(
                  textMessageAlreadyHaveAccount,
                  style: style.messageTextStyle,
                ),
                LoginFormsInlineButton(
                  text: buttonTextSignIn,
                  onPressed: onPressedSignIn,
                  style: style,
                ),
              ],
            ),
          ),
          if (term != null) term!,
        ],
      ),
    );
  }
}

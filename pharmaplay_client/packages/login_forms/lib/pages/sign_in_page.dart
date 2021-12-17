import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_forms/commons.dart';
import 'package:login_forms/login_forms.dart';

/// LoginFormsSignInPage is used for sign in page.
class LoginFormsSignInPage extends StatelessWidget {
  /// See [LoginFormsStyle]
  final LoginFormsStyle style;

  /// The action of SignIn button.
  final Function() onPressedSignIn;

  /// The action of ForgotPassword button to navigate to [LoginFormsForgotPasswordPage]
  final Function() onPressedForgot;

  /// The action of SignUp button to navigate to [LoginFormsSignUpPage]
  final Function() onPressedSignUp;

  /// Your product logo
  final Widget logo;

  /// The text of SignIn button.
  final String buttonTextSignIn;

  /// The text of ForgotPassword button.
  final String buttonTextForgotPassword;

  /// The text of SignUp button.
  final String buttonTextSignUp;

  /// List of Social button lets the users could sign in/up by their social account (Ex: Facebook, AppleId,...).
  final List<LoginFormsSocialButton>? socialButtons;

  /// See [LoginFormsTerm]
  final LoginFormsTerm? term;

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

  final Function(String)? onChangedUser;

  /// Use for the TextField lets the users input their email or phone number. See also [LoginFormsTextField]
  final TextEditingController? controllerUser;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final TextInputAction textInputActionPassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final TextInputType keyboardTypePassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final String hintTextPassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final String? errorTextPassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersPassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final Function()? onTapPassword;

  final Function(String)? onChangedPassword;

  /// Use for the TextField lets the users input their password. See also [LoginFormsTextField]
  final TextEditingController? controllerPassword;

  const LoginFormsSignInPage({
    Key? key,
    required this.logo,
    required this.onPressedSignIn,
    required this.onPressedForgot,
    required this.onPressedSignUp,
    required this.style,
    this.textInputActionUser: TextInputAction.next,
    this.keyboardTypeUser: TextInputType.emailAddress,
    this.hintTextUser: 'Email',
    this.errorTextUser,
    this.inputFormattersUser,
    this.onTapUser,
    this.onChangedUser,
    this.controllerUser,
    this.textInputActionPassword: TextInputAction.done,
    this.keyboardTypePassword: TextInputType.visiblePassword,
    this.hintTextPassword: 'Password',
    this.errorTextPassword,
    this.inputFormattersPassword,
    this.onTapPassword,
    this.onChangedPassword,
    this.controllerPassword,
    this.buttonTextSignIn: 'Sign In',
    this.buttonTextForgotPassword: 'Forgot password?',
    this.buttonTextSignUp: 'Sign Up',
    this.socialButtons,
    this.term,
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
              style: style,
              textInputAction: textInputActionUser,
              keyboardType: keyboardTypeUser,
              hintText: hintTextUser,
              controller: controllerUser,
              onTap: onTapUser,
              onChanged: onChangedUser,
              errorText: errorTextUser,
              inputFormatters: inputFormattersUser,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              style: style,
              textInputAction: textInputActionPassword,
              keyboardType: keyboardTypePassword,
              hintText: hintTextPassword,
              controller: controllerPassword,
              onTap: onTapPassword,
              onChanged: onChangedPassword,
              errorText: errorTextPassword,
              inputFormatters: inputFormattersPassword,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsButton(
              text: buttonTextSignIn,
              onPressed: onPressedSignIn,
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
                  text: buttonTextForgotPassword,
                  onPressed: onPressedForgot,
                  style: style,
                ),
                Text(
                  ' | ',
                  style: style.messageTextStyle,
                ),
                LoginFormsInlineButton(
                  text: buttonTextSignUp,
                  onPressed: onPressedSignUp,
                  style: style,
                ),
              ],
            ),
          ),
          if (socialButtons != null)
            Padding(
              padding: EdgeInsets.only(
                top: style.verticalSpacingBetweenGroup,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: socialButtons!
                    .map((e) => Padding(
                          padding: EdgeInsets.only(
                            bottom: style.verticalSpacingBetweenComponents,
                          ),
                          child: e,
                        ))
                    .toList(),
              ),
            ),
          if (term != null) term!,
        ],
      ),
    );
  }
}

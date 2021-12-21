import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_forms/commons.dart';
//import 'package:login_forms/login_forms.dart';

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

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final TextInputAction textInputActionEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final TextInputType keyboardTypeEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final String hintTextEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final String? errorTextEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final Function()? onTapEmail;
  final Function(String)? onchangeEmail;

  /// Use for the TextField lets the emails input their email or phone number. See also [LoginFormsTextField]
  final TextEditingController? controllerEmail;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputAction textInputActionFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypeFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String hintTextFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String? errorTextFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final Function()? onTapFirstname;
  final Function(String)? onChangeFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerFirstname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputAction textInputActionMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypeMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String hintTextMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String? errorTextMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final Function()? onTapMobile;
  final Function(String)? onChangeMobile;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerMobile;

  final TextInputAction textInputActionPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypePassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String hintTextPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String? errorTextPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final Function()? onTapPassword;
  final Function(String)? onChangePassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerPassword;

  final TextInputAction textInputActionConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypeConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String hintTextConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String? errorTextConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final Function()? onTapConfirmPassword;
  final Function(String)? onChangeConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerConfirmPassword;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputAction textInputActionLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextInputType keyboardTypeLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String hintTextLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final String? errorTextLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final Function()? onTapLastname;
  final Function(String)? onChangeLastname;

  /// Use for the TextField lets the emails input their full name. See also [LoginFormsTextField]
  final TextEditingController? controllerLastname;

/*
{  
 "firstname": "dd",
 "email": "dd@gmail.com",
 "password" : "12",
 "lastname": "dd",
 "mobile": "12222333"
     }
*/
  const LoginFormsSignUpPage({
    Key? key,
    required this.logo,
    required this.onPressedSignIn,
    required this.onPressedSignUp,
    required this.style,
    this.textInputActionEmail: TextInputAction.next,
    this.keyboardTypeEmail: TextInputType.emailAddress,
    this.hintTextEmail: 'Email',
    this.errorTextEmail,
    this.inputFormattersEmail,
    this.onTapEmail,
    this.onchangeEmail,
    this.controllerEmail,
    this.textInputActionFirstname: TextInputAction.done,
    this.keyboardTypeFirstname: TextInputType.name,
    this.hintTextFirstname: 'First name',
    this.errorTextFirstname,
    this.inputFormattersFirstname,
    this.onTapFirstname,
    this.onChangeFirstname,
    this.controllerFirstname,
    this.textInputActionLastname: TextInputAction.done,
    this.keyboardTypeLastname: TextInputType.name,
    this.hintTextLastname: 'Last name',
    this.errorTextLastname,
    this.inputFormattersLastname,
    this.onTapLastname,
    this.onChangeLastname,
    this.controllerLastname,
    this.textInputActionMobile: TextInputAction.done,
    this.keyboardTypeMobile: TextInputType.name,
    this.hintTextMobile: 'Mobile Number',
    this.errorTextMobile,
    this.inputFormattersMobile,
    this.onTapMobile,
    this.onChangeMobile,
    this.controllerMobile,
    this.textInputActionPassword: TextInputAction.done,
    this.keyboardTypePassword: TextInputType.name,
    this.hintTextPassword: 'Password',
    this.errorTextPassword,
    this.inputFormattersPassword,
    this.onTapPassword,
    this.onChangePassword,
    this.controllerPassword,
    this.textInputActionConfirmPassword: TextInputAction.done,
    this.keyboardTypeConfirmPassword: TextInputType.name,
    this.hintTextConfirmPassword: 'Confirm Password',
    this.errorTextConfirmPassword,
    this.inputFormattersConfirmPassword,
    this.onTapConfirmPassword,
    this.onChangeConfirmPassword,
    this.controllerConfirmPassword,
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
              textInputAction: textInputActionFirstname,
              keyboardType: keyboardTypeFirstname,
              hintText: hintTextFirstname,
              controller: controllerFirstname,
              onTap: onTapFirstname,
              onChanged: onChangeFirstname,
              errorText: errorTextFirstname,
              inputFormatters: inputFormattersFirstname,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              textInputAction: textInputActionLastname,
              keyboardType: keyboardTypeLastname,
              hintText: hintTextLastname,
              controller: controllerLastname,
              onTap: onTapLastname,
              onChanged: onChangeLastname,
              errorText: errorTextLastname,
              inputFormatters: inputFormattersLastname,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              textInputAction: textInputActionMobile,
              keyboardType: keyboardTypeMobile,
              hintText: hintTextMobile,
              controller: controllerMobile,
              onTap: onTapMobile,
              onChanged: onChangeMobile,
              errorText: errorTextMobile,
              inputFormatters: inputFormattersMobile,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              style: style,
              textInputAction: textInputActionEmail,
              keyboardType: keyboardTypeEmail,
              hintText: hintTextEmail,
              controller: controllerEmail,
              onTap: onTapEmail,
              onChanged: onchangeEmail,
              errorText: errorTextEmail,
              inputFormatters: inputFormattersEmail,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              textInputAction: textInputActionPassword,
              keyboardType: keyboardTypePassword,
              hintText: hintTextPassword,
              controller: controllerPassword,
              onTap: onTapPassword,
              onChanged: onChangePassword,
              errorText: errorTextPassword,
              inputFormatters: inputFormattersPassword,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenComponents),
            child: LoginFormsTextField(
              textInputAction: textInputActionConfirmPassword,
              keyboardType: keyboardTypeConfirmPassword,
              hintText: hintTextConfirmPassword,
              controller: controllerConfirmPassword,
              onTap: onTapConfirmPassword,
              onChanged: onChangeConfirmPassword,
              errorText: errorTextConfirmPassword,
              inputFormatters: inputFormattersConfirmPassword,
              style: style,
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

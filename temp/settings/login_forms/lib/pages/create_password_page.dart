import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_forms/commons.dart';

/// LoginFormsCreatePasswordPage is used to show a page, lets users can input the password for their new account.
class LoginFormsCreatePasswordPage extends StatelessWidget {
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

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final TextInputAction textInputActionPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final TextInputType keyboardTypePassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final String hintTextPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final String? errorTextPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final Function()? onTapPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final TextEditingController? controllerPassword;

  /// Use for the TextField lets the users input the new password. See also [LoginFormsTextField]
  final String textMessagePasswordRequirements;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final TextInputAction textInputActionConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final TextInputType keyboardTypeConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final String hintTextConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final String? errorTextConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final List<TextInputFormatter>? inputFormattersConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final Function()? onTapConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final TextEditingController? controllerConfirmPassword;

  /// Use for the TextField lets the users input the new password second time to confirm. See also [LoginFormsTextField]
  final String textMessageConfirmPassword;

  /// Constructor
  const LoginFormsCreatePasswordPage({
    Key? key,
    required this.logo,
    required this.style,
    this.textInputActionPassword: TextInputAction.next,
    this.keyboardTypePassword: TextInputType.visiblePassword,
    this.hintTextPassword: 'New password',
    this.errorTextPassword,
    this.inputFormattersPassword,
    this.onTapPassword,
    this.controllerPassword,
    this.textInputActionConfirmPassword: TextInputAction.done,
    this.keyboardTypeConfirmPassword: TextInputType.visiblePassword,
    this.hintTextConfirmPassword: 'Confirm password',
    this.errorTextConfirmPassword,
    this.inputFormattersConfirmPassword,
    this.onTapConfirmPassword,
    this.controllerConfirmPassword,
    this.textMessage:
        'Your new password must be different from previous used passwords.',
    this.buttonTextNext: 'Create password',
    required this.onPressedNext,
    this.textMessagePasswordRequirements: 'Must be at least 8 characters.',
    this.textMessageConfirmPassword: 'Both passwords must match.',
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
              textInputAction: textInputActionPassword,
              keyboardType: keyboardTypePassword,
              hintText: hintTextPassword,
              controller: controllerPassword,
              onTap: onTapPassword,
              errorText: errorTextPassword,
              inputFormatters: inputFormattersPassword,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenSubComponents),
            child: Text(
              textMessagePasswordRequirements,
              style: style.messageTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: style.verticalSpacingBetweenComponents,
            ),
            child: LoginFormsTextField(
              textInputAction: textInputActionConfirmPassword,
              keyboardType: keyboardTypeConfirmPassword,
              hintText: hintTextConfirmPassword,
              controller: controllerConfirmPassword,
              onTap: onTapConfirmPassword,
              errorText: errorTextConfirmPassword,
              inputFormatters: inputFormattersConfirmPassword,
              style: style,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: style.verticalSpacingBetweenSubComponents),
            child: Text(
              textMessageConfirmPassword,
              style: style.messageTextStyle,
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

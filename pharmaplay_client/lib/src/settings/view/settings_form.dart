import 'package:flutter/material.dart';
import 'package:pharmaplay_client/src/settings/bloc/settings_bloc.dart';
import 'package:pharmaplay_client/src/utlites/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:flutter_localizations/flutter_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsForm extends StatelessWidget {
  const SettingsForm({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final LoginFormsStyle style = LoginFormsStyle.defaultTemplate;
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previousState, currentState) => previousState != currentState,
      builder: (_, settingsState) => Scaffold(
          body: Padding(
              padding: style.screenPadding,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'textMessageResend',
                            style: style.messageTextStyle,
                          ),
                          LoginFormsInlineButton(
                            text: 'buttonTextResend',
                            onPressed: null,
                            style: style,
                          ),
                          DropdownButton<ThemeMode>(
                            // Read the selected themeMode from the controller
                            value:
                                context.read<SettingsBloc>().state.uiThemeMode,
                            // Call the updateThemeMode method any time the user selects a theme.
                            onChanged: (value) {
                              print(value);
                              context
                                  .read<SettingsBloc>()
                                  .add(UIThemeModeChanged(value!));
                            },
                            items: const [
                              DropdownMenuItem(
                                value: ThemeMode.system,
                                child: Text('System Theme'),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.light,
                                child: Text('Light Theme'),
                              ),
                              DropdownMenuItem(
                                value: ThemeMode.dark,
                                child: Text('Dark Theme'),
                              )
                            ],
                          ),
                          DropdownButton<Locale>(
                            // Read the selected themeMode from the controller
                            value: context.read<SettingsBloc>().state.uiLocale,
                            // Call the updateThemeMode method any time the user selects a theme.
                            onChanged: (value) {
                              print(value);
                              context.read<SettingsBloc>().add(
                                  UILocalChanged(Locale(value.toString())));
                            },
                            items: const [
                              DropdownMenuItem(
                                value: Locale('ar'),
                                child: Text('اللغة العربية'),
                              ),
                              DropdownMenuItem(
                                value: Locale('en'),
                                child: Text('English Language'),
                              )
                            ],
                          ),
                        ]),
                    Padding(
                      padding: EdgeInsets.only(
                        top: style.verticalSpacingBetweenGroup,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: style.screenPadding.top +
                            style.verticalSpacingBetweenGroup,
                      ),
                      child: Text(
                        'textMessage',
                        style: style.messageTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: style.verticalSpacingBetweenGroup,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: style.verticalSpacingBetweenComponents),
                      child: LoginFormsButton(
                        text: 'buttonTextNext',
                        onPressed: null,
                        style: style,
                      ),
                    ),
                  ]))),
    );

    ///----
  }
}

 /*



          Padding(
            padding: EdgeInsets.only(
              top: style.verticalSpacingBetweenGroup,
            ),
            child:
            )
*/

import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/settings/bloc/settings_bloc.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';
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
    final SFormsStyle style = SFormsStyle.defaultTemplate;
    Locale newLocale = context.read<SettingsBloc>().state.uiLocale;
    ThemeMode newThemeMode = context.read<SettingsBloc>().state.uiThemeMode;
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
                          DropdownButton<ThemeMode>(
                            // Read the selected themeMode from the controller
                            value:
                                context.read<SettingsBloc>().state.uiThemeMode,
                            // Call the updateThemeMode method any time the user selects a theme.
                            onChanged: (value) {
                              print(value);
                              newThemeMode = value ?? ThemeMode.system;
                              context
                                  .read<SettingsBloc>()
                                  .add(UIThemeModeChanged(newThemeMode));

                              print(newThemeMode);
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
                              newLocale = value ??
                                  context.read<SettingsBloc>().state.uiLocale;
                              context
                                  .read<SettingsBloc>()
                                  .add(UILocalChanged(newLocale));
                              print(newLocale);
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
                        top: style.verticalSpacingBetweenGroup,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: style.verticalSpacingBetweenComponents),
                      child: SFormsButton(
                        text: SLang.of(context).applyNewSettings,
                        onPressed: () {
                          context
                              .read<SettingsBloc>()
                              .add(UIThemeModeChanged(newThemeMode));
                          context
                              .read<SettingsBloc>()
                              .add(UILocalChanged(newLocale));
                        },
                        style: style,
                      ),
                    ),
                    SFormsInlineButton(
                      text: SLang.of(context).back,
                      onPressed: null,
                      style: style,
                    ),
                  ]))),
    );
  }
}

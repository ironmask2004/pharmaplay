import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/settings/bloc/settings_bloc.dart';
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
    Locale currentLocale = context.read<SettingsBloc>().state.uiLocale;
    ThemeMode currentThemeMode = context.read<SettingsBloc>().state.uiThemeMode;
    return BlocBuilder<SettingsBloc, SettingsState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, settingsState) => Scaffold(
              appBar: AppBar(
                title: Text(SLang.of(context).settings),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(16),
                  // Glue the SettingsController to the theme selection DropdownButton.
                  //
                  // When a user selects a theme from the dropdown list, the
                  // SettingsController is updated, which rebuilds the MaterialApp.
                  child: Column(children: [
                    DropdownButton<ThemeMode>(
                      // Read the selected themeMode from the controller
                      value: context.read<SettingsBloc>().state.uiThemeMode,
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
                        context
                            .read<SettingsBloc>()
                            .add(UILocalChanged(Locale(value.toString())));
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
                  ])),
            ));

    ///----
  }
}

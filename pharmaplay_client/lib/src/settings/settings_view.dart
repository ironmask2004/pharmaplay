import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';

import 'settings_controller.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
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
              value: controller.UIlocale,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateUILocale,
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
    );
  }
}

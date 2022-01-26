import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/settings/settings_form.dart';

import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage(this.settingsController, {Key? key}) : super(key: key);

  final SettingsController settingsController;

  static Route route(SettingsController settingsController) {
    return MaterialPageRoute<void>(
        builder: (_) => SettingsPage(settingsController));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SLang.of(context).settings)),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SettingsForm(settingsController), // LoginForm(),
      ),
    );
  }
}

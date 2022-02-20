import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';

import 'settings_form.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SLang.of(context).settings)),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: SettingsForm(), // LoginForm(),
      ),
    );
  }
}

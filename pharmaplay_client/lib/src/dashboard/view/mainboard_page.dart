import 'package:flutter/material.dart';
import 'package:pharmaplay_client/generated/l10n.dart';

import 'mainboard_form.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DashBoardPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(SLang.of(context).appTitle)),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: DashBoardForm(), // LoginForm(),
      ),
    );
  }
}

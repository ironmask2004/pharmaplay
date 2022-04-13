import 'package:flutter/material.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';

// ignore: must_be_immutable
class CardPopUpMenu extends StatelessWidget {
  VoidCallback onEdit;
  VoidCallback onDelete;
  VoidCallback onInfo;

  CardPopUpMenu(
      {Key? key,
      required this.onEdit,
      required this.onDelete,
      required this.onInfo})
      : super(key: key);

  void showMenuSelection(String value) {
    switch (value) {
      case 'Edit':
        onEdit();
        break;
      case 'Delete':
        onDelete();
        break;
      case 'Info':
        onInfo();
        break;
      // Other cases for other menu options
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        color: Theme.of(context).canvasColor,
        icon: const Icon(Icons.more_vert),
        onSelected: showMenuSelection,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                  value: 'Edit',
                  child: ListTile(title: Text(SLang.of(context).edit))),
              PopupMenuItem<String>(
                  value: 'Delete',
                  child: ListTile(title: Text(SLang.of(context).delete))),
              PopupMenuItem<String>(
                  value: 'Info',
                  child: ListTile(title: Text(SLang.of(context).info)))
            ]);
  }
}

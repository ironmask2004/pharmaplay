import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
          DrawerListTile(
            title: SLang.of(context).SignInchangeLanguage,
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Locale currentLocale =
                  context.read<SettingsBloc>().state.uiLocale;
              print('Chaneg Language pressed + current : $currentLocale');
              context.read<SettingsBloc>().add(UILocalChanged(
                  currentLocale.languageCode == 'ar'
                      ? const Locale('en')
                      : const Locale('ar')));
              // context.read<SettingsBloc>().add(UIThemeModeChanged(ThemeMode.light));
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}

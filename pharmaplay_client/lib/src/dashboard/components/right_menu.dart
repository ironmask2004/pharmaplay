import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/bloc/authentication_bloc.dart';
import 'package:pharmaplay_client/src/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(('Token fromRigthMenue:' +
        context.read<AuthenticationBloc>().state.tokenPair.toString()));
    return Drawer(
      child: ListView(
        children: [
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return DrawerListTile(
                title: SLang.of(context).signIn,
                visible: (context
                        .read<AuthenticationBloc>()
                        .state
                        .tokenPair
                        ?.isEmpty() ??
                    false),
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticateSignInRequested());
                },
              );
            },
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return DrawerListTile(
                title: "Profile",
                visible: !(context
                        .read<AuthenticationBloc>()
                        .state
                        .tokenPair
                        ?.isEmpty() ??
                    false),
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {},
              );
            },
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return DrawerListTile(
                title: SLang.of(context).signOut,
                visible: !(context
                        .read<AuthenticationBloc>()
                        .state
                        .tokenPair
                        ?.isEmpty() ??
                    false),
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {
                  context
                      .read<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
              );
            },
          ),
          DrawerListTile(
            title: "DashBoard",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
          DrawerListTile(
            title: SLang.of(context).SignInchangeLanguage,
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Locale currentLocale =
                  context.read<DashBoardBloc>().state.uiLocale;
              print('Chaneg Language pressed + current : $currentLocale');
              context.read<DashBoardBloc>().add(UILocalChanged(
                  currentLocale.languageCode == 'ar'
                      ? const Locale('en')
                      : const Locale('ar')));
              Navigator.of(context).pop();
              // context.read<DashBoardBloc>().add(UIThemeModeChanged(ThemeMode.light));
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
    this.visible = true,
    this.enabled = true,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final bool visible, enabled;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible, //Default is true,
        child: ListTile(
          enabled: enabled,
          onTap: press,
          horizontalTitleGap: 0.0,
          leading: SvgPicture.asset(
            svgSrc,
            color: fontbodyColor,
            height: 16,
          ),
          title: Text(
            title,
            style: const TextStyle(color: fontbodyColor),
          ),
        ));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/authentication/bloc/authentication_bloc.dart';
import 'package:pharmaplay_cpanel/src/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<DashBoardBloc, DashBoardState>(
            builder: (context, state) {
              return DrawerListTile(
                title: SLang.of(context).darkMode,
                visible: (context.read<DashBoardBloc>().state.uiThemeMode ==
                    ThemeMode.light),
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {
                  context
                      .read<DashBoardBloc>()
                      .add(const UIThemeModeChanged(ThemeMode.dark));
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          BlocBuilder<DashBoardBloc, DashBoardState>(
            builder: (context, state) {
              return DrawerListTile(
                title: SLang.of(context).lightMode,
                visible: (context.read<DashBoardBloc>().state.uiThemeMode ==
                    ThemeMode.dark),
                svgSrc: "assets/icons/menu_profile.svg",
                press: () {
                  context
                      .read<DashBoardBloc>()
                      .add(const UIThemeModeChanged(ThemeMode.light));
                  Navigator.of(context).pop();
                },
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
                  context.read<DashBoardBloc>().state.localeUI;
              print('Chaneg Language pressed + current : $currentLocale');
              context.read<DashBoardBloc>().add(UILocalChanged(
                  currentLocale.languageCode == 'ar'
                      ? const Locale('en')
                      : const Locale('ar')));
              Navigator.of(context).pop();
              // context.read<DashBoardBloc>().add(UIThemeModeChanged(ThemeMode.light));
            },
          ),

//---

          DrawerListTile(
              title: SLang.of(context).exitapp,
              svgSrc: "assets/icons/unknown.svg",
              press: () => showDialog<bool>(
                    context: context,
                    builder: (c) => AlertDialog(
                      title: Text(SLang.of(context).warning),
                      content: Text(SLang.of(context).areYouSureYouWantToExit),
                      actions: [
                        TextButton(
                            child: Text(SLang.of(context).yes),
                            onPressed: () async {
                              if (Platform.isAndroid) {
                                Navigator.pop(c, true);
                                Navigator.pop(context);
                                exit(0);
                              } else if (Platform.isIOS) {
                                exit(0);
                              } else if (Platform.isLinux) {
                                exit(0);
                              }
                              exit(0);
                              Navigator.pop(c, true);
                              Navigator.pop(context);
                            }),
                        TextButton(
                          child: Text(SLang.of(context).no),
                          onPressed: () => Navigator.pop(c, false),
                        ),
                      ],
                    ),
                  ))
//--
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
            color: context.read<DashBoardBloc>().state.fontbodyColor,
            height: 16,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: context.read<DashBoardBloc>().state.fontbodyColor),
          ),
        ));
  }
}

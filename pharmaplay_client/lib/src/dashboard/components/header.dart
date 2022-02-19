import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pharmaplay_client/src/dashboard/controllers/MenuController.dart';
import 'package:pharmaplay_client/src/settings/settings.dart';
import 'package:pharmaplay_client/src/utlites/constants.dart';
import 'package:pharmaplay_client/src/utlites/responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const Expanded(child: SearchField()),
        const ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale newLocale = context.read<SettingsBloc>().state.uiLocale;

    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          FloatingActionButton(
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/profile_pic.png"),
              ),
              onPressed: () {
                print('hihhhii');
                context.read<MenuController>().controlRightMenu();
              }),

          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          // FloatingActionButton(onPressed: () => print('Hiii')),

          /*IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            tooltip: 'Facorite icon',
            color: Colors.blue, //set color which you want
            onPressed: () {
              print('hiii'); // Do your work
            },
          ),*/

          BlocBuilder<SettingsBloc, SettingsState>(
            buildWhen: (previousState, currentState) =>
                previousState != currentState,
            builder: (context, state) {
              return DropdownButton<Locale>(
                // Read the selected themeMode from the controller
                value: context.read<SettingsBloc>().state.uiLocale,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                underline: null,

                // Call the updateThemeMode method any time the user selects a theme.
                onChanged: (value) {
                  print(value);
                  newLocale =
                      value ?? context.read<SettingsBloc>().state.uiLocale;
                  context.read<SettingsBloc>().add(UILocalChanged(newLocale));
                  print(newLocale);
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('ar'),
                    child: Text('ع'),
                  ),
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('e'),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
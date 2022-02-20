import 'package:flutter/material.dart';
import 'package:pharmaplay_client/src/dashboard/view/dashboard_screen.dart';
import 'package:pharmaplay_client/src/utlites/responsive.dart';
import 'package:provider/provider.dart';

import 'bloc/dashboard_bloc.dart';
import 'components/right_menu.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<DashBoardBloc>().state.scaffoldKey,
      drawer: const SideMenu(),
      endDrawer: const RightMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

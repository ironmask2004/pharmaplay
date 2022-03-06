import 'package:flutter/material.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_client/src/dashboard/dashboard.dart';
import 'package:pharmaplay_client/src/dashboard/druggroup/druggroup.dart';
import 'package:pharmaplay_client/src/dashboard/drugs/drug.dart';
import 'package:pharmaplay_client/src/dashboard/view/dashboard_screen.dart';
import 'package:pharmaplay_client/src/utlites/responsive.dart';
import '../components/right_menu.dart';
import '../components/side_menu.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const DashBoardPage());
  }

  //final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: _scaffoldkey, //context.read<DashBoardBloc>().state.scaffoldKey,
      drawer: const SideMenu(),
      endDrawer: const RightMenu(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => DrugGroupBloc(
                  dashBoardBlod: context.read<DashBoardBloc>(),
                  pharmaRepository: context.read<PharmaRepository>())
                ..add(DrugGroupInitialized())),
          BlocProvider(
            create: (context) => DrugBloc(
                dashBoardBlod:
                    BlocProvider.of(context), //context.read<DashBoardBloc>(),
                pharmaRepository: context.read<PharmaRepository>()),
          ),
        ],
        child: SafeArea(
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
              const Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: DashboardScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

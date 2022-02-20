import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/utlites/constants.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

import 'src/dashboard/bloc/dashboard_bloc.dart';
import 'src/dashboard/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: authenticationRepository,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                userRepository: userRepository,
              )..add(AuthenticationLandingRequested()),
            ),
            BlocProvider<DashBoardBloc>(
              create: (_) => DashBoardBloc()
                // ..add(ReloadUILocaleRequsted())
                ..add(DashBoardInitialRequested()),
            ),
            /* BlocProvider<BlocC>(
      create: (BuildContext context) => BlocC(),
    ),*/
          ],
          child: AppView(),
        ));
  }
}

class AppView extends StatelessWidget {
  AppView({
    Key? key,
  }) : super(key: key);
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
        buildWhen: (previousState, currentState) =>
            previousState != currentState,
        builder: (_, dashboardState) {
          return MaterialApp(
            navigatorKey: _navigatorKey,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              SLang.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // Arabic, no country code
            ],
            darkTheme: ThemeData.dark(),
            themeMode: dashboardState.uiThemeMode,
            locale:
                dashboardState.uiLocale, //getUIlocale(context),Locale('ar'),
            onGenerateTitle: (BuildContext context) =>
                SLang.of(context).appTitle,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: Colors.white),
              canvasColor: secondaryColor,
            ),
            home: MainScreen(),
          );
        });
  }
}

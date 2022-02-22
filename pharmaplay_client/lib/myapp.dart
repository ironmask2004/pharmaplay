import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmaplay_client/generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/splash/splash.dart';
import 'package:pharmaplay_client/src/utlites/sforms_style.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'src/dashboard/bloc/dashboard_bloc.dart';
import 'src/dashboard/view/dashboard_page.dart';
import 'src/login/login.dart';

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
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: fontbodyColor),
              canvasColor: secondaryColor,
            ),
            //themeMode: dashboardState.uiThemeMode,
            themeMode: ThemeMode.system,
            locale:
                dashboardState.uiLocale, //getUIlocale(context),Locale('ar'),
            onGenerateTitle: (BuildContext context) =>
                SLang.of(context).appTitle,

            builder: (context, child) {
              return MultiBlocListener(listeners: [
                BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      print('Auth : ' + state.toString());
                      _navigator.push<void>(
                        DashBoardPage.route(),
                        //  (route) => false,
                      );

                      break;
                    // authenticateSignIn
                    case AuthenticationStatus.unauthenticated:
                      print('un Auth : ' + state.toString());
                      _navigator.push<void>(
                        DashBoardPage.route(),
                        // (route) => false,
                      );

                      break;
                    case AuthenticationStatus.authenticateSignIn:
                      print('authenticateSignIn : ' + state.toString());
                      _navigator.push<void>(
                        SignInPage.route(),
                        //(route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticateSignUp:
                      print('SignUp Auth : ' + state.toString());
                      _navigator.push<void>(
                        SignUpPage.route(),
                        //   (route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticateConfirmCode:
                      print('authenticate ConfirmCode: ' + state.toString());
                      _navigator.push<void>(
                        ConfirmCodePage.route(state.tokenPair!.tokenId,
                            state.tokenPair!.refreshToken),
                        // (route) => false,
                      );
                      break;

                    case AuthenticationStatus.authenticationForgotPassword:
                      print(
                          'authenticate  ForgotPassword: ' + state.toString());
                      _navigator.push<void>(
                        ForgotPasswordPage.route(),
                        // (route) => false,
                      );
                      break;
                    default:
                      print('Lisnter find default switch!!!!!!!!! : ' +
                          state.toString());
                      _navigator.push<void>(
                        DashBoardPage.route(),
                        // (route) => false,
                      );

                      break;
                  }
                }),
                BlocListener<DashBoardBloc, DashBoardState>(
                  listener: (context, state) {
                    print('Listner Lisner !!!!!!!!!' +
                        state.uiLocale.languageCode);
                  },
                ),
              ], child: child!); //const MainScreen());
            },
            onGenerateRoute: (_) => SplashPage.route(),

            // home: const MainScreen(),
          );
        });
  }
}

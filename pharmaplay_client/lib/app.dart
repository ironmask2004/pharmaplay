import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/login/confirm_code/confirm_code.dart';
import 'package:pharmaplay_client/src/login/forgot_password/forgot_password.dart';
import 'package:pharmaplay_client/src/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

import 'src/dashboard/bloc/dashboard_bloc.dart';
import 'src/login/sigin/sigin.dart';
import 'src/login/signup/signup.dart';
import 'src/dashboard/bloc/dashboard_bloc.dart';
/*
class App extends StatelessWidget {
  const App({
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
          child: AppView()

          ///---

          ,
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
          // Since 'localeState' has only one STATE (SelectedLocale),
          // we don't need any if conditions here to check if there is
          // another state that can be emitted.
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
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: dashboardState.uiThemeMode,
            locale: dashboardState.uiLocale, //getUIlocale(context),
            //Locale('ar'),

            onGenerateTitle: (BuildContext context) =>
                SLang.of(context).appTitle,
            builder: (context, child) {
              return MultiBlocListener(listeners: [
                BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      print('Auth : ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        HomePage.route(),
                        (route) => false,
                      );
                      break;
                    // authenticateSignIn
                    case AuthenticationStatus.unauthenticated:
                      print('un Auth : ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        HomePage.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticateSignIn:
                      print('un Auth : ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        SignInPage.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticateSignUp:
                      print('SignUp Auth : ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        SignUpPage.route(),
                        (route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticateConfirmCode:
                      print('authenticate ConfirmCode: ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        ConfirmCodePage.route(state.tokenPair!.tokenId,
                            state.tokenPair!.refreshToken),
                        (route) => false,
                      );
                      break;

                    /*   case AuthenticationStatus.authenticationDashBoard:
                      print('authenticate DashBoard: ' + child.toString());
                      _navigator.push<void>(
                        DashBoardPage.route(),
                        //(route) => false,
                      );
                      break;*/
                    case AuthenticationStatus.authenticationForgotPassword:
                      print(
                          'authenticate  ForgotPassword: ' + child.toString());
                      _navigator.pushAndRemoveUntil<void>(
                        ForgotPasswordPage.route(),
                        (route) => false,
                      );
                      break;
                    default:
                      print('Lisnter find default switch!!!!!!!!! : ' +
                          AuthenticationStatus.values.toString());
                      break;
                  }
                }),
                BlocListener<DashBoardBloc, DashBoardState>(
                  listener: (context, state) {
                    print('Listner Lisner !!!!!!!!!' +
                        state.uiLocale.languageCode);
                  },
                ),
              ], child: child!);
            },
            onGenerateRoute: (_) => SplashPage.route(),
          );
        });
  }

  Locale getUIlocale(BuildContext context) {
    print('view get local ' +
        context.read<DashBoardBloc>().state.uiLocale.languageCode);
    return context.read<DashBoardBloc>().state.uiLocale;
  }
}
*/
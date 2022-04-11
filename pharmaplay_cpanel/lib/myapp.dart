import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:pharmaplay_cpanel/generated/l10n.dart';
import 'package:pharmaplay_cpanel/src/authentication/authentication.dart';
import 'package:pharmaplay_cpanel/src/splash/splash.dart';
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
    required this.pharmaRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final PharmaRepository pharmaRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationRepository>(create: (context) {
            return authenticationRepository;
          }),
          RepositoryProvider<UserRepository>(
              create: (context) => userRepository),
          RepositoryProvider<PharmaRepository>(
              create: (context) => pharmaRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                userRepository: userRepository,
              )..add(AuthenticationLandingRequested()),
            ),
            BlocProvider<DashBoardBloc>(
              create: (context) => DashBoardBloc()
                // ..add(ReloadlocaleUIRequsted())
                ..add(DashBoardInitialRequested())
                ..add(NotifyState()),
            ),
            /*BlocProvider(
              create: (context) => DrugGroupBloc(
                  dashBoardBlod: context.read<DashBoardBloc>(),
                  pharmaRepository: context.read<PharmaRepository>())
                ..add(const DrugGroupsSearched()),
            ),
             BlocProvider(
              create: (context) => DrugBloc(
                  dashBoardBlod:
                      BlocProvider.of(context), //context.read<DashBoardBloc>(),
                  pharmaRepository: context.read<PharmaRepository>())
                ..add(const DrugsSearched()),
            ),*/ //
            //  BlocProvider(
            //     create: (_) =>
            //        PostBloc(httpClient: http.Client())..add(PostFetched()),
            //  ),
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

            //
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            //
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
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor:
                  context.read<DashBoardBloc>().state.bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: dashboardState.fontbodyColor),
              canvasColor: context.read<DashBoardBloc>().state.secondaryColor,
            ),
            // themeMode: dashboardState.uiThemeMode,
            // themeMode: ThemeMode.system,
            locale:
                dashboardState.localeUI, //getlocaleUI(context),Locale('ar'),
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
                        state.localeUI.languageCode);
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

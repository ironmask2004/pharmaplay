import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmaplay_client/src/authentication/authentication.dart';
import 'package:pharmaplay_client/src/home/home.dart';
import 'package:pharmaplay_client/src/login/confirm_code/confirm_code.dart';
import 'package:pharmaplay_client/src/login/forgot_password/forgot_password.dart';
import 'package:pharmaplay_client/src/login/login.dart';
import 'package:pharmaplay_client/src/splash/splash.dart';
import 'package:user_repository/user_repository.dart';

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
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        )..add(AuthenticationLandingRequested()),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              print('_navigatorKey' + _navigatorKey.toString());
              print('listenr:' + child.toString());
              print(state.status);
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  print('Auth : ' + child.toString());
                  _navigator.pushAndRemoveUntil<void>(
                    HomePage.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.unauthenticated:
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

                case AuthenticationStatus.authenticationForgotPassword:
                  print('authenticate  ForgotPassword: ' + child.toString());
                  _navigator.pushAndRemoveUntil<void>(
                    ForgotPasswordPage.route(),
                    (route) => false,
                  );
                  break;
                default:
                  break;
              }
            },
            child: child);
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

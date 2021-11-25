import 'package:flutter/widgets.dart';
import 'package:pharmaplay_client/app.dart';
import 'package:pharmaplay_client/src/packages/authentication_repository/lib/authentication_repository.dart';
import 'package:pharmaplay_client/src/packages/user_repository/lib/user_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}

import 'package:flutter/widgets.dart';
import 'package:pharmaplay_client/app.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  bool loggedinFlag =
      await MySharedPreferences.instance.getBooleanValue("loggedin");
  print(loggedinFlag);

  runApp(App(
    authenticationRepository:
        AuthenticationRepository(loggedinFlag, 'pharmaplay.mywire.org:9093'),
    userRepository: UserRepository(),
  ));
}

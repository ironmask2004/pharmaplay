import 'package:flutter/widgets.dart';
import 'package:pharmaplay_client/app.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';
import 'package:user_repository/user_repository.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

Future<void> main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  //runApp(MyApp(settingsController: settingsController));

  bool loggedInFlag =
      await MySharedPreferences.instance.getBooleanValue("loggedIn");
  String tokenId = await MySharedPreferences.instance.getStringValue("tokenId");
  String refreshToken =
      await MySharedPreferences.instance.getStringValue("refreshToken");

  TokenPair _tokenPair = TokenPair(tokenId, refreshToken);
  print('Token Saved Pair:' + _tokenPair.toJson().toString());
  print(loggedInFlag);

  runApp(App(
    settingsController: settingsController,
    authenticationRepository: AuthenticationRepository(
        loggedInFlag, _tokenPair, 'pharmaplay.mywire.org:9093'),
    userRepository: UserRepository('pharmaplay.mywire.org:9093'),
  ));
}

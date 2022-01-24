import 'package:flutter/widgets.dart';
import 'package:pharmaplay_client/app.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:pharmaplay_client/src/utlites/shared_pref.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  bool loggedInFlag =
      await MySharedPreferences.instance.getBooleanValue("loggedIn");
  String tokenId = await MySharedPreferences.instance.getStringValue("tokenId");
  String refreshToken =
      await MySharedPreferences.instance.getStringValue("refreshToken");

  TokenPair _tokenPair = TokenPair(tokenId, refreshToken);
  print('Token Saved Pair:' + _tokenPair.toJson().toString());
  print(loggedInFlag);

  runApp(App(
    authenticationRepository: AuthenticationRepository(
        loggedInFlag, _tokenPair, 'pharmaplay.mywire.org:9093'),
    userRepository: UserRepository('pharmaplay.mywire.org:9093'),
  ));
}

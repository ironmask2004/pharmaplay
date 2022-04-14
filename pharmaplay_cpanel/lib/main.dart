import 'package:flutter/widgets.dart';
import 'package:pharma_repository/pharma_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:pharmaplay_cpanel/myapp.dart';
import 'package:pharmaplay_cpanel/src/utlites/shared_pref.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool loggedInFlag =
      await MySharedPreferences.instance.getBooleanValue("loggedIn");
  String tokenId = await MySharedPreferences.instance.getStringValue("tokenId");
  String refreshToken =
      await MySharedPreferences.instance.getStringValue("refreshToken");

  TokenPair _tokenPair = TokenPair(tokenId, refreshToken);
  print('Token Saved Pair:' + _tokenPair.toJson().toString());
  print(loggedInFlag);
/*
  runApp(MyApp(
    authenticationRepository: AuthenticationRepository(
        loggedInFlag, _tokenPair, '82.137.207.84:9093'),
    userRepository: UserRepository('82.137.207.84:9093'),
    pharmaRepository: PharmaRepository('82.137.207.84:9093'),
  ));

 */
  runApp(MyApp(
    authenticationRepository: AuthenticationRepository(
        loggedInFlag, _tokenPair, 'pharmaplay.mywire.org:9093'),
    userRepository: UserRepository('pharmaplay.mywire.org:9093'),
    pharmaRepository: PharmaRepository('pharmaplay.mywire.org:9093'),
  ));
}



/*
runApp(MyApp(
    authenticationRepository:
        AuthenticationRepository(loggedInFlag, _tokenPair, '192.168.1.13:9093'),
    userRepository: UserRepository('192.168.1.13:9093'),
    pharmaRepository: PharmaRepository('192.168.1.13:9093'),
  ));
}

}
*/



  //runApp(MyApp());


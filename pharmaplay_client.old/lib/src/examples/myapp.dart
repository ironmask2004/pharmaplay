import 'package:flutter/material.dart';
import 'package:pharmaplay_client/src/examples/login.dart';
import 'package:pharmaplay_client/src/examples/profile.dart';
import 'package:pharmaplay_client/src/utiites/shared_pref.dart';

class examApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return examAppState();
  }
}

class examAppState extends State<examApp> {
  // This widget is the root of your application.

  bool isLoggedIn = false;

  examAppState() {
    getLoginValue();
  }

  void getLoginValue() async {
    await MySharedPreferences.instance
        .getBooleanValue("loggedin")
        .then((value) => setState(() {
              isLoggedIn = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLoggedIn ? Profile() : Login());
  }
}

import 'package:flutter/material.dart';
import 'package:gemo_app/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gemo_app/screens/welcome.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: checkFirstTimeOpen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            final bool isFirstTimeOpen = snapshot.data ?? true;
            if (isFirstTimeOpen) {
              return WelcomeScreen();
            } else {
              return const SplashScreen();
            }
          }
        },
      ),
    );
  }

  //Check App has previosly opened or not.
  Future<bool> checkFirstTimeOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimeOpen = prefs.getBool('first_time_open') ?? true;

    if (isFirstTimeOpen) {
      prefs.setBool('first_time_open', false);
    }

    return isFirstTimeOpen;
  }
}

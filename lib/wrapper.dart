import 'package:flutter/material.dart';
import 'package:gemo_app/screens/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gemo_app/screens/welcome.dart';
import 'package:gemo_app/screens/dashboard.dart';
import 'package:gemo_app/screens/signin.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    return MaterialApp(
      home: FutureBuilder<bool>(
        future: checkFirstTimeOpen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            final bool isFirstTimeOpen = snapshot.data ?? true;
            if (isFirstTimeOpen) {
              return WelcomeScreen();
            } else {
              if (user != null) {
                return DashboardScreen();
              } else {
                return SignInScreen();
              }
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

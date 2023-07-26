import 'package:flutter/material.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/screens/welcome.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemo_app/wrapper.dart';
import 'package:gemo_app/screens/signin.dart';

//Remove developer mode

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemo',
      home: WelcomeScreen(),
    );
  }
}

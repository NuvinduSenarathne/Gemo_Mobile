import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemo_app/wrapper.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemo',
      home: Wrapper(),
    );
  }
}

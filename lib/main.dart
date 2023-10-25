import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gemo_app/screens/colorClarityDetection.dart';
import 'package:gemo_app/screens/cutPrediction.dart';
import 'package:gemo_app/screens/pricePrediction.dart';
import 'package:gemo_app/screens/gem_recommendation.dart';
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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemo',
      routes: {
        "/pricePrediction": (context) => PricePrediction(),
        "/cutPrediction": (context) => CutPrediction(),
        "/recommendation": (context) => Recommendation(),
        "/colorDetection": (context) => ColorDetection(),
      },
      home: Wrapper(),
    );
  }
}

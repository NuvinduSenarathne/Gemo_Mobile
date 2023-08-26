import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';

class CutPrediction extends StatelessWidget {
  const CutPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Cut Prediction"),
      ),
      body: Container(
        child: const Text('Cut Prediction'),
      ),
    );
  }
}

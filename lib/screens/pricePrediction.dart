import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PricePrediction extends StatelessWidget {
  const PricePrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Price Prediction"),
      ),
      body: Container(
        child: const Text('Price Prediction'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PricePredictionResult extends StatefulWidget {
  const PricePredictionResult({super.key});

  @override
  State<PricePredictionResult> createState() => _PricePredictionResultState();
}

class _PricePredictionResultState extends State<PricePredictionResult> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Results')
    );
  }
}
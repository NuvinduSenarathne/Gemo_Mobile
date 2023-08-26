import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ColorDetection extends StatelessWidget {
  const ColorDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Color Detection"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.whiteColor, Color.fromARGB(255, 4, 65, 150)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
          ),
        ),
        child: const Text('Color Detection'),
      ),
    );
  }
}

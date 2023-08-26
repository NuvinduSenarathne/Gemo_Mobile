import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Recommendation"),
      ),
      body: Container(
        child: const Text('Recommendation'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PricePredictionResult extends StatefulWidget {
  const PricePredictionResult({super.key});

  @override
  State<PricePredictionResult> createState() => _PricePredictionResultState();
}

class _PricePredictionResultState extends State<PricePredictionResult> {
  String selectedGemstone = 'Sapphire';
  String selectedColor = 'Blue';
  String selectedClarity = 'Transparent';
  String selectedCut = 'Oval';
  String selectedWeight = '0.56';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Results"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              width: 297,
              height: 73,
              decoration: BoxDecoration(
                color: AppColors.dashboardGridButtonColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  'Rs. 85250',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    height: 1.2175,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        selectedColor,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text(
                        'Color',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff635e5e),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        selectedClarity,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text(
                        'Clarity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff645e5e),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Column(
                    children: [
                      Text(
                        selectedWeight,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text(
                        'Weight (ct)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff645e5e),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

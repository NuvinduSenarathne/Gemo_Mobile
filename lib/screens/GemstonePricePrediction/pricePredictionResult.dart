import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PricePredictionResult extends StatefulWidget {
  final Map<String, dynamic> inputValues;

  const PricePredictionResult({Key? key, required this.inputValues})
      : super(key: key);

  @override
  State<PricePredictionResult> createState() => _PricePredictionResultState();
}

class _PricePredictionResultState extends State<PricePredictionResult> {
  String selectedGemstone = 'Sapphire';
  String selectedColor = 'Blue';
  String selectedClarity = 'Transparent';
  String selectedCut = 'Oval';
  String selectedWeight = '0.56';
  String predictedPrice = '5005.00';

 @override
  void initState() {
    super.initState();
    updateStateValues();
  }

  void updateStateValues() {
    selectedGemstone = widget.inputValues['GemstoneName'];
    selectedColor = widget.inputValues['Color'];
    selectedClarity = widget.inputValues['Clarity'];
    selectedCut = widget.inputValues['Cut'];
    selectedWeight = widget.inputValues['Weight'].toString();
    predictedPrice = widget.inputValues['Price'];
  }

  @override
  void didUpdateWidget(covariant PricePredictionResult oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateStateValues();
  }

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
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: const Text(
                'Predicted Price of the Gemstone',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: const Icon(
                Icons.diamond_outlined,
                size: 40,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              width: 297,
              height: 73,
              decoration: BoxDecoration(
                color: AppColors.dashboardGridButtonColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Rs.$predictedPrice",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        selectedGemstone,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text(
                        'Gemstone Name',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 60, 0),
                  child: Column(
                    children: [
                      Text(
                        selectedCut,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      const Text(
                        'Cut',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff635e5e),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(05, 50, 05, 10),
              child: const Center(
                child: Text(
                  "Predicted prices are based on current market conditions and various factors. Actual prices may vary due to market fluctuations, gemstone quality, and other factors.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center, // Set text alignment here
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PricePredictionResult extends StatefulWidget {
  const PricePredictionResult({super.key});

  @override
  State<PricePredictionResult> createState() => _PricePredictionResultState();
}

class _PricePredictionResultState extends State<PricePredictionResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Results"),
      ),
      body: Container(
        // signinshowpasswordeF9 (1:7)
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        width: double.infinity,
        decoration: const BoxDecoration(
            // color: Color(0xff1d2671),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // pricet9V (1:56)
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              width: 297,
              height: 73,
              decoration: BoxDecoration(
                color: Color(0xff009bbc),
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
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: const Text(
                          'Blue',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1.2175,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 83, 0),
                        child: const Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.2175,
                            color: Color(0xff635e5e),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        // transparent2oR (1:61)
                        // margin: EdgeInsets.fromLTRB(0, 0, 42, 0),
                        child: const Text(
                          'Transparent',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            height: 1.2175,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.fromLTRB(0, 0, 64, 0),
                        child: const Text(
                          'Clarity',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.2175,
                            color: Color(0xff645e5e),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Column(
                    children: [
                      Text(
                        // Lp7 (1:62)
                        '2.4',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2175,
                          color: Color(0xff333333),
                        ),
                      ),
                      Text(
                        // weightctY31 (1:64)
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

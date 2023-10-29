import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CutPredictionResults extends StatefulWidget {
  final String predictedCut;

  const CutPredictionResults({
    Key? key,
    required this.predictedCut,
  }) : super(key: key);

  @override
  State<CutPredictionResults> createState() => _CutPredictionResultsState();
}

class _CutPredictionResultsState extends State<CutPredictionResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Results"),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: const Text(
                        'Cut Prediction Result',
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: const Icon(
                        Icons.light_mode,
                        size: 40,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: double.infinity,
                      height: double.tryParse('50'),
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: const Center(
                            // child: Text(
                            //   'Most Suitable Cut',
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w500, fontSize: 24),
                            // ),
                          )),
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
                          widget.predictedCut,
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

                  ],
                ))));
  }
}

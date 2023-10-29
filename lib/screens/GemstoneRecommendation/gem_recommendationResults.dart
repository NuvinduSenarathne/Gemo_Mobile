import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../widgets/RecommendationTIle.dart';

class RecommendationResult extends StatefulWidget {
  final String selectedRequirement;
  final String recommendedGemstone;

  const RecommendationResult({
    Key? key,
    required this.selectedRequirement,
    required this.recommendedGemstone,
  }) : super(key: key);

  @override
  State<RecommendationResult> createState() => _RecommendationResultState();
}

class _RecommendationResultState extends State<RecommendationResult> {

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
                    'Recommendation Result',
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
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Requirement',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 8, 15, 15),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      widget.selectedRequirement,
                      style: const TextStyle(
                          color: AppColors.formFieldTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: double.infinity,
                  height: double.tryParse('50'),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: const Center(
                        child: Text(
                          'Gemstone Recommendation',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
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
                      widget.recommendedGemstone,
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

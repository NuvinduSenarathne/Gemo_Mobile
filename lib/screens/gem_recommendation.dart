import 'package:flutter/material.dart';
import 'package:gemo_app/screens/recommendationResult.dart';

import '../constants/colors.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  final List<String> requirements = [
    'Gemstone Information',
    'Recommend a Gemstone',
  ];

  String selectedRequirement = 'Gemstone Information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Recommendation"),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: const Text(
                    'Enter the your requirements',
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
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 8, 15, 15),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColors.formFieldBorderColor,
                      )),
                  child: DropdownButton(
                    underline: Container(),
                    isExpanded: true,
                    value: selectedRequirement,
                    items: requirements
                        .map((gemstone) => DropdownMenuItem(
                            child: Text(gemstone), value: gemstone))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedRequirement = newValue!;
                      });
                    },
                    style: const TextStyle(
                        color: AppColors.formFieldTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
                ),
                  
              ],
            )));
  }
}

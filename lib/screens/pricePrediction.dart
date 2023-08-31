import 'package:flutter/material.dart';
import 'package:gemo_app/screens/pricePredictionResult.dart';

import '../constants/colors.dart';

class PricePrediction extends StatefulWidget {
  const PricePrediction({super.key});

  @override
  State<PricePrediction> createState() => _PricePredictionState();
}

class _PricePredictionState extends State<PricePrediction> {
  final List<String> gemstones = [
    'Sapphire',
    'Ruby',
    'Topaz',
    'Spinel',
    "Cat's Eye",
    'Zircon',
    'Alexandrite',
  ];

  final List<String> colors = [
    'Purple',
    'Yellow',
    'White',
    'Red',
    'Blue',
    'Brown', 
    'Gold', 
    'Green', 
    'Pink',
  ];
  final List<String> clarities = [
    'Transparent',
    'Translucent',
  ];
  final List<String> cuts = [
    'Oval',
    'Round',
    'Emerald',
    'Heart',
  ];

  String selectedGemstone = 'Sapphire';
  String selectedColor = 'Blue';
  String selectedClarity = 'Transparent';
  String selectedCut = 'Oval';
  TextEditingController selectedCt = TextEditingController();

  void printSelectedValues() {
  print('Selected Gemstone: $selectedGemstone');
  print('Selected Color: $selectedColor');
  print('Selected Clarity: $selectedClarity');
  print('Selected Cut: $selectedCut');
  print('Selected Weight (ct): ${selectedCt.text}');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Price Prediction"),
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
                    'Enter the characteristics of the gemstone',
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
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Gemstone',
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
                    value: selectedGemstone,
                    items: gemstones
                        .map((gemstone) => DropdownMenuItem(
                            value: gemstone,
                            child: Text(gemstone)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedGemstone = newValue!;
                      });
                    },
                    style: const TextStyle(
                        color: AppColors.formFieldTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Color',
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
                    value: selectedColor,
                    items: colors
                        .map((color) =>
                            DropdownMenuItem(value: color, child: Text(color)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedColor = newValue!;
                      });
                    },
                    style: const TextStyle(
                        color: AppColors.formFieldTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Clarity',
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
                    value: selectedClarity,
                    items: clarities
                        .map((clarity) => DropdownMenuItem(
                            value: clarity,
                            child: Text(clarity)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedClarity = newValue!;
                      });
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.formFieldTextColor,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Cut',
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
                    value: selectedCut,
                    items: cuts
                        .map((cut) =>
                            DropdownMenuItem(value: cut, child: Text(cut)))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCut = newValue!;
                      });
                    },
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.formFieldTextColor,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Weight (ct)',
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
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Carat Weight',
                      border: InputBorder.none,
                    ),
                    controller: selectedCt,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.formFieldTextColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    width: double.infinity,
                    height: double.tryParse('50'),
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.dashboardGridButtonColor),
                      ),
                      onPressed: () {
                        printSelectedValues();
                    //     Navigator.push(
                    // context, MaterialPageRoute(builder: (_) => PricePredictionResult()));
                      },
                      child: const Text('Process', style: TextStyle(fontSize: 16),),
                    )),
              ],
            )));
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PricePrediction extends StatefulWidget {
  const PricePrediction({super.key});

  @override
  State<PricePrediction> createState() => _PricePredictionState();
}

class _PricePredictionState extends State<PricePrediction> {
  final List<String> gemstones = [
    'Gem 1',
    'Gem 2',
    'Gem 3',
  ];

  final List<String> colors = [
    'Color 1',
    'Color 2',
  ];
  final List<String> clarities = [
    'Transparent',
    'Translucent',
  ];
  final List<String> cuts = [
    'Oval',
    'Round',
  ];

  String selectedGemstone = 'Gem 1';
  String selectedColor = 'Color 1';
  String selectedClarity = 'Transparent';
  String selectedCut = 'Oval';
  TextEditingController selectedCt = TextEditingController();

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
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Gemstone',
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 158, 158))),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  value: selectedGemstone,
                  items: gemstones
                      .map((gemstone) => DropdownMenuItem(
                          child: Text(gemstone), value: gemstone))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedGemstone = newValue!;
                    });
                  },
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Color',
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 158, 158))),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  value: selectedColor,
                  items: colors
                      .map((color) =>
                          DropdownMenuItem(child: Text(color), value: color))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedColor = newValue!;
                    });
                  },
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Clarity',
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 158, 158))),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  value: selectedClarity,
                  items: clarities
                      .map((clarity) => DropdownMenuItem(
                          child: Text(clarity), value: clarity))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedClarity = newValue!;
                    });
                  },
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Cut',
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 158, 158))),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  value: selectedCut,
                  items: cuts
                      .map((cut) =>
                          DropdownMenuItem(child: Text(cut), value: cut))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCut = newValue!;
                    });
                  },
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  'Weight (ct)',
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 158, 158, 158))),
                child: TextField(
                  controller: selectedCt,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: double.tryParse('50'),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Process'),
                  )),
            ],
          ),
        ));
  }
}

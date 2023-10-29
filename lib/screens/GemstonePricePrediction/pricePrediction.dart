import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemo_app/screens/GemstonePricePrediction/pricePredictionResult.dart';
import 'package:http/http.dart' as http;

// import 'package:gemo_app/screens/pricePredictionResult.dart';

import '../../constants/colors.dart';

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
    'Peer',
    'Emerald',
    'Heart',
  ];

  String selectedGemstone = 'Sapphire';
  String selectedColor = 'Blue';
  String selectedClarity = 'Transparent';
  String selectedCut = 'Oval';
  TextEditingController selectedCt = TextEditingController();
  bool weightError = false;

  final now = DateTime.now();

  Future<void> sendPredictionRequest(Map<String, dynamic> inputValues) async {
    final url = Uri.parse('http://10.0.2.2:5001/priceprediction');
    final headers = {
      'Content-Type': 'application/json', // Set the correct Content-Type header
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(inputValues), // Encode the data as JSON
    );

    if (response.statusCode == 200) {
      print(response.body);
      final responseData = json.decode(response.body);
      final predictedPrice = responseData['predicted_price'];
      // Process the predicted price as needed
      print('Predicted Price: $predictedPrice');

      // Set the predicted price in your inputValues map
      inputValues['Price'] = predictedPrice.toString();
    } else {
      print(
          'Failed to send prediction request. Status code: ${response.statusCode}');
    }
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
                            value: gemstone, child: Text(gemstone)))
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
                            value: clarity, child: Text(clarity)))
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
                        color: weightError
                            ? Colors.red // Use red border when there's an error
                            : AppColors.formFieldBorderColor,
                      )),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Carat Weight',
                      border: InputBorder.none,
                      errorText: weightError ? 'Invalid input' : null,
                    ),
                    controller: selectedCt,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: weightError
                          ? Colors.red
                          : AppColors.formFieldTextColor,
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
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.dashboardGridButtonColor),
                      ),
                      onPressed: () async {
                        if (double.tryParse(selectedCt.text) == null) {
                          setState(() {
                            weightError = true;
                          });
                        } else {
                          setState(() {
                            weightError = false;
                          });
                        }

                        final inputValues = {
                          'year': now.year,
                          'month': now.month,
                          'day': now.day,
                          'GemstoneName': selectedGemstone,
                          'Color': selectedColor,
                          'Clarity': selectedClarity,
                          'Cut': selectedCut,
                          'Weight': double.parse(selectedCt.text),
                        };
                        await sendPredictionRequest(inputValues);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PricePredictionResult(inputValues: inputValues),
                          ),
                        );
                      },
                      child: const Text(
                        'Process',
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
              ],
            )));
  }
}

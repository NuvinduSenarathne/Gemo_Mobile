import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gemo_app/screens/GemstoneRecommendation/gem_recommendationResults.dart';

import '../../constants/colors.dart';
import 'package:http/http.dart' as http;

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  // final List<String> requirements = [
  //   'Gemstone Information',
  //   'Recommend a Gemstone',
  // ];

  TextEditingController enteredRequirement = TextEditingController();
  String recommendedGemstone = 'Sapphire';


  Future<void> sendRecommendationRequest(String userInput) async {
    final url = Uri.parse('http://10.0.2.2:5001/gemstonerecommendation');
    final headers = {
      'Content-Type': 'application/json', // Set the correct Content-Type header
    };

    final body = jsonEncode({'user_input': userInput});

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print(response.body);
      final responseData = json.decode(response.body);
      final recommendation = responseData['recommendation'];

      setState(() {
        recommendedGemstone = recommendation; // Update recommendedGemstone
      });
      // Process the gemstone recommendation as needed
      print('Gemstone Recommendation: $recommendation');
    } else {
      print(
          'Failed to send recommendation request. Status code: ${response.statusCode}');
    }
  }

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
                    'Requirement',
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
                    child: TextFormField(
                      controller: enteredRequirement,
                      minLines: 6,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                      hintText: 'Enter your requirement here...',
                      border: InputBorder.none,
                    ),
                    )),

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

                        final userInput = enteredRequirement.text; // Get the user's input from the controller
                        print(userInput);
                        await sendRecommendationRequest(userInput);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => RecommendationResult(
                                  selectedRequirement: userInput,
                                  recommendedGemstone: recommendedGemstone,
                                )));
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

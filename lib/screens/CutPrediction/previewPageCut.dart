import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/screens/CutPrediction/cutPredictionResult.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/colors.dart';

class PreviewPageCut extends StatelessWidget {
  const PreviewPageCut({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  Future<String?> processImageForCut(File imageFile) async {
    final Uri apiUrl = Uri.parse('http://10.0.2.2:5001/cutpredict');

    try {
      final request = http.MultipartRequest('POST', apiUrl);
      request.files.add(http.MultipartFile(
        'image',
        imageFile.readAsBytes().asStream(),
        imageFile.lengthSync(),
        filename: 'image.jpg', // Adjust the filename as needed
      ));
      final response = await request.send();

      if (response.statusCode == 200) {
        final String responseString = await response.stream.bytesToString();
        final Map<String, dynamic> responseData = json.decode(responseString);

        if (responseData.containsKey('predicted_cut')) {
          final String predictedCut = responseData['predicted_cut'] as String;
          return predictedCut;
        } else {
          return 'Error: Invalid response format';
        }
      } else {
        // Handle error cases
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      // Handle exceptions
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Preview Page"),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),

          ElevatedButton(
            onPressed: () async {
              final File imageFile = File(picture.path);
              final predictedCut = await processImageForCut(imageFile);

              if (predictedCut != null) {
                // Now you have the predictedCut, you can navigate to the result page or perform other actions
                print('Predicted Cut: $predictedCut');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CutPredictionResults(predictedCut: predictedCut),
                  ),
                );
              } else {
                // Handle the case where predictedCut is null (e.g., API error)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: Unable to predict cut'),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: const Text('Process Cut'),
          ),
        ]),
      ),
    );
  }
}

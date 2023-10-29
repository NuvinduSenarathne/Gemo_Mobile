import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/screens/CutPrediction/cutPredictionResult.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/colors.dart';
import 'colorClarityDetectionResult.dart';

class PreviewPageColorClarity extends StatelessWidget {
  const PreviewPageColorClarity({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  Future<Map<String, dynamic>?> processImageForColorClarity(File imageFile) async {
    final Uri apiUrl = Uri.parse('http://10.0.2.2:5001/colorclarityidentification');

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

        return responseData; // Return the entire response as a Map
      } else {
        // Handle error cases
        return null;
      }
    } catch (e) {
      // Handle exceptions
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Preview Page Color Clarity"),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(picture.name),

          ElevatedButton(
            onPressed: () async {
              final File imageFile = File(picture.path);
              final response = await processImageForColorClarity(imageFile);

              if (response != null) {
                // Now you have the response, you can access clarity, color, and variety
                final String clarity = response['clarity'];
                final String color = response['color'];
                final String variety = response['variety'];

                print('Predicted Clarity: $clarity');
                print('Predicted Color: $color');
                print('Predicted Variety: $variety');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ColorDetectionResult(
                          clarity: clarity,
                          color: color,
                          variety: variety

                        ),
                  ),
                );
              } else {
                // Handle the case where response is null (e.g., API error)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: Unable to predict color and clarity'),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
            child: const Text('Process Color and Clarity'),
          ),
        ]),
      ),
    );
  }
}

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/colors.dart';
import 'colorClarityDetectionResult.dart';

class PreviewPageColorClarity extends StatefulWidget {
  const PreviewPageColorClarity({Key? key, required this.picture}) : super(key: key);

  final XFile picture;

  @override
  _PreviewPageColorClarityState createState() => _PreviewPageColorClarityState();
}

class _PreviewPageColorClarityState extends State<PreviewPageColorClarity> {
  bool isLoading = false; // Variable to track loading state

  Future<Map<String, dynamic>?> processImageForColorClarity(File imageFile) async {
    final Uri apiUrl = Uri.parse('http://ec2-3-110-25-16.ap-south-1.compute.amazonaws.com:5001/colorclarityidentification');

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
          Image.file(File(widget.picture.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(widget.picture.name),

          ElevatedButton(
            onPressed: () async {
              final File imageFile = File(widget.picture.path);
              Map<String, dynamic>? response;

              try {
                // Show loading indicator using showDialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          const SizedBox(height: 16),
                          Text('Processing Color and Clarity...'),
                        ],
                      ),
                    );
                  },
                );

                response = await processImageForColorClarity(imageFile);
              } finally {
                // Close the loading indicator dialog no matter what happens
                Navigator.of(context).pop();
              }

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
                    builder: (context) => ColorDetectionResult(
                      clarity: clarity,
                      color: color,
                      variety: variety,
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
            child: isLoading
                ? CircularProgressIndicator() // Show CircularProgressIndicator while loading
                : const Text('Process Color and Clarity'),
          ),
        ]),
      ),
    );
  }
}

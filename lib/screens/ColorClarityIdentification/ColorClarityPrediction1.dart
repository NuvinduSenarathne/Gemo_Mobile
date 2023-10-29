import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';
import 'PreviewPageColorClarity.dart';
import '../previewPage.dart';

class ColorClarityPredictionGallery extends StatefulWidget {
  @override
  _ColorClarityPredictionGalleryState createState() => _ColorClarityPredictionGalleryState();
}

class _ColorClarityPredictionGalleryState extends State<ColorClarityPredictionGallery> {
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Color Clarity Prediction"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedImage != null)
              Image.file(
                File(_selectedImage!.path),
                fit: BoxFit.cover,
                width: 250,
              ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Image'),
            ),
            if (_selectedImage != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PreviewPageColorClarity(picture: _selectedImage!),
                    ),
                  );
                },
                child: Text('Preview Image'),
              ),
          ],
        ),
      ),
    );
  }
}

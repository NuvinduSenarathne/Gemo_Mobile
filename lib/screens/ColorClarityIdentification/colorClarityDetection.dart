import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/screens/ColorClarityIdentification/colorClarityDetectionResult.dart';

import '../../constants/colors.dart';
import 'ColorClarityPrediction1.dart';
import 'cameraApp.dart';

class ColorDetection extends StatelessWidget {
  const ColorDetection({super.key});


    @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Color & Clarity Identification"),
        ),
        body: ListView(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.camera_alt_outlined, size: 56.0),
                title: Text('Camera'),
                subtitle: Text('Capture photos with camera'),
                trailing: Icon(Icons.navigate_next_outlined),
                onTap: () async {
                  await availableCameras().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CameraApp(cameras: value))));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.drive_file_move, size: 56.0),
                title: Text('Gallery'),
                subtitle: Text('Upload photos from gallery'),
                trailing: Icon(Icons.navigate_next_outlined),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ColorClarityPredictionGallery()));
                  print('clicked files');
                },
              ),
            ),

          ],
        ));
  }
  
}
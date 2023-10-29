import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/CutPrediction/cameraAppCut.dart';
import 'package:gemo_app/screens/CutPrediction/cp.dart';

import '../ColorClarityIdentification/cameraApp.dart';

class CutPrediction extends StatelessWidget {
  const CutPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Cut Prediction"),
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
                          builder: (_) => CameraAppCut(cameras: value))));
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
                      MaterialPageRoute(builder: (_) => CutPrediction1()));
                  print('clicked files');
                },
              ),
            )
          ],
        ));
  }
}

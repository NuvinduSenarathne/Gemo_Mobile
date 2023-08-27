import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';

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
        children: const [
          Card(
            child: ListTile(
              leading: Icon( Icons.camera_alt_outlined, size: 56.0),
              title: Text('Camera'),
              subtitle: Text('Capture photos with camera'),
              trailing: Icon(Icons.navigate_next_outlined),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon( Icons.drive_file_move, size: 56.0),
              title: Text('Gallery'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.navigate_next_outlined),
            ),
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gemo_app/widgets/ColorDetectionTile.dart';
import '../../constants/colors.dart';

class ColorDetectionResult extends StatelessWidget {
  final String color;
  final String clarity;
  final String variety;

  const ColorDetectionResult({
    Key? key,
    required this.color,
    required this.clarity,
    required this.variety,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: const Center(
                    child: Text(
                      'Color & Clarity Identification',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),

              ColorDetectionTile(
                variety: variety,
                color: color,
                clarity: clarity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

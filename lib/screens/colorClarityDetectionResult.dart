import 'package:flutter/material.dart';
import 'package:gemo_app/widgets/ColorDetectionTile.dart';
import '../constants/colors.dart';

class ColorDetectionResult extends StatefulWidget {
  const ColorDetectionResult({super.key});

  @override
  State<ColorDetectionResult> createState() => _ColorDetectionResultState();
}

class _ColorDetectionResultState extends State<ColorDetectionResult> {
  late String selectedCategory = 'Selected Category';
  late String selectedRequirement = 'Selected Requirement';
}
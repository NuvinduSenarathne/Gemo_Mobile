import 'package:flutter/material.dart';
import 'package:gemo_app/screens/recommendationResult.dart';

import '../constants/colors.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  final List<String> requirements = [
    'Gemstone Information',
    'Recommend a Gemstone',
  ];
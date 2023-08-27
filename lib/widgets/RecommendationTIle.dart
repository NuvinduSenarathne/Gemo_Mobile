import 'package:flutter/material.dart';

class RecommendationTile extends StatelessWidget {
  final String topic;
  final String image;
  final String description;

  const RecommendationTile({
    required this.topic,
    required this.image,
    required this.description,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          SizedBox(
            width: 150,
            child: Image.network(image),
          ),
          
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ColorDetectionTile extends StatelessWidget {
  final String variety;
  final String color;
  final String clarity;

  const ColorDetectionTile({
    required this.variety,
    required this.color,
    required this.clarity,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                  "Gemstone Name : $variety",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                ),
                Text(
                  "Color of the Gemstone: $color",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "Clarity of the Gemstone: $clarity",
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

import 'package:flutter/material.dart';

class DashboardScreen1 extends StatelessWidget {
   final List<String> buttonTitles = ['Button 1', 'Button 2', 'Button 3', 'Button 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < buttonTitles.length; i++)
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // Do something when button is pressed
                    },
                    child: Text(buttonTitles[i]),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
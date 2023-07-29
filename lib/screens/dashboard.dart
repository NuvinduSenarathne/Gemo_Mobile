import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            title: const Text('Dashboard'),
            leading: IconButton(
              icon: const Icon(Icons.abc),
              onPressed: (){},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                },
              ),
            ],
          ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ElevatedButton(onPressed: () async {}, child: Text('Sign Out'))
          ],
        ),
      )
    );
  }
}

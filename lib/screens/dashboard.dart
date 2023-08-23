import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/DashboardScreen.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/widgets/DashboardGrid.dart';
import 'package:gemo_app/widgets/carousel.dart';

import '../services/auth.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Dashboard"),
          elevation: .1,
          leading: IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () async {
              dynamic result = await auth.signOut();

              if (result == 'Success') {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Successfully Signed Out'),
                ));
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SignInScreen()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Error signing out'),
                ));
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child:  Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            // mainAxisAlignment: MainAxisAlignment.center,
            child: Column(
              children:  <Widget>[
                ImageCarousel(),
              DashboardGrid(),

              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(builder: (_)=> DashboardScreen1()));
              //     },
              //     child: const Text('Register'),
              //   ),
            ],
            )
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/widgets/DashboardGrid.dart';
import 'package:gemo_app/widgets/SearchBarDash.dart';
import 'package:gemo_app/widgets/carousel.dart';

import '../services/auth.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService auth = AuthService();
  TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Dashboard"),
          elevation: .1,
          leading: IconButton(
            icon: const Icon(Icons.login),
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
          // color: AppColors.appColor,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.whiteColor, Color.fromARGB(255, 4, 65, 150)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
            ),
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              // mainAxisAlignment: MainAxisAlignment.center,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
                      child: SearchBarDash(onSearch: (String) {})),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                      child: ImageCarousel(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                      child: DashboardGrid(),
                    ),
                  ),

                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.push(context, MaterialPageRoute(builder: (_)=> DashboardScreen1()));
                  //     },
                  //     child: const Text('Register'),
                  //   ),
                ],
              )),
        ));
  }
}

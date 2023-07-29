import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/widgets/buttons.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 400,
                    child: Column(children: <Widget>[
                      Image.asset(
                        'assets/logos/logo.png',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text('To discover new era of gemstones',
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Dosis')),
                    ]),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 0, MediaQuery.of(context).size.height * 0.15),
                  child: getstartedButton(context, "Get Started >>", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  }),
                ),
              ),
            ],
          ),
        ));
  }
}

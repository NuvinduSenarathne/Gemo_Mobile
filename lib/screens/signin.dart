import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/dashboard.dart';
import 'package:gemo_app/screens/signup.dart';
import 'package:gemo_app/services/handle_popup.dart';
import 'package:gemo_app/widgets/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Welcome Back",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: 'VarelaRound')),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Login to your account",
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 20)),
                        const SizedBox(
                          height: 60,
                        ),
                        reusableTextFormField("email", "Enter UserName",
                            Icons.person_outline, false, _emailTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextFormField(
                            "password_signin",
                            "Enter Password",
                            Icons.lock_outline,
                            true,
                            _passwordTextController),
                        const SizedBox(
                          height: 40,
                        ),
                        firebaseUIButton(context, "Sign In", () {
                          if (_formKey.currentState!.validate()) {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen()));
                            }).onError((error, stackTrace) {
                              PopUpMessageService.showError(context,
                                  "Error occured while sign in. Please check your email and password again.");
                            });
                          }
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?",
                                style: TextStyle(color: AppColors.whiteColor)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                              },
                              child: const Text(
                                " Sign Up",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ])),
            ),
          ),
        ));
  }
}

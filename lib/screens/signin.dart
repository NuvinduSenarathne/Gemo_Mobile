import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signup.dart';
import 'package:gemo_app/services/handle_popup.dart';
import 'package:gemo_app/widgets/reusable_widget.dart';

import '../services/mail_verification.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  MailVerificationService mailVerificationService = MailVerificationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.PrimaryColor,
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
                                color: AppColors.SecondaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: 'VarelaRound')),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Login to your account",
                            style: TextStyle(
                                color: AppColors.SecondaryColor, fontSize: 20)),
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
                        firebaseUIButton(context, "Sign In", () async {
                          if (_formKey.currentState!.validate()) {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) {
                              mailVerificationService.manuallyRedirect(context);
                            }).onError((error, stackTrace) {
                              PopUpMessageService.showError(
                                  context,
                                  "Authentication Failed",
                                  "Please check your email and password again.");
                            });
                          }
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?",
                                style:
                                    TextStyle(color: AppColors.SecondaryColor)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: const Text(
                                " Sign Up",
                                style: TextStyle(
                                    color: AppColors.SecondaryColor,
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

import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemo_app/screens/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Register",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'VarelaRound')),
                const SizedBox(
                  height: 10,
                ),
                const Text("Create your account",
                    style:
                        TextStyle(color: AppColors.whiteColor, fontSize: 20)),
                const SizedBox(
                  height: 60,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                reusableTextField("Confirm Password", Icons.lock_outline, true,
                    _confirmPasswordTextController),
                const SizedBox(
                  height: 40,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  _handleSignUp(context, _userNameTextController,
                      _emailTextController, _passwordTextController);
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(color: AppColors.whiteColor)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      },
                      child: const Text(
                        " Sign In",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ]),
        )),
      ),
    );
  }
}

Future<void> _handleSignUp(
    BuildContext context,
    TextEditingController _userNameTextController,
    TextEditingController _emailTextController,
    TextEditingController _passwordTextController) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Validate the insertions

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );

    if (userCredential.user != null) {
      // Save additional user information to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': _userNameTextController.text,
      });

      // Navigate to DashboardScreen upon successful sign-up
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    } else {
      print('Error during sign up: ${e.message}');
    }
  } catch (e) {
    print('Error during sign up: $e');
  }
}

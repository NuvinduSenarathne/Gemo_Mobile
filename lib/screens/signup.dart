import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signin.dart';
import 'package:gemo_app/services/handle_popup.dart';
import 'package:gemo_app/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemo_app/screens/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

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
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 20)),
                        const SizedBox(
                          height: 60,
                        ),
                        reusableTextFormField(
                            "name",
                            "Enter Firstname",
                            Icons.person_outline,
                            false,
                            _firstNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextFormField(
                            "name",
                            "Enter Lastname",
                            Icons.person_outline,
                            false,
                            _lastNameTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextFormField("email", "Enter Email",
                            Icons.person_outline, false, _emailTextController),
                        const SizedBox(
                          height: 20,
                        ),
                        reusableTextFormField("password", "Enter Password",
                            Icons.lock_outline, true, _passwordTextController),
                        const SizedBox(
                          height: 40,
                        ),
                        reusablePasswordFormField(
                            "Re-Enter Password",
                            Icons.lock_outline,
                            true,
                            _passwordTextController,
                            _confirmPasswordTextController),
                        const SizedBox(
                          height: 40,
                        ),
                        firebaseUIButton(context, "Sign Up", () {
                          if (_formKey.currentState!.validate()) {
                            _handleSignUp(
                                context,
                                _firstNameTextController,
                                _lastNameTextController,
                                _emailTextController,
                                _passwordTextController);
                          }
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
                        const SizedBox(
                          height: 20,
                        ),
                      ]),
                )),
          ),
        ));
  }
}

Future<void> _handleSignUp(
    BuildContext context,
    TextEditingController _firstNameTextController,
    TextEditingController _lastNameTextController,
    TextEditingController _emailTextController,
    TextEditingController _passwordTextController) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );

    if (userCredential.user != null) {
      // Save additional user information to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'firstnamename': _firstNameTextController.text,
        'lastname': _lastNameTextController.text,
      });

      // Navigate to DashboardScreen upon successful sign-up
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      PopUpMessageService.showError(context,
          "Weak Password. Please enter strong password and try again.");
    } else if (e.code == 'email-already-in-use') {
      PopUpMessageService.showError(context, "Account already exists.");
    } else {
      PopUpMessageService.showError(context, "Error occured while sign up.");
    }
  } catch (e) {
    PopUpMessageService.showError(context, "Error occured while sign up.");
  }
}

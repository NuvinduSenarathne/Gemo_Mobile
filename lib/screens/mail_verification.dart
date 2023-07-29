import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:gemo_app/screens/signup.dart';
import 'package:gemo_app/services/mail_verification.dart';
import 'package:gemo_app/widgets/buttons.dart';

class MailVerificationScreen extends StatefulWidget {
  const MailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<MailVerificationScreen> createState() => _MailVerificationScreenState();
}

class _MailVerificationScreenState extends State<MailVerificationScreen> {
  @override
  void initState() {
    super.initState();
    MailVerificationService mailVerificationService = MailVerificationService();
    mailVerificationService.mailVerification(context);
    mailVerificationService.setTimerForAutoRedirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.LightGreyColor,
          body: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Image.asset(
                    'assets/icons/open-envelope.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const Text(
                  "Verify your email address",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    color: AppColors.PrimaryColor,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "We have just send email verification link on your email. Please check email and click on that link to verify your email address.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      color: AppColors.PrimaryColor,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "If not auto redirected after verification, click on the continue button.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      color: AppColors.PrimaryColor,
                      fontSize: 17),
                ),
                const SizedBox(
                  height: 26,
                ),
                continueButton(context, "Continue", () {
                  MailVerificationService mailVerificationService =
                      MailVerificationService();
                  mailVerificationService.manuallyRedirect(context);
                }),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Resend E-Mail Link',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.RichGreyColor,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        MailVerificationService mailVerificationService =
                            MailVerificationService();
                        mailVerificationService.mailVerification(context);
                      },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Back to Login',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.RichGreyColor,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

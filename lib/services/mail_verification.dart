import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemo_app/screens/dashboard.dart';
import 'handle_popup.dart';

class MailVerificationService {
  late Timer timer;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> mailVerification(BuildContext context) async {
    try {
      await auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException {
      PopUpMessageService.showError(
          context, "Error Occured!", "Email verification Unsuccessful.");
    } catch (e) {
      PopUpMessageService.showError(
          context, "Error Occured!", "Email verification Unsuccessful.");
    }
  }

  setTimerForAutoRedirect(BuildContext context) {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      auth.currentUser?.reload();
      if (auth.currentUser!.emailVerified) {
        timer.cancel();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      }
    });
  }

  manuallyRedirect(BuildContext context) {
    if (auth.currentUser!.emailVerified) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    } else {
      PopUpMessageService.showError(context, "Verification Failed!",
          "Please verify your email and try again later.");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class PopUpMessageService {
  static void showError(BuildContext context, String errorMessage) {
    QuickAlert.show(
        context: context, text: errorMessage, type: QuickAlertType.error);
  }
}

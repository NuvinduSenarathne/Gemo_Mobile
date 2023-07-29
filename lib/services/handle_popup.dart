import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';
import 'package:quickalert/quickalert.dart';

class PopUpMessageService {
  static void showError(
      BuildContext context, String title, String errorMessage) {
    QuickAlert.show(
        context: context,
        text: errorMessage,
        type: QuickAlertType.error,
        backgroundColor: AppColors.LightGreyColor,
        title: title);
  }
}

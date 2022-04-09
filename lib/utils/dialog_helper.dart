import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static Future<dynamic> showAlertDialog(
      {required BuildContext context,
        required String message,
        String? title}) async {
    return await showOkAlertDialog(
      context: context,
      title: title ?? "",
      message: message,
    );
  }
}
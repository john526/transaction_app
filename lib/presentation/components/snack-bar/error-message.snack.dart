import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';

class ErrorMessageSnack {
  ErrorMessageSnack._();

  static void showErrorSnackbar(BuildContext context, String message) {
    Get.snackbar('Error', message,
        backgroundColor: Style.red, colorText: Style.white);
  }

  static void showNoConnectivitySnackbar(BuildContext context) {
    Get.snackbar('Non connecté', 'SVP, vérifiez votre connexion internet',
        backgroundColor: Style.secondaryColor, colorText: Style.primaryColor);
  }
}

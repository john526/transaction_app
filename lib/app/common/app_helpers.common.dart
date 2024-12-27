import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transaction_app/app/config/constants/customer.constant.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/app/services/local-storage.service.dart';
import 'package:transaction_app/domaine/entities/customer.entity.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHelpersCommon{
  AppHelpersCommon._();

  static CustomerEntity? getCustomerInLocalStorage() {
    final userEncoding = LocalStorageService.instance.get(CustomerConstant.keyCustomer);
    if (userEncoding == null) {
      // logoutApi();
      return null;
    }
    final user = CustomerEntity.fromJson(
        jsonDecode(LocalStorageService.instance.get(CustomerConstant.keyCustomer)!));
    return user;
  }

  static bool checkIsSvg(String? url) {
    if (url == null || (url.length) < 3) {
      return false;
    }
    final length = url.length;
    return url.substring(length - 3, length) == 'svg';
  }

  static logoutApi() async {
    try {
      Get.offAllNamed(Routes.LOGIN_PATH_SCREEN);
      LocalStorageService.instance.logout();
    } catch (e) {
      debugPrint('========================> login failure: $e');
    }
  }

  static Future<dynamic> showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    double radius = 16,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
  }) {
    return showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Style.transparent,
      context: context,
      builder: (context) => Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: modal,
      ),
    );
  }

  static void showAlertDialog(
      {required BuildContext context,
        required Widget child,
        bool canPop = true,
        bool isTransparent = false,
        double radius = 16,
        Color backgroundColor = Style.white}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: isTransparent ? Style.transparent : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius.r),
        ),
      ),
      contentPadding: EdgeInsets.all(20.r),
      iconPadding: EdgeInsets.zero,
      content: PopScope(
        canPop: canPop,
        child: child,
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: canPop,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/loading_animation.svg', // Your SVG animation path
                  height: 100, // Customize the size as needed
                  width: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Processing your order...",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static String formatDate(DateTime dateTime) {
   // DateTime dateTime = DateTime.parse(dateString);
    String formattedDate =
        DateFormat("EEE dd MMM yyyy", "fr_FR").format(dateTime);

    return formattedDate;
  }
}
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:transaction_app/app/config/constants/auth.constant.dart';
import 'package:transaction_app/app/config/constants/first-time.constant.dart';
import 'package:transaction_app/app/services/local-storage.service.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';

class SplashController extends GetxController {
  Future<void> getToken() async {
    final storage = LocalStorageService.instance;
    final firstTime = storage.get(FirstTimeConstant.keyFirstTime);
    final token = storage.get(AuthConstant.keyToken);
    debugPrint("=======================> firstTime $firstTime");
    debugPrint("=======================> token $token");
    if(firstTime == null){
       Get.offAllNamed(Routes.START_MESSAGE_PATH_SCREEN);
    }else{
      if(token == null){
         Get.offAllNamed(Routes.LOGIN_PATH_SCREEN);
      }else{
         Get.offAllNamed(Routes.NAVIGATION_PATH_SCREEN);
      }
    }
  }
}

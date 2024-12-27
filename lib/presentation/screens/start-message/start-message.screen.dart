import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transaction_app/app/config/constants/tr_keys.constant.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/buttons/custom.button.dart';
import 'package:transaction_app/presentation/components/swiper/card-swiper.swiper.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';
import 'package:upgrader/upgrader.dart';

class StartMessageScreen extends StatefulWidget {
  const StartMessageScreen({super.key});

  @override
  State<StartMessageScreen> createState() => _StartMessageScreenState();
}

class _StartMessageScreenState extends State<StartMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Scaffold(
        body: Padding(
         padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                  child: SwiperComponent()
              ),
              10.verticalSpace,
              Expanded(
                child: CustomButton(
                    title: TrKeysConstant.firstMessageButtonText,
                    textColor: Style.primaryColor,
                    background: Style.secondaryColor,
                    onPressed: (){
                      Get.offAllNamed(Routes.SIGNUP_PATH_SCREEN);
                    },
                  textSize: 30.sp,
                  radius: 20.r,
                ),
              ),
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}
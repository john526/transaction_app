import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction_app/app/config/constants/tr_keys.constant.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';

class LoginWelcomeComponent extends StatelessWidget {
  final String message;
  final bool haveAccount;
  LoginWelcomeComponent({super.key, required this.message, required this.haveAccount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        size.height > 700 ?  70.verticalSpace : haveAccount ? 50.verticalSpace : 20.verticalSpace,
        Container(
          color: Style.black,
          width: 100.w,
          child: Image.asset("", fit: BoxFit.fill,),
        ),
        20.verticalSpace,
        RichText(
          text: TextSpan(
            text:TrKeysConstant.welcomeText ,
            style: Style.interBold(
                size: 35.sp, color: Style.primaryColor),
            children: <TextSpan>[
              TextSpan(
                  text: " !",
                  style: Style.interBold(
                      size: 35.sp,
                      color: Style.secondaryColor)),
            ],
          ),
        ),
        30.verticalSpace,
        Container(
          width: 320.w,
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Style.interBold(
                size: 14.sp, color: Style.primaryColor),
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}

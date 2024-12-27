import 'package:flutter/material.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotTextButton extends StatelessWidget{
  final String title;
  final Function() onPressed;
  final double? fontSize;
  final Color fontColor;
  final double? letterSpacing;

  const ForgotTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.fontSize,
    this.fontColor = Style.black,
    this.letterSpacing = -14 * 0.02,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Style.dontHaveAccBtnBack,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            "$title",
            style: Style.interNormal(
              size: 16.sp,
              color: fontColor,
            ),
          ),
          Text(
            " ?",
            style: Style.interNormal(
              size: 20.sp,
              color: Style.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

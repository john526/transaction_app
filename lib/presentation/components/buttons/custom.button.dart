import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/buttons/effects/animation-button.effect.dart';

class CustomButton extends StatelessWidget {
  final Icon? icon;
  final String title;
  final bool isLoading;
  final Function()? onPressed;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final Color? isLoadingColor;
  final double weight;
  final double? height;
  final double radius;
  final String imagePath;
  final bool isUnderline;
  final Color underLineColor;
  final bool haveBorder;
  final bool isGrised;
  final Widget? rigthWidget;
  final bool isRigthWidget;
  final double textSize;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisAlignment mainAxisAlignmentLodaing;

  const CustomButton({
    super.key,
    this.isGrised = false,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.height = 40,
    this.imagePath = "",
    this.haveBorder = false,
    this.isUnderline = false,
    this.underLineColor = Style.secondaryColor,
    this.background = Style.primaryColor,
    this.textColor = Style.white,
    this.isLoadingColor = Style.white,
    this.weight = double.infinity,
    this.radius = 8,
    this.icon,
    this.borderColor = Style.transparent,
    this.rigthWidget,
    this.isRigthWidget = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisAlignmentLodaing = MainAxisAlignment.center,
    this.textSize = 15,

  });

  @override
  Widget build(BuildContext context) {
    return AnimationButtonEffect(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, height!),
          side: BorderSide(
              color: isGrised == true
                  ? Style.secondaryColor
                  : borderColor, //Style.primaryColor,
              width: haveBorder ? 2.r : 1.r),
          elevation: 0,
          shadowColor: Style.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          backgroundColor: isGrised == true ? Style.secondaryColor : background,
        ),
        onPressed: isGrised == true ? null : onPressed,
        child: isLoading
            ? Row(
                mainAxisAlignment: mainAxisAlignmentLodaing,
                children: [
                  SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(
                      color: isLoadingColor,
                      strokeWidth: 2.r,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  if (icon != null)
                    Row(
                      children: [
                        icon!,
                        10.horizontalSpace,
                      ],
                    ),
                  Text(
                    title,
                    style: Style.interNormal(
                      size: textSize.sp,
                      color: isGrised == true
                          ? Style.selectedItemsText
                          : textColor,
                      underLineColor: underLineColor,
                      isUnderLine: isUnderline,
                      letterSpacing: -14 * 0.01,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                  isRigthWidget ? rigthWidget! : SizedBox(),
                  if (imagePath.isNotEmpty) 10.horizontalSpace,
                  if (imagePath.isNotEmpty) SvgPicture.asset(imagePath)
                ],
              ),
      ),
    );
  }
}
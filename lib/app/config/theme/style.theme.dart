import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Style {
  Style._();


  // new 
  static const List<Color> surfaceOrangeGradiant = [
    Color(0xFFFF914D),
    Color(0xFFFF910C),
  ];

  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFFFF914D);
  static const Color transparent = Color(0x00FFFFFF);
  static const Color white = Color(0xFFFFFFFF);

  static const Color neutralGrey = Color(0xFF717171);

  static const Color black = Color(0xFF232B2F);

  static const Color selectedItemsText = Color(0xFFA0A09C);

  static const Color textGrey = Color(0xFF898989);

  static const Color dontHaveAccBtnBack = Color(0xFFF8F8F8);

  static const Color ligthGreen = Color(0xFF71C761);
  static const Color green = Color(0xFF00FF00);
  static const Color brandGreen = Color(0xFF83EA00);
  static const Color backGreen = Color.fromRGBO(156, 233, 142, 0.10);
  static const Color backLigthGreen = Color.fromRGBO(99, 207, 17, 0.086);

  static const Color newRed = Color(0xFFFF2700);
  static const Color redSelect = Color(0xFFFF6969);
  static const Color red = Color(0xFFFF3D00);

  static const Color otherOrange = Color(0xFFFF5D15);

  /// dark theme based colors
  static const Color mainBackDark = Color(0xFF1E272E);
  static const Color dontHaveAnAccBackDark = Color(0xFF2B343B);
  static const Color dragElementDark = Color(0xFFE5E5E5);
  static const Color shimmerBaseDark = Color.fromRGBO(117, 117, 117, 0.29);
  static const Color shimmerHighlightDark = Color.fromRGBO(194, 194, 194, 0.65);
  static const Color borderDark = Color(0xFF494B4D);
  static const Color partnerChatBack = Color(0xFF1A222C);
  static const Color yourChatBack = Color(0xFF25303F);
  static const Color mainBack = Color(0xFFF4F4F4);

  static interBold(
          {double size = 15,
          Color color = Style.black,
          bool isUnderLine = false,
          Color underLineColor = Style.secondaryColor,
          double letterSpacing = 0}) =>
      TextStyle(
          fontFamily: 'Cereal',
          fontSize: size.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: letterSpacing.sp,
          decorationColor: isUnderLine ? underLineColor : Style.white,
          decorationThickness: isUnderLine ? 2 : 0,
          decoration:
              isUnderLine ? TextDecoration.underline : TextDecoration.none);

  static interSemi(
          {double size = 18,
          Color color = Style.black,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      TextStyle(
          fontFamily: 'Cereal',
          fontSize: size.sp,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: letterSpacing.sp,
          decoration: decoration);

  static TextStyle interNoSemi(
          {double size = 18,
          Color color = Style.black,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      TextStyle(
          fontFamily: 'Cereal',
          fontSize: size.sp,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: letterSpacing.sp,
          decoration: decoration);

  static interNormal({
    double size = 16,
    Color color = Style.black,
    FontWeight fontWeight = FontWeight.w400,
    bool isUnderLine = false,
    bool isCross = false,
    Color underLineColor = Style.secondaryColor,
    Color crossLineColor = Style.primaryColor, // Add color for the cross line
    double letterSpacing = 0,
    double underLineThickness = 1.5, // Add thickness for underline
    double crossLineThickness = 1.5, // Add thickness for line-through
  }) =>
      TextStyle(
        fontFamily: 'Cereal',
        fontSize: size.sp,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing.sp,
        decoration: _getTextDecoration(isUnderLine, isCross),
        decorationColor: _getDecorationColor(
            isUnderLine, isCross, underLineColor, crossLineColor),
        decorationThickness: _getDecorationThickness(
            isUnderLine, isCross, underLineThickness, crossLineThickness),
      );

  static TextDecoration _getTextDecoration(bool isUnderLine, bool isCross) {
    List<TextDecoration> decorations = [];

    if (isUnderLine) {
      decorations.add(TextDecoration.underline);
    }
    if (isCross) {
      decorations.add(TextDecoration.lineThrough);
    }

    return decorations.isNotEmpty
        ? TextDecoration.combine(decorations)
        : TextDecoration.none;
  }

  static Color _getDecorationColor(bool isUnderLine, bool isCross,
      Color underLineColor, Color crossLineColor) {
    if (isUnderLine && isCross) {
      return underLineColor; 
    } else if (isUnderLine) {
      return underLineColor;
    } else if (isCross) {
      return crossLineColor;
    }
    return Colors.transparent;
  }

  static double _getDecorationThickness(bool isUnderLine, bool isCross,
      double underLineThickness, double crossLineThickness) {
    if (isUnderLine && isCross) {
      return (underLineThickness + crossLineThickness) /
          2;
    } else if (isUnderLine) {
      return underLineThickness;
    } else if (isCross) {
      return crossLineThickness;
    }
    return 0.0;
  }

  static interRegular(
          {double size = 16,
          Color color = Style.black,
          TextDecoration textDecoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      TextStyle(
          fontFamily: 'Cereal',
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
          letterSpacing: letterSpacing.sp,
          decoration: textDecoration);
}

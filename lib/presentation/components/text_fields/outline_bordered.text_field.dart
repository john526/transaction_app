import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';

class OutlinedBorderTextFormField extends StatelessWidget {
  final String? label;
  final String? labelText;
  final String? hint;
  final Widget? suffixIcon;
  final bool? obscure;
  final Color? labelColor;
  final bool isLabelTextBold;
  final TextEditingController? textController;
  final double suffixIconConstraintsWidth;
  final double suffixIconConstraintsHeight;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validation;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final Color? hintColor;
  final Color? differBorderColor;
  final Color? fillColor;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? haveBorder;
  final bool? isCenterText;
  final bool? isInterNormal;
  final bool? isMultiLines;
  final bool isFillColor;
  final int? multiLines;
  final BorderRadius? borderRaduis;
  final bool? isContentPadding;
  final bool isModal;

  const OutlinedBorderTextFormField({
    Key? key,
    this.label,
    this.labelColor = Style.black,
    this.multiLines = 10,
    this.suffixIcon,
    this.isLabelTextBold = false,
    this.onTap,
    this.fillColor = Style.textGrey,
    this.obscure,
    this.isFillColor = true,
    this.isContentPadding = false,
    this.validation,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.suffixIconConstraintsWidth = 30,
    this.suffixIconConstraintsHeight = 30,
    this.labelText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hint = "",
    this.hintColor = Style.black,
    this.differBorderColor = Style.textGrey,
    this.isCenterText = false,
    this.isInterNormal = true,
    this.isMultiLines = false,
    this.borderRaduis,
    this.haveBorder = true,
    this.isModal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label!,
                style: Style.interNormal(
                  size: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              10.verticalSpace,
            ],
          ),
        SizedBox(
          height: isModal ? 50.h : null,
          child: TextFormField(
            onTap: onTap,
            onChanged: onChanged,
            obscureText: !(obscure ?? true),
            obscuringCharacter: '*',
            controller: textController,
            validator: validation,
            style: Style.interNormal(
              size: 15.sp,
              color: Style.black,
            ),
            cursorWidth: 1,
            cursorColor: Style.black,
            keyboardType: inputType,
            initialValue: initialText,
            textAlign:
                isCenterText == true ? TextAlign.center : TextAlign.start,
            textAlignVertical: isCenterText == true
                ? TextAlignVertical.center
                : TextAlignVertical.bottom,
            readOnly: readOnly,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            textInputAction: textInputAction,
            maxLines: isMultiLines == false ? 1 : multiLines,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: isModal ? null : labelText,
              labelStyle:
                  isLabelTextBold ? Style.interBold() : Style.interNormal(),
              suffixIconConstraints: BoxConstraints(
                  maxHeight: suffixIconConstraintsHeight.h,
                  maxWidth: suffixIconConstraintsWidth.h),
              suffixIcon: suffixIcon,
              suffixIconColor: Style.textGrey,
              hintText: hint,
              hintStyle: isInterNormal == true
                  ? Style.interNormal(
                      size: 13,
                      color: hintColor ?? Style.primaryColor,
                    )
                  : Style.interNormal(
                      size: 14,
                    ),
              /*contentPadding: REdgeInsets.symmetric(horizontal: 10, vertical: 8),
              floatingLabelBehavior: FloatingLabelBehavior.always,*/
              fillColor: fillColor,
              filled: isFillColor ? true : false,
              enabledBorder: haveBorder == true
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: differBorderColor ?? Style.black,
                      ),
                      borderRadius: borderRaduis!,
                    )
                  : InputBorder.none,
              errorBorder: haveBorder == true
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: differBorderColor ?? Style.black,
                      ),
                      borderRadius: borderRaduis!,
                    )
                  : InputBorder.none,
              focusedErrorBorder: UnderlineInputBorder(),
              disabledBorder: haveBorder == true
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: differBorderColor ?? Style.black,
                      ),
                      borderRadius: borderRaduis!,
                    )
                  : InputBorder.none,
              focusedBorder: haveBorder == true
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: differBorderColor ?? Style.black,
                      ),
                      borderRadius: borderRaduis!,
                    )
                  : InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

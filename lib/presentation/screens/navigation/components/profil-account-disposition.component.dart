import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';

class ProfilAccountDispositionComponent extends StatefulWidget {
  String title;
  String subTitle;
  String iconPath;
  VoidCallback onTap;
  bool isIcon;
  bool haveSubTitle;
  bool isSupport;
  ProfilAccountDispositionComponent({super.key, required this.title, required this.subTitle, required this.iconPath, required this.onTap, required this.haveSubTitle, required this.isIcon, required this.isSupport });

  @override
  State<ProfilAccountDispositionComponent> createState() => _ProfilAccountDispositionComponentState();
}

class _ProfilAccountDispositionComponentState extends State<ProfilAccountDispositionComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, style: BorderStyle.solid, color: Style.primaryColor)
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    widget.isIcon ? SvgPicture.asset(widget.iconPath) : Container(),
                    widget.isIcon ? 10.horizontalSpace : 0.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                          style: Style.interNormal(
                            color: Style.black,
                            size: 16,
                          ),
                        ),
                        widget.haveSubTitle ? Text(
                          widget.subTitle,
                          style: Style.interNormal(
                              size: 10.sp,
                              color: Style.black
                          ),
                        ) : Container()
                      ],
                    ),
                  ],
                ),
                widget.isSupport ? SvgPicture.asset("assets/svgs/call.svg") :  SvgPicture.asset("assets/svgs/forward_icon.svg"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

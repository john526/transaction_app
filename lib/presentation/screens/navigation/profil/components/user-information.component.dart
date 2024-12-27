import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/buttons/custom.button.dart';
import 'package:transaction_app/presentation/components/text_fields/outline_bordered.text_field.dart';
import 'package:transaction_app/presentation/controllers/auth/auth.controller.dart';

class UserInformationComponent extends StatefulWidget {
  const UserInformationComponent({super.key});

  @override
  State<UserInformationComponent> createState() =>
      _UserInformationComponentState();
}

class _UserInformationComponentState extends State<UserInformationComponent> {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.white,
        elevation: 0.0,
        title: Text(
          "Profile",
          style: Style.interNormal(),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Style.black),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 500.w,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Style.secondaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                    color: Style.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/svgs/profil.svg",
                          width: 80.w,
                        ),
                      ),
                      50.verticalSpace,
                      TextInfo("Mise à jour des informations de connexion",
                          true, 18, Style.black),
                      20.verticalSpace,
                      Obx(()=>OutlinedBorderTextFormField(
                        haveBorder: true,
                        isFillColor: true,
                        fillColor: Style.primaryColor,
                        borderRaduis: BorderRadius.circular(10),
                        hintColor: Style.black,
                        isInterNormal: false,
                        inputType: TextInputType.text,
                        differBorderColor: Style.secondaryColor,
                        hint: "${authController.usernameObs}",
                        isCenterText: false,
                        isContentPadding: true,
                        onChanged: authController.setUsernameObs,
                      )),
                      20.verticalSpace,
                      Obx(()=>OutlinedBorderTextFormField(
                        haveBorder: true,
                        isFillColor: true,
                        fillColor: Style.primaryColor,
                        borderRaduis: BorderRadius.circular(10),
                        hintColor: Style.black,
                        isInterNormal: false,
                        inputType: TextInputType.number,
                        differBorderColor: Style.secondaryColor,
                        hint: "${authController.phoneObs}",
                        isContentPadding: true,
                        isCenterText: false,
                        onChanged: authController.setPhoneObs,
                      )),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
              100.verticalSpace,
              SizedBox(
                height: 40.h,
                child: Obx(()=>CustomButton(
                  title: "Mise à jour ",
                  radius: 10,
                  //isBold: true,
                  isLoading: authController.isLoadingObs.value,
                  background: Style.secondaryColor,
                  onPressed: () {
                    authController.isLoadingObs.value
                        ? null
                        : authController.updateCustomerInformation(context);
                  },
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TextInfo(String title, bool isBold, int size, Color color) {
    return Container(
      child: Text(
        title,
        overflow: TextOverflow.clip,
        style: isBold
            ? Style.interBold(size: size.sp)
            : Style.interNormal(size: size.sp),
      ),
    );
  }
}

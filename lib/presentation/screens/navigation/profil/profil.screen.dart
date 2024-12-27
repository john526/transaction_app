import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transaction_app/app/common/app_helpers.common.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/domaine/entities/customer.entity.dart';
import 'package:transaction_app/presentation/controllers/auth/auth.controller.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';
import 'package:transaction_app/presentation/screens/navigation/components/profil-account-disposition.component.dart';
import 'package:upgrader/upgrader.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final CustomerEntity? customer = AppHelpersCommon.getCustomerInLocalStorage();
  final AuthController authController = Get.put(AuthController()); 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return UpgradeAlert(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              30.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text(
                    "Mon compte",
                    style: Style.interBold(size: 16.sp),
                  ),
                  10.verticalSpace,
                  Obx(
                    () => ProfilAccountDispositionComponent(
                        title: '${authController.usernameProfilObs}' ?? "",
                        subTitle: '${authController.phoneProfilObs}' ?? "",
                        iconPath: 'assets/svgs/profil.svg',
                        onTap: () =>
                            Get.toNamed(Routes.USER_INFORMATION_PATH_SCREEN),
                        isIcon: true,
                        haveSubTitle: true,
                        isSupport: false),
                  ),
                  5.verticalSpace,
                  ProfilAccountDispositionComponent(
                      title: 'Mot de passe',
                      subTitle: '',
                      iconPath: '',
                      onTap: () =>
                          Get.toNamed(Routes.CHANGE_PASSWORD_PATH_SCREEN),
                      isIcon: false,
                      haveSubTitle: false,
                      isSupport: false),
                  30.verticalSpace,
                ],
              ),
              30.verticalSpace,
              Center(
                child: Column(
                  children: [
                    Text(
                      "Fast Transfer",
                      style: Style.interNormal(
                          color: Style.secondaryColor, size: 12.sp),
                    ),
                    10.verticalSpace,
                    Text(
                      "V1.0.0",
                      style: Style.interNormal(
                          color: Style.secondaryColor, size: 12.sp),
                    )
                  ],
                ),
              ),
              30.verticalSpace,
              InkWell(
                onTap: (){
                  AppHelpersCommon.logoutApi();
                  authController.logout(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Se deconnecter",
                      style: Style.interBold(
                          isUnderLine: true, color: Style.secondaryColor),
                    )
                  ],
                ),
              ),
              130.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}

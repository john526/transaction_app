import 'package:flutter/material.dart';
import 'package:transaction_app/app/config/constants/app.constant.dart';
import 'package:transaction_app/app/config/constants/tr_keys.constant.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/buttons/custom.button.dart';
import 'package:transaction_app/presentation/controllers/auth/auth.controller.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';
import 'package:get/get.dart';
import 'package:transaction_app/presentation/screens/auth/components/login-welcome.component.dart';
import '../../components/text_fields/outline_bordered.text_field.dart';
import 'package:upgrader/upgrader.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return UpgradeAlert(
      child: GetBuilder<AuthController>(
        builder: (authController) => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Style.otherOrange,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/jpeg/abstract-smooth-orange-background-layout-designstudioroom-web-template-business-report-with-smooth-c.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    child: Column(
                      children: [
                        //150.verticalSpace,
                        LoginWelcomeComponent(
                            message: "Veuillez vous connecter svp ! ",
                            haveAccount: false),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Style.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (PhoneNumber number) {
                                setState(() {
                                  authController.phoneNumberInputLogin = number;
                                });
                              },
                              validator: (userInput) {
                                if (userInput!.isEmpty) {
                                  return 'Entrez un numéro valide';
                                }
                                // Ensure the phone number starts with '0' and contains exactly 10 digits.
                                if (!RegExp(r'^0\d{1}(\s?\d{2}){3}\s?\d{2}$')
                                    .hasMatch(userInput)) {
                                  return 'Entrez un numéro valide svp';
                                }
                                return null;
                              },
                              selectorConfig: SelectorConfig(
                                selectorType:
                                    PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.onUserInteraction,
                              cursorColor: Style.neutralGrey,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              initialValue:
                                  authController.phoneNumberInputLogin,
                              textFieldController:
                                  authController.phoneNumberLoginController,
                              formatInput: true,
                              keyboardType: TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputDecoration: InputDecoration(
                                  fillColor: Style.primaryColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10)),
                                  labelText:
                                      TrKeysConstant.phoneOrEmailLabelText,
                                  labelStyle: TextStyle(color: Style.black)),
                              inputBorder: OutlineInputBorder(),
                              countries: COUNTRIES,
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        OutlinedBorderTextFormField(
                          labelText: TrKeysConstant.passwordLabelText,
                          obscure: authController.showPassword,
                          hintColor: Style.black,
                          haveBorder: true,
                          isFillColor: true,
                          borderRaduis: BorderRadius.circular(10),
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            padding: const EdgeInsets.only(right: 13),
                            icon: authController.password.isNotEmpty
                                ? SvgPicture.asset(
                                    authController.showPassword
                                        ? '${TrKeysConstant.svgPath}fluent_eye-24-regular.svg'
                                        : '${TrKeysConstant.svgPath}tabler_eye-closed.svg',
                                    height: 20.h,
                                  )
                                : Container(),
                            onPressed: () => authController
                                .setShowPassword(!authController.showPassword),
                          ),
                          onChanged: authController.setPassword,
                          isError: authController.isPasswordNotValid,
                          fillColor: Style.white,
                          descriptionText: authController.isPasswordNotValid
                              ? TrKeysConstant.passwordDescriptionText
                              : null,
                        ),
                        size.height > 700
                            ? 100.verticalSpace
                            : 50.verticalSpace,
                        SizedBox(
                          height: 70.h,
                          child: CustomButton(
                            isLoading: authController.isLoading,
                            background: Style.secondaryColor,
                            textColor: Style.primaryColor,
                            isLoadingColor: Style.primaryColor,
                            title: TrKeysConstant.connexionButtonLoginText,
                            radius: 10,
                            onPressed: () {
                              //Get.offAllNamed(Routes.NAVIGATION_PATH_SCREEN);
                              authController.isLoading
                                  ? null
                                  : authController.login(context);
                            },
                          ),
                        ),
                        20.verticalSpace,
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SIGNUP_PATH_SCREEN);
                            debugPrint("===============+> go to signup");
                          },
                          child: Text(
                            "Pas de compte ? Inscrire toi ici !!!",
                            style: Style.interBold(
                              color: Style.primaryColor,
                              size: 16.sp,
                              underLineColor: Style.primaryColor,
                              //isUnderLine: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

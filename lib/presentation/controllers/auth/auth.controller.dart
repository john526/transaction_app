import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transaction_app/app/common/app_helpers.common.dart';
import 'package:transaction_app/app/config/constants/auth.constant.dart';
import 'package:transaction_app/app/config/constants/customer.constant.dart';
import 'package:transaction_app/app/config/constants/first-time.constant.dart';
import 'package:transaction_app/app/services/app-connectivity.service.dart';
import 'package:transaction_app/app/services/local-storage.service.dart';
import 'package:transaction_app/data/repositories/auth/auth.repository.dart';
import 'package:transaction_app/data/repositories/core/core.repository.dart';
import 'package:transaction_app/domaine/entities/customer.entity.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:transaction_app/presentation/components/snack-bar/error-message.snack.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';

class AuthController extends GetxController {
  bool isLoading = false;
  RxBool isLoadingObs = false.obs;
  String password = "";
  String username = "";
  String phone = "";
  RxBool isChecked = false.obs;

  bool isLoginError = false;
  bool isEmailNotValid = false;
  bool isPasswordNotValid = false;

  bool showPassword = false;
  bool isUsernameNotValid = false;
  bool isPhoneNotValid = false;

  final AuthRepository authRepository = AuthRepository();
  final CoreRepository coreRepository = CoreRepository();
  final CustomerEntity? customer = AppHelpersCommon.getCustomerInLocalStorage();

  RxString usernameObs = "".obs;
  RxString phoneObs = "".obs;

  RxString usernameProfilObs = "".obs;
  RxString phoneProfilObs = "".obs;

  PhoneNumber? phoneNumberInput;
  TextEditingController phoneNumberController = TextEditingController();

  PhoneNumber? phoneNumberInputLogin;
  TextEditingController phoneNumberLoginController = TextEditingController();

  void onInit() {
    super.onInit();
    if (customer != null) {
      usernameObs.value = customer!.username;
      phoneObs.value = customer!.phone;

      usernameProfilObs.value = customer!.username;
      phoneProfilObs.value = customer!.phone;
    }
  }

  @override
  void onReady() {
    if (customer != null) {
      usernameProfilObs.value = customer!.username;
      phoneProfilObs.value = customer!.phone;
    }
    super.onReady();
  }

  void setPassword(String value) {
    password = value.trim();
    isLoginError = false;
    isPasswordNotValid = false;
    update();
  }

  setChecked(bool value) {
    isChecked.value = value;
    update();
  }

  void setPhone(String value) {
    phone = value;
    isLoginError = false;
    isPhoneNotValid = false;
    update();
  }

  void setUsername(String value) {
    username = value.trim();
    isLoginError = false;
    isUsernameNotValid = false;
    update();
  }

  void setPhoneObs(String value) {
    if (value.isEmpty) {
      phoneObs.value = customer!.phone;
    } else {
      phoneObs.value = value;
    }
    isLoginError = false;
    isPhoneNotValid = false;
    update();
  }

  void setUsernameObs(String value) {
    if (value.isEmpty) {
      usernameObs.value = customer!.username;
    } else {
      usernameObs.value = value.trim();
    }

    isLoginError = false;
    isUsernameNotValid = false;
    update();
  }

  void setShowPassword(bool show) {
    showPassword = show;
    update();
  }

  void setEmail(String value) {}

  Future<void> login(BuildContext context) async {
    final connected = await AppConnectivityService.connectivity();
    if (connected) {
      isLoading = true;
      update();
      final splitPhone =
          splitCountryIndicator(phoneNumberInputLogin?.phoneNumber);
      final response = await authRepository.login(
          phone: splitPhone ?? "", password: password);
      response.when(success: (data) async {
        LocalStorageService.instance
            .set(AuthConstant.keyToken, data?.token ?? "");
        LocalStorageService.instance
            .set(FirstTimeConstant.keyFirstTime, "already use");
        await getCustomer(context, data!.customerId);
      }, failure: (failure, status) {
        isLoading = false;
        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoading = false;
      // collect information (e.g mixpanel)
      // ignore: use_build_context_synchronously
      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  Future<void> getCustomer(BuildContext context, String customerId) async {
    final connected = await AppConnectivityService.connectivity();
    if (connected) {
      isLoading = true;
      update();
      final response = await coreRepository.getCustomer(customerId);

      response.when(success: (data) async {
        LocalStorageService.instance
            .set(CustomerConstant.keyCustomer, jsonEncode(data));

        isLoading = false;
        update();
        Get.offAllNamed(Routes.NAVIGATION_PATH_SCREEN);
      }, failure: (failure, status) {
        isLoading = false;
        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoading = false;
      // ignore: use_build_context_synchronously
      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  Future<void> signUp(BuildContext context) async {
    final connected = await AppConnectivityService.connectivity();

    if (connected) {
      if (username.isEmpty || username.length <= 2) {
        isUsernameNotValid = true;
        update();
        ErrorMessageSnack.showErrorSnackbar(
            context, "Entrez un nom d'utilisateur correcte SVP.");
        return;
      }
      final splitPhone = splitCountryIndicator(phoneNumberInput?.phoneNumber);
      if (splitPhone.isEmpty || splitPhone.length != 10) {
        isUsernameNotValid = true;
        update();
        ErrorMessageSnack.showErrorSnackbar(
            context, "Entrez un numéro de téléphone valide SVP.");
        return;
      }
      if (password.isEmpty || password.length < 4) {
        isUsernameNotValid = true;
        update();
        ErrorMessageSnack.showErrorSnackbar(
            context, "Entrez un mot passe fort SVP.");
        return;
      }

      isLoading = true;
      update();
      final response = await coreRepository.signUp(
          phone: splitPhone ?? "", password: password, username: username);
      response.when(success: (data) async {
        LocalStorageService.instance
            .set(CustomerConstant.keyCustomer, jsonEncode(data));
        await getCustomerAccessToken(context, data!.id);
        LocalStorageService.instance
            .set(FirstTimeConstant.keyFirstTime, "already use");

        var profile = {
          'user_name': data?.username ?? "",
          'Phone': data?.phone ?? "",
          'Id': data?.id ?? "",
        };
        initializeAuthField();
      }, failure: (failure, status) {
        isLoading = false;

        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoading = false;
      // ignore: use_build_context_synchronously

      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  Future<void> getCustomerAccessToken(
      BuildContext context, String customerId) async {
    final connected = await AppConnectivityService.connectivity();
    if (connected) {
      isLoading = true;
      update();
      final response = await authRepository.getCustomerAccessToken(customerId);

      response.when(success: (data) async {
        LocalStorageService.instance
            .set(AuthConstant.keyToken, data?.token ?? "");
        isLoading = false;
        update();
        Get.offAllNamed(Routes.NAVIGATION_PATH_SCREEN);
      }, failure: (failure, status) {
        isLoading = false;
        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoading = false;

      // ignore: use_build_context_synchronously
      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  Future<void> updateCustomerInformation(BuildContext context) async {
    final connected = await AppConnectivityService.connectivity();
    if (connected) {
      isLoadingObs.value = true;
      update();

      final data = {"username": usernameObs.value, "phone": phoneObs.value};
      String customerId = customer!.id;

      final response = await coreRepository.patchCustomer(data, customerId);

      response.when(success: (data) async {
        LocalStorageService.instance.delete(CustomerConstant.keyCustomer);
        LocalStorageService.instance
            .set(CustomerConstant.keyCustomer, jsonEncode(data));

        usernameObs.value = data!.username ?? "";
        phoneObs.value = data!.phone ?? "";

        usernameProfilObs.value = data!.username ?? "";
        phoneProfilObs.value = data!.phone ?? "";

        Get.back();

        isLoadingObs.value = false;
        update();
      }, failure: (failure, status) {
        isLoadingObs.value = false;

        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoadingObs.value = false;

      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  Future<void> logout(BuildContext context) async {
    final connected = await AppConnectivityService.connectivity();
    if (connected) {
      isLoading = true;
      update();

      String customerId = customer!.id;
      final response = await authRepository.logout(customerId);
      response.when(success: (data) async {
        LocalStorageService.instance.logout();

        isLoading = false;
        update();
      }, failure: (failure, status) {
        isLoading = false;
        ErrorMessageSnack.showErrorSnackbar(context, failure.toString());
        update();
      });
    } else {
      isLoading = false;
      // ignore: use_build_context_synchronously

      ErrorMessageSnack.showNoConnectivitySnackbar(context);
      update();
    }
  }

  void refreshProfileData() {
    usernameProfilObs.refresh();
    phoneProfilObs.refresh();
  }

  void initializeAuthField() {
    setPhone("");
    setUsername('');
  }

  void initializeUpdatProfileField() {
    setUsernameObs("");
    setPhoneObs("");
  }

  String splitCountryIndicator(String? phoneNumber) {
    if (phoneNumber == null) return '';

    String splitDialCode = phoneNumber.replaceFirst(RegExp(r'^\+?225'), '');
    return splitDialCode;
  }
}

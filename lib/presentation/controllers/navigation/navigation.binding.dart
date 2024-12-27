import 'package:get/instance_manager.dart';
import 'package:transaction_app/presentation/controllers/navigation/home/home.controller.dart';
import 'package:transaction_app/presentation/controllers/navigation/navigation.controller.dart';
import 'package:transaction_app/presentation/controllers/navigation/profil/profil.controller.dart';
import 'package:transaction_app/presentation/controllers/navigation/transfer/transfer.controller.dart';

class NavigationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TransfersController());
    Get.lazyPut(() => ProfilController());
    Get.lazyPut(() => NavigationController());
  }
}
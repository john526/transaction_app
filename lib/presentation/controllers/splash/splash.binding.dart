
import 'package:get/instance_manager.dart';
import 'package:transaction_app/presentation/controllers/splash/splash.controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
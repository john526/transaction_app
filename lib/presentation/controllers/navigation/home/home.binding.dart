import 'package:get/instance_manager.dart';
import 'package:transaction_app/presentation/controllers/navigation/home/home.controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
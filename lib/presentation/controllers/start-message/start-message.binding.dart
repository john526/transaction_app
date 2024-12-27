import 'package:get/get.dart';
import 'package:transaction_app/presentation/controllers/start-message/start-message.controller.dart';

class StartMessageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StartMessageController());
  }
}
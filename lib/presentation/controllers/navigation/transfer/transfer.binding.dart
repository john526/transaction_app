import 'package:get/instance_manager.dart';
import 'package:transaction_app/presentation/controllers/navigation/transfer/transfer.controller.dart';

class TransferBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TransfersController());
  }
}
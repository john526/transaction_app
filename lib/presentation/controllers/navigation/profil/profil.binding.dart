import 'package:get/instance_manager.dart';
import 'package:transaction_app/presentation/controllers/navigation/profil/profil.controller.dart';

class ProfilBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProfilController());
  }
}
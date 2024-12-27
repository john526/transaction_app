import 'package:get/get.dart';

class NavigationController extends GetxController {
  bool isScrolling = false;
  int selectIndex = 0;
  bool activeCart = false;

  @override
  void onInit() {
    super.onInit();
  }

  void selectIndexFunc(int index) {
    selectIndex = index;
    update();
  }

}
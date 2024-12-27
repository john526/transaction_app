import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/keyboard_dismisser.ui.dart';
import 'package:transaction_app/presentation/controllers/navigation/navigation.controller.dart';
import 'package:transaction_app/presentation/screens/navigation/home/home.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/profil/profil.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/transfer/transfer.screen.dart';
import 'package:upgrader/upgrader.dart';
class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final navigationController = Get.find<NavigationController>();

  late List<IndexedStackChild> list;
  void handleBottomNavBarTap(int index) {
    navigationController.selectIndexFunc(index);
  }

  @override
  void initState() {
    list = [
      IndexedStackChild(child: const HomeScreen()),
      IndexedStackChild(
        child: const TransfersScreen(),
      ),
      IndexedStackChild(
        child: const ProfilScreen(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<NavigationController>(
      builder: (navigationController) => UpgradeAlert(
        child: KeyboardDismisserUi(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBar(
                centerTitle: true,
                elevation: 0,
                automaticallyImplyLeading:false,
                title: Text(
                    "Fast Transfer",
                  style: Style.interNormal(
                    color: Style.black
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: (){
                      debugPrint("==============> go to the cart");
                    },
                    child: navigationController.selectIndex == 0 ? Stack(
                      children: [
                        Positioned(
                          right: size.height> 700 ? 10 : 6,
                          top: size.height> 700 ? 5 : 5,
                          child: Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: Style.red,
                              shape: BoxShape.circle
                            ),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Style.textGrey.withOpacity(0.2),
                              shape: BoxShape.circle
                          ),
                          child: Icon(Icons.notifications, color: Style.secondaryColor,),
                        )
                      ],
                    ) :SizedBox(),
                  ),
                  SizedBox(),
                  10.verticalSpace
                ],
                iconTheme: const IconThemeData(color: Style.secondaryColor),
                backgroundColor: Style.white,
              ),
            ),
            /*drawer: const Drawer(
              backgroundColor: Style.white,
              child: DrawerPageComponent(),
            ),*/
            body: ProsteIndexedStack(
              index: navigationController.selectIndex,
              children: list,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Style.white,
              selectedItemColor: Style.secondaryColor,
              unselectedItemColor: Style.textGrey,
              type: BottomNavigationBarType.fixed,
              currentIndex: navigationController.selectIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              onTap: handleBottomNavBarTap,
              items: [
                BottomNavigationBarItem(
                    label: "Home",
                    icon: SvgPicture.asset("assets/svgs/home.svg"),
                    activeIcon:
                    SvgPicture.asset("assets/svgs/home-active.svg")),
                BottomNavigationBarItem(
                    label: "Mes commandes",
                    icon: SvgPicture.asset("assets/svgs/order.svg"),
                    activeIcon:
                    SvgPicture.asset("assets/svgs/order-active.svg")),
                BottomNavigationBarItem(
                    label: "Profil",
                    icon: SvgPicture.asset("assets/svgs/profil.svg"),
                    activeIcon:
                    SvgPicture.asset("assets/svgs/profil-active.svg")),
                BottomNavigationBarItem(
                    label: "Aide",
                    icon: SvgPicture.asset("assets/svgs/help.svg"),
                    activeIcon:
                    SvgPicture.asset("assets/svgs/help-active.svg")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
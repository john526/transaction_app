import 'package:get/get.dart';
import 'package:transaction_app/presentation/controllers/navigation/home/home.binding.dart';
import 'package:transaction_app/presentation/controllers/navigation/navigation.binding.dart';
import 'package:transaction_app/presentation/controllers/navigation/profil/profil.binding.dart';
import 'package:transaction_app/presentation/controllers/navigation/transfer/transfer.binding.dart';
import 'package:transaction_app/presentation/controllers/splash/splash.binding.dart';
import 'package:transaction_app/presentation/controllers/start-message/start-message.binding.dart';
import 'package:transaction_app/presentation/screens/navigation/home/home.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/navigation.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/profil/components/change-password.component.dart';
import 'package:transaction_app/presentation/screens/navigation/profil/components/user-information.component.dart';
import 'package:transaction_app/presentation/screens/navigation/profil/profil.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/transfer/make-transfer.screen.dart';
import 'package:transaction_app/presentation/screens/navigation/transfer/transfer.screen.dart';
import 'package:transaction_app/presentation/screens/splash/splash.screen.dart';
import 'package:transaction_app/presentation/screens/start-message/start-message.screen.dart';

part 'presentation_path.route.dart';

class PresentationScreenRoute {
  PresentationScreenRoute._();

  static const INITIAL = Routes.SPLASH_PATH_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH_PATH_SCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_PATH_SCREEN,
      page: () => const NavigationScreen(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PATH_SCREEN,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.TRANSFERS_PATH_SCREEN,
      page: () => const TransfersScreen(),
      binding: TransferBinding(),
    ),

    GetPage(
      name: _Paths.MAKE_TRANSFER_PATH_SCREEN,
      page: () => const MakeTransferScreen(),
      binding: TransferBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFORMATION_PATH_SCREEN,
      page: () => const UserInformationComponent(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_PATH_SCREEN,
      page: () => const ChangePasswordComponent(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL_PATH_SCREEN,
      page: () => const ProfilScreen(),
      binding: ProfilBinding(),
    ),
     GetPage(
      name: _Paths.SPLASH_PATH_SCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.START_MESSAGE_PATH_SCREEN,
      page: () => const StartMessageScreen(),
      binding: StartMessageBinding(),
    ),
  ];
}

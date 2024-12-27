part of 'presentation_screen.route.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_PATH_SCREEN = _Paths.SPLASH_PATH_SCREEN;
  static const HOME_PATH_SCREEN = _Paths.HOME_PATH_SCREEN;
  static const LOGIN_PATH_SCREEN = _Paths.LOGIN_PATH_SCREEN;
  static const SIGNUP_PATH_SCREEN = _Paths.SIGNUP_PATH_SCREEN;
  static const TRANSFERS_PATH_SCREEN = _Paths.TRANSFERS_PATH_SCREEN;
  static const MAKE_TRANSFER_PATH_SCREEN = _Paths.MAKE_TRANSFER_PATH_SCREEN;
  static const DETAIL_TRANSFER_PATH_SCREEN = _Paths.DETAIL_TRANSFER_PATH_SCREEN;
  static const PROFIL_PATH_SCREEN = _Paths.PROFIL_PATH_SCREEN;
  static const NAVIGATION_PATH_SCREEN = _Paths.NAVIGATION_PATH_SCREEN;
  static const START_MESSAGE_PATH_SCREEN = _Paths.START_MESSAGE_PATH_SCREEN;
  static const USER_INFORMATION_PATH_SCREEN =
      _Paths.USER_INFORMATION_PATH_SCREEN;
  static const CHANGE_PASSWORD_PATH_SCREEN = _Paths.CHANGE_PASSWORD_PATH_SCREEN;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_PATH_SCREEN = "/splash";
  static const HOME_PATH_SCREEN = "/home";
  static const TRANSFERS_PATH_SCREEN = '/transfer';
  static const LOGIN_PATH_SCREEN = '/login';
  static const SIGNUP_PATH_SCREEN = '/signup';
  static const MAKE_TRANSFER_PATH_SCREEN = '/make_transfer';
  static const DETAIL_TRANSFER_PATH_SCREEN = '/detail_transfer';
  static const PROFIL_PATH_SCREEN = '/profil';
  static const NAVIGATION_PATH_SCREEN = '/navigation';
  static const START_MESSAGE_PATH_SCREEN = '/start-message';
  static const USER_INFORMATION_PATH_SCREEN = '/user_information';
  static const CHANGE_PASSWORD_PATH_SCREEN = '/change_password';
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_app/app/config/constants/auth.constant.dart';
import 'package:transaction_app/app/config/constants/customer.constant.dart';

class LocalStorageService{
  static SharedPreferences? _preferences;

  LocalStorageService._();

  static LocalStorageService? _localStorage;

  static LocalStorageService instance = LocalStorageService._();

  static Future<LocalStorageService> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorageService._();
      await _localStorage!._init();
    }
    return _localStorage!;
  }
   static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localStorage = LocalStorageService._();
      await _localStorage!._init();
    }
    return _preferences!;
  }

  String? get(String key) {
    return _preferences?.getString(key);
  }

  Future<void> set(String key, String value) async {
    await _preferences?.setString(key, value);
  }

  void delete(String key) {
    _preferences?.remove(key);
  }

  void logout(){
    delete(AuthConstant.keyToken);
    delete(CustomerConstant.keyCustomer);
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
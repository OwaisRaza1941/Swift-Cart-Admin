import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static late SharedPreferences _prefs;

  static Future<void> initilize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }
}

class LocalStorageKeys {
  static const String isOnboarding = "is_onboarding";
}

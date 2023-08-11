import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper{
  static SharedPreferences? prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(bool isDark) async {
    return await prefs!.setBool('isDark', isDark);
  }

  static bool getData(){
    return prefs!.getBool('isDark') ?? false;
  }
}
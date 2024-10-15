import 'package:shared_preferences/shared_preferences.dart';

class ConfigManager {
  static const String _baseURLKey = 'baseURL';

  static Future<void> setBaseURL(String url) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_baseURLKey, url);
  }

  static Future<String?> getBaseURL() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_baseURLKey);
  }
}

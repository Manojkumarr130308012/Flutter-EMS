import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static Future<SharedPreferences> get _getInstance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _getInstance;
    return _prefsInstance!;
  }

  static Future<bool> reset() async {
    _prefsInstance = await _getInstance;
    return _prefsInstance!.clear();
  }

  // Set the value to the Key
  static void setString(String key, String value) async {
    var prefs = await _getInstance;
    prefs.setString(key, value);
  }

  static void setBoolean(String key, bool value) async {
    var prefs = await _getInstance;
    prefs.setBool(key, value);
  }

  static void setInt(String key, int value) async {
    var prefs = await _getInstance;
    prefs.setInt(key, value);
  }

  // Get the value from the Key
  static String? getString(String? key, [String? defValue]) {
    return _prefsInstance!.getString(key!) ?? defValue ?? "";
  }

  static bool? getBoolean(String? key, [bool? defValue]) {
    return _prefsInstance!.getBool(key!) ?? defValue ?? false;
  }

  static int getInt(String? key, [int? defValue]) {
    return _prefsInstance!.getInt(key!) ?? defValue ?? 0;
  }

  Future clearSession(String key, String value) async {
    var prefs = await _getInstance;
    prefs.setString(key, value);
  }
}

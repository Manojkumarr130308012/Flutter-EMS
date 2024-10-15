import 'package:shared_preferences/shared_preferences.dart';

import '../dio_client.dart';
import '../enum/network_enums.dart';
import 'cache_manager.dart';

class AuthCacheManager {
  Future<bool> isFirstEntry() async {
    return !(await CacheManager.getBool(NetworkEnums.introOff.path) ?? false);
  }

  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool(NetworkEnums.login.path)) ?? false;
  }

  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  Future<void> updateFirstEntry() async {
    await CacheManager.setBool(NetworkEnums.introOff.path, true);
  }

  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool(NetworkEnums.login.path, isLoggedIn);
  }

  Future<void> updateToken(String? token) async {
    if (token != null) {
      print("token from authCacheManager.updateToken: $token");
      storeToken(token);
      await CacheManager.setString(NetworkEnums.token.path, token);
      DioManager.instance.dio.options.headers['Authorization'] =
          'Bearer $token';
      print(
          "Header: ${DioManager.instance.dio.options.headers['Authorization']}");

      /// Actually, we will not need it for this application.
      /// But I've included it here for instructive purposes.
    } else {
      if (await CacheManager.containsKey(NetworkEnums.token.path)) {
        await CacheManager.remove(NetworkEnums.token.path);
        DioManager.instance.dio.options.headers.clear();
      }
    }
  }

  Future<void> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('bearer_token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('bearer_token');
  }

  Future<void> updateTokenFromStorage() async {
    if (await CacheManager.containsKey(NetworkEnums.token.path)) {
      final token = await CacheManager.getString(NetworkEnums.token.path);
      print("token from authCacheManager.updatetokenfromStorage: $token");
      if (token != null) {
        DioManager.instance.dio.options.headers['Authorization'] =
            'Bearer $token';

        /// Actually, we will not need it for this application.
        /// But I've included it here for instructive purposes.
      }
    }
  }
}

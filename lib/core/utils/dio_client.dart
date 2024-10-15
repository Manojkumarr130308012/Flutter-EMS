import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioManager {
  static DioManager? _instance;

  static DioManager get instance {
    if (_instance != null) return _instance!;
    _instance = DioManager._init();
    return _instance!;
  }

  late final Dio dio;

  DioManager._init() {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? baseUrl = prefs.getString('base_url') ?? '';

    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          followRedirects: true,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          responseType: ResponseType.json,
          validateStatus: (status) {
            return status! >= 200 && status < 300 || status == 401;
          }),
    );
  }
}

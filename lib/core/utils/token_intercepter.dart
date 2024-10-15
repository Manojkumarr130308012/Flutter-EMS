// import 'package:dio/dio.dart';
// import 'package:oriens_eam/core/utils/cache/auth_cache_manager.dart';
//
// import 'cache/cache_manager.dart';
// import 'enum/network_enums.dart';
//
// class TokenInterceptor extends Interceptor {
//   // final AuthCacheManager authCacheManager;
//
//   TokenInterceptor({required this.authCacheManager});
//   @override
//   Future onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // Here you can put the token, either from preference, sqlite, etc.
//     // Here is an example with Preferences
//     // final someToken? = prefs.getString('token');
//     // final token = await authCacheManager.updateTokenFromStorage()
//     // After you choose your token, you assign it to the request.
//     options.headers['Authorization'] = 'Bearer $token';
//     print("token is $token");
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // Do something with response data
//     super.onResponse(response, handler);
//   }
//
//   // @override
//   // Future onError(
//   //     DioError err,
//   //     ErrorInterceptorHandler handler,
//   //     ) async {
//   //   // If the error is 401 Unauthorized, log out the user
//   //   if (err.response?.statusCode == 401) {
//   //     _repository.logOut();
//   //     _appDatabase.userDao.deleteAllUsers();
//   //   }
//   //   super.onError(err, handler);
//   // }
// }

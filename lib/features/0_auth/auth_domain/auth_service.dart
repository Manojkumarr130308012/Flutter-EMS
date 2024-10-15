import 'dart:async';
import 'dart:io';

import '../../../core/utils/enum/network_enums.dart';
import '../auth_data/auth_model.dart';
import 'iauth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    try {
      final response = await dioManager.dio.post(
        NetworkEnums.login.path,
        data: AuthModel(
          email: email,
          password: password,
        ).toJson(),
      );
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final Map<String, dynamic> result = jsonResponse["result"];
        final String token = result["accessToken"];
        return token;
      } else {
        print("Invalid Password or Email");
      }
    } catch (e) {
      print("Login error: $e");
    }
    return null;
  }

  @override
  Future<String?> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await dioManager.dio.post(
        NetworkEnums.forgotPassword.path,
        data: {'email': email},
      );
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        return jsonResponse[
            'message']; // Adjust this based on your API response
      } else {
        print("Failed to send password reset link");
      }
    } catch (e) {
      print("Forgot Password error: $e");
    }
    return null;
  }
}

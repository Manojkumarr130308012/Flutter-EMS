import '../../../core/utils/dio_client.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<String?> login({
    required String email,
    required String password,
    required String deviceToken,
  });

  Future<String?> forgotPassword({
    required String email,
  });
}


import '../../../core/utils/preference_manager.dart';
import '../auth_data/auth_model.dart';
import 'auth_api.dart';

class AuthRepo {
  static Future<AuthModel> getAuthResults() async {
    String baseURL =
        await SharedPreferenceUtils.getString('eamAPIBaseURL') ?? "";
    print("baseeee" + baseURL);
    Map<String, dynamic> response =
        await AuthApi.getToken("$baseURL/users/signin");

    final AuthModel results = AuthModel.fromJson(response);

    print("loginModel : ${results.token}");

    return results;
  }
}

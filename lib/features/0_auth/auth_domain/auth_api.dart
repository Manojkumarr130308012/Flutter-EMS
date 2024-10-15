import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthApi {
  static Future<dynamic> getToken(
    String url,
  ) async {
    final data = {"email": "SiteAdmin@Orienseam", "password": "123@EAMADmin"};
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Map<String, dynamic> results = jsonResponse['result'];
      return results;
    }
  }
}

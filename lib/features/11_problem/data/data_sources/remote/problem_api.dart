import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class ProblemApiService {
  final DioManager dioManager;

  ProblemApiService({required this.dioManager});

  static Future<dynamic> getProblem(String failureClassId) async {
    Response response =
        await DioManager.instance.dio.get(NetworkEnums.allProblems.path + failureClassId);
    return response;

    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> body = jsonDecode(response.body);
    //   List<dynamic> results = body["result"];
    //   return results;
    // }
    // if (response.statusCode == 404) {
    //   final Map<String, dynamic> body = jsonDecode(response.body);
    //   dynamic message = body["failureMessage"];
    //   return message;
    // }
  }
}

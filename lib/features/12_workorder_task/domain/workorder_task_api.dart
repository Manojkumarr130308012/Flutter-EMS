import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/dio_client.dart';
import '../../../../../core/utils/enum/network_enums.dart';

class WorkOrderTaskApiService {
  final DioManager dioManager;

  WorkOrderTaskApiService({required this.dioManager});

  Future<dynamic> getWorkOrderTask(String workOrderId) async {
    Response response = await dioManager.dio.get(NetworkEnums.workOrderTask.path + workOrderId);
    return response;
  }
}

class WorkOrderTaskApi {
  // static Future<dynamic> getResults(String url) async {
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> jsonResponse = json.decode(response.body);
  //
  //     final List<dynamic> results = jsonResponse['result'];
  //
  //     return results;
  //   }
  // }

  static Future<String> updateWorkOrderStatus(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? baseURL = prefs.getString('eamAPIBaseURL');
    final response = await http.put(
      Uri.parse('$baseURL/workordertask/updatestatus'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      // Sample Data
      // {
      //   "taskStatus": "Created",
      //   "taskNo": "8",
      //   "jobPlanTaskId": "229bc63f-71c4-4392-ad00-e546f298d1e3",
      //   "id": "3094a2e7-bec9-4765-8f19-b2f012198159"
      // }

      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      print(body["message"]);
      return body["message"];
    } else {
      throw Exception('Failed to update WorkOrder.');
    }
  }
}

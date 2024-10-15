import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/preference_manager.dart';
import 'package:intl/intl.dart';


class WorkOrderStatusUpdateApi {
  // Update Status Method
  static Future<String> updateWorkOrderStatus(String id, String status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? bearerToken = prefs.getString('bearer_token');
    String baseURL = "https://demoapi.orienseam.com/api";
    if (bearerToken == null) {
      throw Exception('Bearer token not found.');
    }
    print(id);
    print(status);
    final response = await http.put(
      Uri.parse('$baseURL/workorder/updatestatus'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        "status": status,
        "notes": "Test",
        "reasontoCancel": "string",
        "currentReading": 0
      }),
    );

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      return body["message"];
    } else {
      throw Exception('Failed to update WorkOrder.');
    }
  }


  static Future<String> updateWorkOrderTaskStatus(String id, String status, String workOrderId, int currentReading, String meterId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? bearerToken = prefs.getString('bearer_token');
    String baseURL = "https://demoapi.orienseam.com/api";

    if (bearerToken == null) {
      throw Exception('Bearer token not found.');
    }


    List<Map<String, dynamic>> body = [
      {
        'id': id,
        'taskStatus': status,
      }
    ];

    DateTime currentDateTime = DateTime.now();
    String formattedDateTime = DateFormat('yyyy-MM-dd – kk:mm').format(currentDateTime);


    print("testttttttt${body}");
    final response = await http.post(
      Uri.parse('$baseURL/workordertask/bulkstatusupdate'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      return body["message"];
    } else {
      print(response.body);
      throw Exception('Failed to update WorkOrder.');
    }
  }


  static Future<String> updateWorkOrder(String id, String status,String assetId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? bearerToken = prefs.getString('bearer_token');
    String baseURL = "https://demoapi.orienseam.com/api";

    if (bearerToken == null) {
      throw Exception('Bearer token not found.');
    }

    print("bearerToken${bearerToken}");

    Map<String, dynamic> body = {
      'id': id,
      'workedHours': status,
      'assetId':assetId
    };

    print("testingggggg${body}");

    final response = await http.put(
      Uri.parse('$baseURL/workorder/update'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $bearerToken',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      return body["message"];
    } else {
      print(response.body);
      throw Exception('Failed to update WorkOrder.');
    }
  }
}





import 'package:oriens_eam/features/2_workorder/1_wo_domain/workorder_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../2_wo_data/workorders.dart';

class WorkOrderRepo {
  static Future<List<WorkOrder>> getWorkorderList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? baseURL = prefs.getString('eamAPIBaseURL');
    List<dynamic> response = await Api.get("$baseURL/workorder/getall");
    final List<WorkOrder> workOrders =
        response.map((json) => WorkOrder.fromJson(json)).toList();
    return workOrders;
  }

  static Future<List<WorkOrder>> getWorkorderListByAssetId(
      String assetId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? baseURL = prefs.getString('eamAPIBaseURL');
    List<dynamic> response =
        await Api.getWorkOrderByAssetId("$baseURL/workorder/search", assetId);
    final List<WorkOrder> workOrders =
        response.map((json) => WorkOrder.fromJson(json)).toList();
    return workOrders;
  }
}

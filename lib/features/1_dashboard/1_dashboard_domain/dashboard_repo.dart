import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';
import 'package:oriens_eam/features/1_dashboard/1_dashboard_domain/dashboard_api.dart';

import '../2_dashboard_data/dashboard_model.dart';

class DaskBoardWorkOrderRepo {
  static Future<int> getDashBoardWorkorderList(String status) async {
    List<dynamic> response = await DashBoardWorkOrderApiService(dioManager: DioManager.instance)
        .getWorkOrders(NetworkEnums.dashboardWorkOrder.path, status);
    final List<DashBoardWorkOrder> workOrders =
        response.map((json) => DashBoardWorkOrder.fromJson(json)).toList();
    print("How many WorkOrder in this Status: ${workOrders.length}");
    return workOrders.length;
  }
}

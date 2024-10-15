import 'package:dio/dio.dart';

import '../../../core/utils/dio_client.dart';
import '../../../core/utils/enum/network_enums.dart';

class WorkOrderStatusApiService {
  final DioManager dioManager;

  WorkOrderStatusApiService({required this.dioManager});

  Future<dynamic> getWorkOrderStatus() async {
    Response response =
        await dioManager.dio.get(NetworkEnums.workOrderStatus.path);

    print("response${response}");
    return response;
  }
}

// class WorkOrderStatusApi {
//   static Future<dynamic> fetchStatus(String url) async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final List<dynamic> jsonResponse = json.decode(response.body);
//
//       return jsonResponse;
//     }
//   }
// }

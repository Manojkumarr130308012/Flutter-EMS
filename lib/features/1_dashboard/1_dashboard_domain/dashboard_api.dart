import 'package:dio/dio.dart';

import '../../../core/utils/dio_client.dart';

// class DashBoardApi {
//   static Future<dynamic> get(String url, String status) async {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         "workOrderStatus": status,
//       }),
//     );
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonResponse = json.decode(response.body);
//       final List<dynamic> results = jsonResponse['result'];
//       return results;
//     }
//   }
// }

class DashBoardWorkOrderApiService {
  final DioManager dioManager;

  DashBoardWorkOrderApiService({required this.dioManager});

  Future<dynamic> getWorkOrders(String path, String status) async {
    Response response = await dioManager.dio.post(
      path,
      data: {
        "workOrderStatus": status,
      },
    );
    return response;
  }
}

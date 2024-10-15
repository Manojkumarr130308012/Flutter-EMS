import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class AddServiceRequestApi {
  final DioManager dioManager;

  AddServiceRequestApi({required this.dioManager});

  // static Future<void> addServiceRequest(ServiceRequest serviceRequest) async {
  //   final response = await http.post(
  //     Uri.parse("https://eamapi.s2tsoft.com/api/servicerequest/create"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(serviceRequest.toJson()),
  //   );
  //
  //   if (response.statusCode == 201) {
  //     print('Service Request Added successfully!');
  //   } else {
  //     throw Exception('Failed to post service request');
  //   }
  // }

  Future<void> addServiceRequest(Map<String, dynamic> serviceRequest) async {
    final response = await dioManager.dio.post(
      NetworkEnums.createServiceRequest.path,
      data: serviceRequest,
    );
    final responseBody = response.data;
    print("ResponseBody: $responseBody");
    if (response.statusCode == 200) {
      print('Service Request Added successfully!');
    } else {
      throw Exception('Failed to post service request');
    }
  }
}

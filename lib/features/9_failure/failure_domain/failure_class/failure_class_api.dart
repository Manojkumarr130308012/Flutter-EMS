import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class FailureClassApiService {
  final DioManager dioManager;

  FailureClassApiService({required this.dioManager});

  Future<dynamic> getFailureClass() async {
    Response response = await dioManager.dio.get(NetworkEnums.failureClass.path);
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> body = jsonDecode(response.body);
    //   List<dynamic> results = body["result"];
    return response;
  }
}

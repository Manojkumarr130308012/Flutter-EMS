import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class ServiceRequestApiService {
  final DioManager dioManager;

  ServiceRequestApiService({required this.dioManager});

  Future<dynamic> getResults() async {
    Response response = await dioManager.dio.get(NetworkEnums.serviceRequest.path);
    return response;
  }
}

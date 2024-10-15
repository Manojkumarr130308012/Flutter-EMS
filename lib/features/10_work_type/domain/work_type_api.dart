import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/core/utils/enum/network_enums.dart';

class WorkTypeApi {
  final DioManager dioManager;

  WorkTypeApi({required this.dioManager});

  Future<dynamic> getResults() async {
    Response response = await dioManager.dio.get(NetworkEnums.workType.path);
    return response;
  }
}

import 'package:dio/dio.dart';

import '../../../../core/utils/dio_client.dart';
import '../../../../core/utils/enum/network_enums.dart';

class WorkorderPartsApiService {
  final DioManager dioManager;

  WorkorderPartsApiService({required this.dioManager});

  Future<dynamic> getWorkorderParts(String workorderId) async {
    print(NetworkEnums.workorderParts.path + workorderId);
    Response response = await dioManager.dio
        .get(NetworkEnums.workorderParts.path + workorderId);
    print("response ${response}");
    return response;
  }
}

import 'package:dio/dio.dart';

import '../../../core/utils/dio_client.dart';
import '../../../core/utils/enum/network_enums.dart';

class LocationApiService {
  final DioManager dioManager;

  LocationApiService({required this.dioManager});

  Future<dynamic> getLocation() async {
    Response response = await dioManager.dio.get(NetworkEnums.allLocation.path);
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> body = jsonDecode(response.body);
    //   List<dynamic> results = body["result"];
    return response;
  }
}

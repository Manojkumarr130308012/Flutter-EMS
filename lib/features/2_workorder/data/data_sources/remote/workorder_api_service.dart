// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:oriens_eam/core/utils/constants.dart';
// import 'package:oriens_eam/features/2_workorder/data/models/workorder.dart';
//
// import '../../../../../core/utils/extensions/server_exception.dart';

// abstract class WorkorderRemoteDataSource {
//   Future<List<WorkOrderModel>> getWorkOrderList();
// }
//
// class WorkorderRemoteDataSourceImpl extends WorkorderRemoteDataSource {
//   final http.Client client;
//   WorkorderRemoteDataSourceImpl({required this.client});
//
//   @override
//   Future<List<WorkOrderModel>> getWorkOrderList() async {
//     final response = await client.get(
//       Uri.parse("$eamAPIBaseURL/api/workorder/getall"),
//     );
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonResponse = json.decode(response.body);
//       final List<dynamic> results = jsonResponse['result'];
//       final List<WorkOrderModel> workOrders =
//           results.map((json) => WorkOrderModel.fromJson(json)).toList();
//       return workOrders;
//     } else {
//       throw ServerException();
//     }
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:oriens_eam/core/utils/constants.dart';
// import 'package:oriens_eam/features/2_workorder/data/models/workorder.dart';
// import 'package:retrofit/retrofit.dart';
//
// part 'workorder_api_service.g.dart';
//
// @RestApi(baseUrl: eamAPIBaseURL)
// abstract class WorkOrderApiService {
//   factory WorkOrderApiService(Dio dio) = _WorkOrderApiService;
//
//   @GET('/workorder/getall')
//   Future<HttpResponse<List<WorkOrderModel>>> getWorkOrders();
// }

// List<WorkOrderModel> value = _result.data!["result"]
//     .map<WorkOrderModel>((dynamic i) => WorkOrderModel.fromJson(i as Map<String, dynamic>))
//     .toList();

import 'package:dio/dio.dart';

import '../../../../../core/utils/dio_client.dart';
import '../../../../../core/utils/enum/network_enums.dart';

class WorkOrderApiService {
  final DioManager dioManager;

  WorkOrderApiService({required this.dioManager});

  Future<dynamic> getWorkOrders() async {
    Response response = await dioManager.dio.get(NetworkEnums.workOrder.path);
    return response;
  }
}

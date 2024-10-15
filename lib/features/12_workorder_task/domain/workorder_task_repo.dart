import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/features/12_workorder_task/domain/workorder_task_api.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/dio_client.dart';
import '../data/workorder_task.dart';

class WorkOrderTaskRepo {
  static Future<DataState<List<WorkOrderTask>>> getWorkOrderTasksList(String workOrderId) async {
    try {
      final response = await WorkOrderTaskApiService(dioManager: DioManager.instance)
          .getWorkOrderTask(workOrderId);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<WorkOrderTask> serviceRequests =
            result.map((json) => WorkOrderTask.fromJson(json)).toList();
        return DataSuccess(serviceRequests);
      } else {
        return DataFailed(
          DioException(
              error: response.response.statusMessage,
              response: response.response,
              type: DioExceptionType.badResponse,
              requestOptions: response.response.requestOptions),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}

// class WorkOrderTaskRepo {
//   static Future<List<WorkOrderTask>> getWorkOrderTaskList(String workOrderId) async {
//     final String url = "$eamAPIBaseURL/workordertask/getall/$workOrderId";
//
//     List<dynamic> response = await WorkOrderTaskApi.getResults(url);
//
//     final List<WorkOrderTask> serviceRequests =
//         response.map((json) => WorkOrderTask.fromJson(json)).toList();
//
//     return serviceRequests;
//   }
// }

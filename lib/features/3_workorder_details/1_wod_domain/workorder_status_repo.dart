import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/features/3_workorder_details/1_wod_domain/workorder_status_api.dart';
import 'package:oriens_eam/features/3_workorder_details/2_wod_data/workorder_status.dart';

import '../../../core/resources/data_state.dart';

class WorkOrderStatusRepo {
  final WorkOrderStatusApiService workOrderStatusApiService;

  WorkOrderStatusRepo({required this.workOrderStatusApiService});

  Future<DataState<List<WorkOrderStatus>>> getWorkorderStatusList() async {
    try {
      final response = await workOrderStatusApiService.getWorkOrderStatus();
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonResponse = response.data;
        final List<WorkOrderStatus> workOrderStatus =
            jsonResponse.map((json) => WorkOrderStatus.fromJson(json)).toList();
        return DataSuccess(workOrderStatus);
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

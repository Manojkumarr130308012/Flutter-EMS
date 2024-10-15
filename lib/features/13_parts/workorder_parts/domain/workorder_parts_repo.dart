import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/features/13_parts/workorder_parts/data/models/workorder_parts_model.dart';
import 'package:oriens_eam/features/13_parts/workorder_parts/domain/workorder_parts_api.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/dio_client.dart';

class WorkorderPartsRepo {
  static Future<DataState<List<WorkorderParts>>> getWorkorderParts(String workorderId) async {
    print("getWorkOrderPartsRepo Called");
    try {
      final response = await WorkorderPartsApiService(dioManager: DioManager.instance)
          .getWorkorderParts(workorderId);

      print(response.statusCode);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        print(response.data);
        final List<dynamic> result = jsonResponse["result"];
        final List<WorkorderParts> workorderParts =
            result.map((json) => WorkorderParts.fromJson(json)).toList();
        print("WorkOrderPartsRepo: $workorderParts");
        return DataSuccess(workorderParts);
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

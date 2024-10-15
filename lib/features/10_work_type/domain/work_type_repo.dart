import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';
import 'package:oriens_eam/features/10_work_type/domain/work_type_api.dart';

import '../../../core/resources/data_state.dart';
import '../data/workType.dart';

class WorkTypeRepo {
  // static Future<List<WorkType>> getWorkTypeList() async {
  //   List<dynamic> response = await WorkTypeApi(dioManager: DioManager.instance).getResults();
  //   final List<WorkType> workType = response.map((json) => WorkType.fromJson(json)).toList();
  //   return workType;
  // }
  static Future<DataState<List<WorkType>>> getWorkTypeList() async {
    try {
      final response = await WorkTypeApi(dioManager: DioManager.instance).getResults();
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonResponse = response.data;
        final List<WorkType> workType = jsonResponse.map((e) => WorkType.fromJson(e)).toList();
        return DataSuccess(workType);
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

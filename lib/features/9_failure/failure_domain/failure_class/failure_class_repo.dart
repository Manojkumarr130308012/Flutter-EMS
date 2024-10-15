import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/features/9_failure/failure_domain/failure_class/failure_class_api.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/utils/dio_client.dart';
import '../../failure_data/model/failure_class.dart';

class FailureClassRepo {
  static Future<DataState<List<FailureClass>>> getFailureClass() async {
    try {
      final response =
          await FailureClassApiService(dioManager: DioManager.instance).getFailureClass();
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<FailureClass> failureClass =
            result.map((e) => FailureClass.fromJson(e)).toList();
        return DataSuccess(failureClass);
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

    //
    // List<dynamic> response =
    //     await FailureClassApiService.;
    // final List<FailureClass> locations =
    //     response.map((json) => FailureClass.fromJson(json)).toList();
    // return locations;
  }
}

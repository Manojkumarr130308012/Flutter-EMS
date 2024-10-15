import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/core/resources/data_state.dart';
import 'package:oriens_eam/features/11_problem/data/data_sources/remote/problem_api.dart';

import '../../model/problem.dart';

class ProblemRepo {
  static Future<DataState<List<Problem>>> getProblemList(String failureClassId) async {
    try {
      final response = await ProblemApiService.getProblem(failureClassId);
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<Problem> serviceRequests = result.map((json) => Problem.fromJson(json)).toList();
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

    // List<dynamic> response = await ProblemApiService.getProblem(failureClassId);
    //
    // final List<Problem> problem = response.map((json) => Problem.fromJson(json)).toList();
    //
    // return problem;
  }
}

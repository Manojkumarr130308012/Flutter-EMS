import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/core/utils/dio_client.dart';

import '../../../core/resources/data_state.dart';
import '../data/model/location.dart';
import 'location_api.dart';

class LocationRepo {
  static Future<DataState<List<Location>>> getLocations() async {
    try {
      final response = await LocationApiService(dioManager: DioManager.instance).getLocation();
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<Location> location = result.map((json) => Location.fromJson(json)).toList();
        return DataSuccess(location);
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

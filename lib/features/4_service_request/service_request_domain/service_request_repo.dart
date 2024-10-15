import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/features/4_service_request/service_request_domain/service_request_api.dart';

import '../../../core/resources/data_state.dart';
import '../service_request_data/service_request.dart';

class ServiceRequestRepo {
  final ServiceRequestApiService serviceRequestApiService;

  ServiceRequestRepo({required this.serviceRequestApiService});

  Future<DataState<List<ServiceRequest>>> getServiceRequestList() async {
    try {
      final response = await serviceRequestApiService.getResults();
      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<ServiceRequest> serviceRequests =
            result.map((json) => ServiceRequest.fromJson(json)).toList();
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

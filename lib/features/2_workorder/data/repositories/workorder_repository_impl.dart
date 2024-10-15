import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oriens_eam/core/resources/data_state.dart';
import 'package:oriens_eam/features/2_workorder/data/data_sources/remote/workorder_api_service.dart';
import 'package:oriens_eam/features/2_workorder/data/models/workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/repositories/workorder_repository.dart';

import '../data_sources/local/database_helper.dart';

class WorkOrderRepositoryImpl implements WorkOrderRepository {
  final WorkOrderApiService _workOrderApiService;

  final AppDatabase _appDatabase;

  WorkOrderRepositoryImpl(this._workOrderApiService, this._appDatabase);

  @override
  Future<DataState<List<WorkorderEntity>>> getWorkOrders() async {
    try {
      final httpResponse = await _workOrderApiService.getWorkOrders();
      if (httpResponse.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> jsonResponse = httpResponse.data;
        final List<dynamic> result = jsonResponse["result"];
        final List<WorkorderEntity> workOrders =
            result.map((json) => WorkOrderModel.fromJson(json)).toList();
        return DataSuccess(workOrders);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<WorkorderEntity>> getSavedWorkOrders() async {
    return _appDatabase.getSavedWorkOrders();
  }

  @override
  Future<void> removeWorkOrder(WorkorderEntity workorder) {
    return _appDatabase.removeSavedWorkOrder(WorkOrderModel.fromEntity(workorder));
  }

  @override
  Future<void> saveWorkOrder(WorkorderEntity workorder) {
    return _appDatabase.insertOneWorkOrder(WorkOrderModel.fromEntity(workorder));
  }
}

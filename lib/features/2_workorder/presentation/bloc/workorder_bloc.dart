import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';

import '../../../../core/resources/data_state.dart';
import '../../../3_workorder_details/1_wod_domain/workorder_update_api.dart';
import '../../domain/usecases/get_workorder.dart';

part 'workorder_event.dart';
part 'workorder_state.dart';

class WorkorderBloc extends Bloc<WorkorderEvent, WorkorderState> {
  final GetWorkOrderUsecase _getWorkOrderUsecase;

  WorkorderBloc(this._getWorkOrderUsecase) : super(const WorkorderLoading()) {
    on<GetWorkOrderEvent>(onGetWorkOrders);
    on<WorkOrderStatusUpDateEvent>(upDateWorkOrderStatus);
  }
/////////////////////////// GET WORK ORDER EVENT HANDLER \\\\\\\\\\\\\\\\\\\\\\\\\\
  void onGetWorkOrders(
      GetWorkOrderEvent event, Emitter<WorkorderState> emit) async {
    final dataState = await _getWorkOrderUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(WorkorderLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(WorkorderError(dataState.error!));
    }
  }

/////////////////////////// UPDATE WORK ORDER STATUS EVENT HANDLER \\\\\\\\\\\\\\\\\\\\\\\\\\
  void upDateWorkOrderStatus(
      WorkorderEvent event, Emitter<WorkorderState> emit) async {
    if (event is WorkOrderStatusUpDateEvent) {
      try {
        await WorkOrderStatusUpdateApi.updateWorkOrderStatus(
            event.workOrderId, event.status);
        emit(WorkOrderStatusUpdateSuccess());

        final dataState = await _getWorkOrderUsecase();

        if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
          emit(WorkorderLoaded(dataState.data!));
        }

        if (dataState is DataFailed) {
          emit(WorkorderError(dataState.error!));
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}

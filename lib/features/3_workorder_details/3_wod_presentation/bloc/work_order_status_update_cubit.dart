import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/3_workorder_details/1_wod_domain/workorder_update_api.dart';

part 'work_order_status_update_event.dart';
part 'work_order_status_update_state.dart';

class WorkOrderStatusUpdateCubit extends Cubit<WorkOrderStatusUpdateState> {
  WorkOrderStatusUpdateCubit() : super(WorkOrderStatusUpdateInitial());

  Future<void> updateWorkOrderStatus(
      String worOrderId, String newStatus) async {
    try {
      await WorkOrderStatusUpdateApi.updateWorkOrderStatus(
          worOrderId, newStatus);
      emit(WorkOrderStatusUpdateSuccess());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

/////////////////////////// BLOC \\\\\\\\\\\\\\\\\\\\\\\\\\
class WorkOrderStatusUpdateBloc
    extends Bloc<WorkOrderStatusUpdateEvent, WorkOrderStatusUpdateState> {
  WorkOrderStatusUpdateBloc() : super(WorkOrderStatusUpdateInitial()) {
    on<WorkOrderStatusUpdateSuccessEvent>(upDateWorkOrderStatus);
  }

  FutureOr<void> upDateWorkOrderStatus(WorkOrderStatusUpdateEvent event,
      Emitter<WorkOrderStatusUpdateState> emit) async {
    if (event is WorkOrderStatusUpdateSuccessEvent) {
      try {
        await WorkOrderStatusUpdateApi.updateWorkOrderStatus(
            event.workOrderId, event.status);
        emit(WorkOrderStatusUpdateSuccess());
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }

  // Future<void> updateWorkOrderStatus(String worOrderId, String newStatus) async {
  //   try {
  //     await WorkOrderStatusUpdateApi.updateWorkOrderStatus(worOrderId, newStatus);
  //     emit(WorkOrderStatusUpdateSuccess());
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}

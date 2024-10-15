import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/3_workorder_details/3_wod_presentation/bloc/work_order_status_state.dart';

import '../../../../core/resources/data_state.dart';
import '../../1_wod_domain/workorder_status_repo.dart';

class WorkOrderStatusCubit extends Cubit<WorkOrderStatusState> {
  final WorkOrderStatusRepo workOrderStatusRepo;
  WorkOrderStatusCubit(this.workOrderStatusRepo) : super(WorkOrderStatusInitialState());

  Future<void> fetchWorkOrderStatus() async {
    final dataState = await workOrderStatusRepo.getWorkorderStatusList();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(WorkOrderStatusLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(WorkOrderStatusErrorState("Error Fetching Data"));
    }
  }
}

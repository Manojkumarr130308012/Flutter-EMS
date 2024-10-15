import '../../2_wod_data/workorder_status.dart';

abstract class WorkOrderStatusState {}

class WorkOrderStatusInitialState extends WorkOrderStatusState {}

class WorkOrderStatusLoadingState extends WorkOrderStatusState {}

class WorkOrderStatusLoadedState extends WorkOrderStatusState {
  List<WorkOrderStatus> workOrderStatues;
  WorkOrderStatusLoadedState(this.workOrderStatues);
}

class WorkOrderStatusErrorState extends WorkOrderStatusState {
  final String error;
  WorkOrderStatusErrorState(this.error);
}

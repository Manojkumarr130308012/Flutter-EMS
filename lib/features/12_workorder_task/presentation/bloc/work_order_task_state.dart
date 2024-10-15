part of 'work_order_task_cubit.dart';

@immutable
abstract class WorkOrderTaskState {}

class WorkOrderTaskLoadingState extends WorkOrderTaskState {}

class WorkOrderTaskLoadedState extends WorkOrderTaskState {
  final List<WorkOrderTask> workOrderTasks;
  WorkOrderTaskLoadedState(this.workOrderTasks);
}

class WorkOrderTaskErrorState extends WorkOrderTaskState {
  final String error;
  WorkOrderTaskErrorState(this.error);
}

part of 'work_order_status_update_cubit.dart';

abstract class WorkOrderStatusUpdateEvent {}

class WorkOrderStatusUpdateSuccessEvent extends WorkOrderStatusUpdateEvent {
  final String workOrderId;
  final String status;

  WorkOrderStatusUpdateSuccessEvent({required this.workOrderId, required this.status});
}

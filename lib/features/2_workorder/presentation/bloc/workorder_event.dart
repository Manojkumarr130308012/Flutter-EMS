part of 'workorder_bloc.dart';

@immutable
abstract class WorkorderEvent {
  const WorkorderEvent();
}

class GetWorkOrderEvent extends WorkorderEvent {
  const GetWorkOrderEvent();
}

class WorkOrderStatusUpDateEvent extends WorkorderEvent {
  final String workOrderId;
  final String status;

  const WorkOrderStatusUpDateEvent({required this.workOrderId, required this.status});
}

class WorkOrderFilteredEvent extends WorkorderEvent {}

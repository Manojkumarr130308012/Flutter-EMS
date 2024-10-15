part of 'local_workorder_bloc.dart';

@immutable
// abstract class LocalWorkorderEvent {}

abstract class LocalWorkorderEvent extends Equatable {
  final WorkorderEntity? workorder;

  const LocalWorkorderEvent({this.workorder});

  @override
  List<Object> get props => [workorder!];
}

class GetSavedWorkOrders extends LocalWorkorderEvent {
  const GetSavedWorkOrders();
}

class RemoveWorkOrder extends LocalWorkorderEvent {
  const RemoveWorkOrder(WorkorderEntity workorder) : super(workorder: workorder);
}

class SaveWorkOrder extends LocalWorkorderEvent {
  const SaveWorkOrder(WorkorderEntity workorder) : super(workorder: workorder);
}

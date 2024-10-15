part of 'local_workorder_bloc.dart';

@immutable
abstract class LocalWorkorderState extends Equatable {
  final List<WorkorderEntity>? workOrders;

  const LocalWorkorderState({this.workOrders});

  @override
  List<Object> get props => [workOrders!];
}

/////////////////////////// States \\\\\\\\\\\\\\\\\\\\\\\\\\

class LocalWorkOrderLoading extends LocalWorkorderState {
  const LocalWorkOrderLoading();
}

class LocalWorkorderDone extends LocalWorkorderState {
  const LocalWorkorderDone(List<WorkorderEntity> workOrders) : super(workOrders: workOrders);
}

class LocalWorkorderRemoved extends LocalWorkorderState {
  const LocalWorkorderRemoved();
}

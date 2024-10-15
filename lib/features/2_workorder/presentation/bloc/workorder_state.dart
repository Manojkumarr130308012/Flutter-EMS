part of 'workorder_bloc.dart';

@immutable
abstract class WorkorderState extends Equatable {
  final List<WorkorderEntity>? workOrders;
  final DioException? error;

  const WorkorderState({
    this.workOrders,
    this.error,
  });

  @override
  List<Object?> get props => [workOrders, error];
}

class WorkorderInitial extends WorkorderState {}

class WorkorderLoading extends WorkorderState {
  const WorkorderLoading();
}

class WorkorderLoaded extends WorkorderState {
  const WorkorderLoaded(List<WorkorderEntity> workOrders) : super(workOrders: workOrders);
}

class WorkorderError extends WorkorderState {
  const WorkorderError(DioException error) : super(error: error);
}

class WorkOrderStatusUpdateSuccess extends WorkorderState {}

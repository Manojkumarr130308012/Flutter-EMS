part of 'work_type_cubit.dart';

@immutable
abstract class WorkTypeState {}

class WorkTypeLoadingState extends WorkTypeState {}

class WorkTypeLoadedState extends WorkTypeState {
  final List<WorkType> workType;
  WorkTypeLoadedState(this.workType);
}

class WorkTypeErrorState extends WorkTypeState {
  final String error;
  WorkTypeErrorState(this.error);
}

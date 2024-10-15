part of 'failure_class_bloc.dart';

@immutable
abstract class FailureClassState {}

class FailureClassLoadingState extends FailureClassState {}

class FailureClassLoadedState extends FailureClassState {
  final List<FailureClass> failureClass;

  FailureClassLoadedState(this.failureClass);
}

class FailureClassErrorState extends FailureClassState {
  final String error;

  FailureClassErrorState(this.error);
}

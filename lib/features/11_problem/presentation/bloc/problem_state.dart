part of 'problem_bloc.dart';

@immutable
abstract class ProblemState extends Equatable {
  final List<ProblemEntity>? problems;
  final DioException? error;

  const ProblemState({this.problems, this.error});

  @override
  List<Object?> get props => [problems, error];
}

class ProblemLoading extends ProblemState {
  const ProblemLoading();
}

class ProblemLoaded extends ProblemState {
  const ProblemLoaded(List<ProblemEntity> problem) : super(problems: problem);
}

class ProblemError extends ProblemState {
  const ProblemError(DioException error) : super(error: error);
}
///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\

@immutable
abstract class OldWayProblemState extends Equatable {}

class OldWayProblemLoadingState extends OldWayProblemState {
  @override
  List<Object?> get props => [];
}

class OldWayProblemLoadedState extends OldWayProblemState {
  final List<Problem> problem;

  OldWayProblemLoadedState({required this.problem});

  @override
  List<Object> get props => [problem];

  OldWayProblemLoadedState copyWith({
    List<Problem>? problem,
  }) {
    return OldWayProblemLoadedState(
      problem: problem ?? this.problem,
    );
  }
}

class OldWayProblemErrorState extends OldWayProblemState {
  final String error;

  @override
  List<Object> get props => [error];

  OldWayProblemErrorState(this.error);
}

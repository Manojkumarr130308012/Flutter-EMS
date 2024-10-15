part of 'problem_bloc.dart';

@immutable
abstract class ProblemEvent {
  final String fci;

  const ProblemEvent({required this.fci});
}

class GetProblemEvent extends ProblemEvent {
  const GetProblemEvent(String fci) : super(fci: fci);
}

import 'package:bloc/bloc.dart';
import 'package:oriens_eam/features/11_problem/data/data_sources/remote/problem_repo.dart';
import 'package:oriens_eam/features/11_problem/presentation/bloc/problem_bloc.dart';

import '../../../../core/resources/data_state.dart';

class ProblemCubit extends Cubit<OldWayProblemState> {
  ProblemCubit() : super(OldWayProblemLoadingState());

  Future<void> fetchProblems(String failureClassId) async {
    final dataState = await ProblemRepo.getProblemList(failureClassId);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(OldWayProblemLoadedState(problem: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(OldWayProblemErrorState("Error Fetching Data"));
    }

    // try {
    //   final problems = await ProblemRepo.getProblemList(failureClassId);
    //
    //   emit(OldWayProblemLoadedState(problem: problems));
    //
    // } catch (e) {
    //   emit(OldWayProblemErrorState("Error Fetching Data"));
    //
    //   throw Exception(e.toString());
    // }
  }
}

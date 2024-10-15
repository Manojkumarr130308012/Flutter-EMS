import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:oriens_eam/features/11_problem/domain/entities/problem.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/problem.dart';
import '../../domain/usecase/get_problem.dart';

part 'problem_event.dart';
part 'problem_state.dart';

class ProblemBloc extends Bloc<ProblemEvent, ProblemState> {
  final GetProblemUseCase _getProblemUsecase;
  final String failureClassId;

  ProblemBloc(this._getProblemUsecase, this.failureClassId) : super(const ProblemLoading()) {
    on<ProblemEvent>(onGetProblems);
  }

  Future<FutureOr<void>> onGetProblems(ProblemEvent event, Emitter<ProblemState> emit) async {
    print("OnGetProblems bloc called");
    final dataState = await _getProblemUsecase(params: failureClassId);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProblemLoaded(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ProblemError(dataState.error!));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/9_failure/failure_domain/failure_class/failure_class_repo.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../failure_data/model/failure_class.dart';

part 'failure_class_state.dart';

class FailureClassBloc extends Cubit<FailureClassState> {
  FailureClassBloc() : super(FailureClassLoadingState());

  Future<void> fetchFailureClass() async {
    final dataState = await FailureClassRepo.getFailureClass();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(FailureClassLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(FailureClassErrorState("Error Fetching Data"));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oriens_eam/features/10_work_type/data/workType.dart';
import 'package:oriens_eam/features/10_work_type/domain/work_type_repo.dart';

import '../../../../core/resources/data_state.dart';

part 'work_type_state.dart';

class WorkTypeBloc extends Cubit<WorkTypeState> {
  WorkTypeBloc() : super(WorkTypeLoadingState());

  Future<void> fetchWorkType() async {
    final dataState = await WorkTypeRepo.getWorkTypeList();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(WorkTypeLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(WorkTypeErrorState("Error Fetching Data"));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/get_saved_workordrs.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/remove_workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/usecases/save_workorder.dart';

part 'local_workorder_event.dart';
part 'local_workorder_state.dart';

class LocalWorkorderBloc extends Bloc<LocalWorkorderEvent, LocalWorkorderState> {
  final GetSavedWorkOrderUseCase _getSavedWorkorderUseCase;
  final SaveWorkOrderUseCase _saveWorkorderUseCase;
  final RemoveWorkOrderUseCase _removeWorkorderUseCase;

  LocalWorkorderBloc(
      this._getSavedWorkorderUseCase, this._saveWorkorderUseCase, this._removeWorkorderUseCase)
      : super(const LocalWorkOrderLoading()) {
    on<GetSavedWorkOrders>(onGetSavedWorkOrders);
    on<RemoveWorkOrder>(onRemoveWorkOrder);
    on<SaveWorkOrder>(onSaveWorkorder);
  }

  void onGetSavedWorkOrders(GetSavedWorkOrders event, Emitter<LocalWorkorderState> emit) async {
    final workorders = await _getSavedWorkorderUseCase();
    emit(LocalWorkorderDone(workorders));
  }

  void onRemoveWorkOrder(RemoveWorkOrder removeWorkOrder, Emitter<LocalWorkorderState> emit) async {
    await _removeWorkorderUseCase(params: removeWorkOrder.workorder);
    // await _removeWorkorderUseCase();
    emit(const LocalWorkorderRemoved());
  }

  void onSaveWorkorder(SaveWorkOrder saveWorkOrder, Emitter<LocalWorkorderState> emit) async {
    await _saveWorkorderUseCase(params: saveWorkOrder.workorder);
    final workorders = await _getSavedWorkorderUseCase();
    emit(LocalWorkorderDone(workorders));
  }
}

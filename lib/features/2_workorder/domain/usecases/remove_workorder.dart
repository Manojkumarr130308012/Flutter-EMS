import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/repositories/workorder_repository.dart';

import '../../../../core/usecase/usecase.dart';

class RemoveWorkOrderUseCase implements UseCase<void, WorkorderEntity> {
  final WorkOrderRepository _workOrderRepository;

  RemoveWorkOrderUseCase(this._workOrderRepository);

  @override
  Future<void> call({WorkorderEntity? params}) {
    return _workOrderRepository.removeWorkOrder(params!);
  }
}
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';
import 'package:oriens_eam/features/2_workorder/domain/repositories/workorder_repository.dart';

import '../../../../core/usecase/usecase.dart';

class SaveWorkOrderUseCase implements UseCase<void, WorkorderEntity> {
  final WorkOrderRepository _workorderRepository;

  SaveWorkOrderUseCase(this._workorderRepository);

  @override
  Future<void> call({WorkorderEntity? params}) {
    return _workorderRepository.saveWorkOrder(params!);
  }
}

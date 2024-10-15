import 'package:oriens_eam/features/2_workorder/domain/repositories/workorder_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/workorder.dart';

class GetSavedWorkOrderUseCase implements UseCase<List<WorkorderEntity>, void> {
  final WorkOrderRepository _workOrderRepository;

  GetSavedWorkOrderUseCase(this._workOrderRepository);

  @override
  Future<List<WorkorderEntity>> call({void params}) {
    return _workOrderRepository.getSavedWorkOrders();
  }
}

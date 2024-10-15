import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';

import '../../../../core/resources/data_state.dart';

abstract class WorkOrderRepository {
  // API Call
  Future<DataState<List<WorkorderEntity>>> getWorkOrders();

  // Database methods
  Future<List<WorkorderEntity>> getSavedWorkOrders();

  Future<void> saveWorkOrder(WorkorderEntity workorder);

  Future<void> removeWorkOrder(WorkorderEntity workorder);
}

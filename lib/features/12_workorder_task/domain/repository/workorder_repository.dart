import '../../../../core/resources/data_state.dart';
import '../entities/workorder_task.dart';

abstract class WorkOrderTaskRepository {
  Future<DataState<List<WorkOrderTaskEntity>>> getWorkOrderTask();
}

import 'package:oriens_eam/features/2_workorder/1_wo_domain/workorder_repo.dart';
import 'package:oriens_eam/features/2_workorder/2_wo_data/workorders.dart';
import 'package:rxdart/rxdart.dart';

class WorkOrderBloc {
  WorkOrderBloc() {
    getData();
  }

  final _subject = BehaviorSubject<List<WorkOrder>>();

  Stream<List<WorkOrder>> get stream => _subject.stream;

  Function(List<WorkOrder>) get _update => _subject.sink.add;

  getData() async {
    _update(await WorkOrderRepo.getWorkorderList());
  }

  dispose() {
    _subject.close();
  }
}

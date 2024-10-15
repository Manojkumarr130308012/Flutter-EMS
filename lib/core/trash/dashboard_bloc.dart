// import 'package:oriens_eam/features/1_dashboard/1_dashboard_domain/dashboard_repo.dart';
// import 'package:rxdart/rxdart.dart';
//
// class DashBoardBloc {
//   DashBoardBloc() {
//     getData();
//   }
//
//   final _subject = BehaviorSubject<int>();
//
//   Stream<int> get stream => _subject.stream;
//
//   Function(int) get _update => _subject.sink.add;
//
//   getData() async {
//     _update(await DaskBoardWorkOrderRepo.getDashBoardWorkorderList("Created"));
//   }
//
//   dispose() {
//     _subject.close();
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/13_parts/workorder_parts/presentation/bloc/workorder_parts_event.dart';
import 'package:oriens_eam/features/13_parts/workorder_parts/presentation/bloc/workorder_parts_state.dart';

import '../../../../../core/resources/data_state.dart';
import '../../domain/workorder_parts_repo.dart';

class WorkOrderPartsBloc extends Bloc<WorkorderPartsEvent, WorkOrderPartsState> {
  WorkOrderPartsBloc() : super(WorkOrderPartsInitial()) {
    on<WorkorderPartFetchEvent>(onGetWorkorderParts);
  }

  /////////////////////////// GET WORK ORDER PARTS EVENT HANDLER \\\\\\\\\\\\\\\\\\\\\\\\\\
  void onGetWorkorderParts(WorkorderPartFetchEvent event, Emitter<WorkOrderPartsState> emit) async {
    print("Bloc Called");
    final dataState = await WorkorderPartsRepo.getWorkorderParts(
      event.workorderId,
    );

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(WorkOrderPartsLoadedState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(WorkorderPartsErrorState("Error Fetching Data"));
    }
  }

  // FutureOr<void> onGetWorkorderParts(
  //     WorkorderPartsEvent event, Emitter<WorkOrderPartsState> emit) async {
  //   if (event is WorkorderPartFetchEvent) {
  //     emit(WorkOrderPartsLoadingState());
  //
  //     try {
  //       final response =
  //           await http.get(Uri.parse("$eamAPIBaseURL/assetparts/partsbyassetid/${event.assetId}"));
  //
  //       print(Uri.parse("$eamAPIBaseURL/assetparts/partsbyassetid/${event.assetId}"));
  //
  //       print("AssetID is ${jsonEncode(event.assetId)}, status Code : ${response.statusCode}");
  //
  //       if (response.statusCode == 200) {
  //         final Map<String, dynamic> body = jsonDecode(response.body);
  //
  //         List<dynamic> results = body["result"];
  //
  //         final List<WorkorderParts> workorderParts =
  //             results.map((json) => WorkorderParts.fromJson(json)).toList();
  //         print(workorderParts.length);
  //
  //         emit(WorkorderPartsLoadedState(workorderParts));
  //       } else {
  //         emit(WorkorderPartsErrorState(
  //             "Failed to Fetch Asset Parts Data. Status code: ${response.statusCode}"));
  //       }
  //     } catch (e) {
  //       emit(WorkorderPartsErrorState(e.toString()));
  //       throw Exception(e);
  //     }
  //   }
  // }
}

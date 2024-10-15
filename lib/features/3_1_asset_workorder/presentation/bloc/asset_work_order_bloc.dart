import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../2_workorder/2_wo_data/workorders.dart';

part 'asset_work_order_event.dart';
part 'asset_work_order_state.dart';

/////////////////////////////////////////////////////////////
/// ASSET WORK ORDER BLOC
/////////////////////////////////////////////////////////////

/// This Bloc Used in Work order details page (Asset Work order Tab).
class AssetWorkOrderBloc
    extends Bloc<AssetWorkOrderEvent, AssetWorkOrderState> {
  AssetWorkOrderBloc() : super(AssetWorkOrderInitial()) {
    on<AssetWorkorderFetchEvent>(onGetAssetWorkOrders);
  }

  void onGetAssetWorkOrders(
      AssetWorkOrderEvent event, Emitter<AssetWorkOrderState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? baseURL = prefs.getString('eamAPIBaseURL');

    if (event is AssetWorkorderFetchEvent) {
      emit(AssetWorkOrderLoadingState());

      try {
        final response = await http.post(
          Uri.parse("$baseURL/workorder/search"),
          body: jsonEncode({"assetId": event.assetId}),
          headers: {"Content-Type": "application/json"},
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> body = jsonDecode(response.body);

          List<dynamic> results = body["result"];

          final List<WorkOrder> workOrders =
              results.map((json) => WorkOrder.fromJson(json)).toList();

          emit(AssetWorkOrderLoadedState(workOrders));
        } else {
          emit(AssetWorkOrderErrorState(
              "Failed to Fetch Asset WorkOrder Data. Status code: ${response.statusCode}"));
        }
      } catch (error) {
        emit(AssetWorkOrderErrorState(error.toString()));
        throw Exception(error);
      }
    }
  }
}

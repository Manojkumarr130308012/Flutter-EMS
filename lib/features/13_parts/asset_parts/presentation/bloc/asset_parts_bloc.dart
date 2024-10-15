import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/asset_parts_model.dart';

part 'asset_parts_event.dart';
part 'asset_parts_state.dart';

class AssetPartsBloc extends Bloc<AssetPartsEvent, AssetFileState> {
  AssetPartsBloc() : super(AssetPartsInitial()) {
    on<AssetPartFetchEvent>(onGetAssetParts);
  }

  FutureOr<void> onGetAssetParts(
      AssetPartsEvent event, Emitter<AssetFileState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? baseURL = prefs.getString('eamAPIBaseURL');
    if (event is AssetPartFetchEvent) {
      emit(AssetPartsLoadingState());

      try {
        final response = await http.get(
            Uri.parse("$baseURL/assetparts/partsbyassetid/${event.assetId}"));

        print(Uri.parse("$baseURL/assetparts/partsbyassetid/${event.assetId}"));

        print(
            "AssetID is ${jsonEncode(event.assetId)}, status Code : ${response.statusCode}");

        if (response.statusCode == 200) {
          final Map<String, dynamic> body = jsonDecode(response.body);

          List<dynamic> results = body["result"];

          final List<AssetPartsModel> assetParts =
              results.map((json) => AssetPartsModel.fromJson(json)).toList();
          print(assetParts.length);

          emit(AssetPartsLoadedState(assetParts));
        } else {
          emit(AssetPartsErrorState(
              "Failed to Fetch Asset Parts Data. Status code: ${response.statusCode}"));
        }
      } catch (e) {
        emit(AssetPartsErrorState(e.toString()));
        throw Exception(e);
      }
    }
  }
}

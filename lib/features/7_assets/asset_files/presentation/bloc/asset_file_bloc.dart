import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/asset_file.dart';

part 'asset_file_event.dart';
part 'asset_file_state.dart';

class AssetFileBloc extends Bloc<AssetFileEvent, AssetFileState> {
  AssetFileBloc() : super(AssetFileInitial()) {
    on<AssetFileFetchEvent>(onGetAssetFiles);
  }

  FutureOr<void> onGetAssetFiles(
      AssetFileEvent event, Emitter<AssetFileState> emit) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? baseURL = prefs.getString('eamAPIBaseURL');
    if (event is AssetFileFetchEvent) {
      try {
        final response = await http.get(
            Uri.parse("$baseURL/assetdocument/getbyassetid/${event.assetId}"));

        print(
            Uri.parse("$baseURL/assetdocument/getbyassetid/${event.assetId}"));

        print(
            "AssetID is ${jsonEncode(event.assetId)}, status Code : ${response.statusCode}");

        if (response.statusCode == 200) {
          final Map<String, dynamic> body = jsonDecode(response.body);

          List<dynamic> results = body["result"];

          final List<AssetFile> assetFiles =
              results.map((json) => AssetFile.fromJson(json)).toList();
          print(assetFiles.length);

          emit(AssetFileLoadedState(assetFiles));
        } else {
          emit(AssetFileErrorState(
              "Failed to Fetch Asset Files Data. Status code: ${response.statusCode}"));
        }
      } catch (e) {
        emit(AssetFileErrorState(e.toString()));
        throw Exception(e);
      }
    }
  }
}

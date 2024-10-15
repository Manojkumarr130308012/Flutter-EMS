import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/7_assets/domain/asset_repo.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/asset.dart';

part 'asset_state.dart';

class AssetBloc extends Cubit<AssetsState> {
  AssetBloc() : super(AssetsLoadingState());

  Future<void> fetchAssets() async {
    final dataState = await AssetRepo.getAssets();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(AssetsLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(AssetsErrorState("Error Fetching Data"));
    }
  }
}

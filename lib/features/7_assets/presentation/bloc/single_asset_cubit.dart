import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oriens_eam/features/7_assets/data/model/asset_details.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/model/asset.dart';
import '../../domain/asset_repo.dart';

part 'single_asset_state.dart';

class SingleAssetCubit extends Cubit<SingleAssetState> {
  SingleAssetCubit() : super(SingleAssetLoading());

  Future<void> fetchAssetsById(String assetId) async {
    final dataState = await AssetRepo.getAssetsById(assetId);
    print("testinggggprocess${dataState.data!}");

    if (dataState is DataSuccess && dataState.data != null) {
      emit(SingleAssetLoadedState(
        asset: dataState.data!.result!,
      ));
    }
    if (dataState is DataFailed) {
      emit(SingleAssetErrorState("Error Fetching Data"));
    }
  }

  // try {
  //   final asset = await AssetRepo.getAssetsById(assetId);
  //   print("======= Fetch Asset by id is Called =====");
  //   emit(SingleAssetLoadedState(
  //     asset: asset,
  //   ));
  // } catch (e) {
  //   emit(SingleAssetErrorState("Error Fetching Single Asset Data"));
  //   throw Exception(e);
  // }
}

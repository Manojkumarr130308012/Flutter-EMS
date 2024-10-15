part of 'single_asset_cubit.dart';

@immutable
abstract class SingleAssetState {}

class SingleAssetLoading extends SingleAssetState {}

class SingleAssetLoadedState extends SingleAssetState {
  final AssetDetail asset;
  SingleAssetLoadedState({required this.asset});
}

class SingleAssetErrorState extends SingleAssetState {
  final String error;
  SingleAssetErrorState(this.error);
}

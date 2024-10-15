part of 'asset_parts_bloc.dart';

@immutable
abstract class AssetFileState {}

class AssetPartsInitial extends AssetFileState {}

class AssetPartsLoadingState extends AssetFileState {}

class AssetPartsLoadedState extends AssetFileState {
  final List<AssetPartsModel> assetParts;

  AssetPartsLoadedState(this.assetParts);
}

class AssetPartsErrorState extends AssetFileState {
  final String errorMessage;

  AssetPartsErrorState(this.errorMessage);
}

part of 'asset_file_bloc.dart';

@immutable
abstract class AssetFileState {}

class AssetFileInitial extends AssetFileState {}

class AssetFileLoadingState extends AssetFileState {}

class AssetFileLoadedState extends AssetFileState {
  final List<AssetFile> assetFiles;

  AssetFileLoadedState(this.assetFiles);
}

class AssetFileErrorState extends AssetFileState {
  final String errorMessage;

  AssetFileErrorState(this.errorMessage);
}

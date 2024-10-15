part of 'asset_file_bloc.dart';

@immutable
abstract class AssetFileEvent {}

class AssetFileFetchEvent extends AssetFileEvent {
  final String assetId;

  AssetFileFetchEvent(this.assetId);
}

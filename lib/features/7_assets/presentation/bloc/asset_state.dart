part of 'asset_cubit.dart';

@immutable
abstract class AssetsState {}

class AssetsLoadingState extends AssetsState {}

class AssetsLoadedState extends AssetsState {
  final List<Asset> assets;
  AssetsLoadedState(this.assets);
}

class AssetsErrorState extends AssetsState {
  final String error;
  AssetsErrorState(this.error);
}

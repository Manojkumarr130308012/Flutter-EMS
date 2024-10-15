part of 'asset_parts_bloc.dart';

@immutable
abstract class AssetPartsEvent {}

class AssetPartFetchEvent extends AssetPartsEvent {
  final String assetId;

  AssetPartFetchEvent(this.assetId);
}

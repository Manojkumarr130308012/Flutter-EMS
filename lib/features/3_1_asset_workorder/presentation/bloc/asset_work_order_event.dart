part of 'asset_work_order_bloc.dart';

@immutable
abstract class AssetWorkOrderEvent {}

class AssetWorkorderFetchEvent extends AssetWorkOrderEvent {
  final String assetId;

  AssetWorkorderFetchEvent({required this.assetId});
}

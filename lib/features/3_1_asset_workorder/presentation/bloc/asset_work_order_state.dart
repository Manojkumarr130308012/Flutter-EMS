part of 'asset_work_order_bloc.dart';

@immutable
abstract class AssetWorkOrderState {}

class AssetWorkOrderInitial extends AssetWorkOrderState {}

class AssetWorkOrderLoadingState extends AssetWorkOrderState {}

class AssetWorkOrderLoadedState extends AssetWorkOrderState {
  final List<WorkOrder> workOrders;

  AssetWorkOrderLoadedState(this.workOrders);
}

class AssetWorkOrderErrorState extends AssetWorkOrderState {
  final String errorMessage;

  AssetWorkOrderErrorState(this.errorMessage);
}

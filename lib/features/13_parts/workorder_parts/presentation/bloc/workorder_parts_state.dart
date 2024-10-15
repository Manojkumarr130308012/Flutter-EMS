import 'package:flutter/foundation.dart';

import '../../data/models/workorder_parts_model.dart';

@immutable
abstract class WorkOrderPartsState {}

class WorkOrderPartsInitial extends WorkOrderPartsState {}

class WorkOrderPartsLoadingState extends WorkOrderPartsState {}

class WorkOrderPartsLoadedState extends WorkOrderPartsState {
  final List<WorkorderParts> workorderParts;

  WorkOrderPartsLoadedState(this.workorderParts);
}

class WorkorderPartsErrorState extends WorkOrderPartsState {
  final String errorMessage;

  WorkorderPartsErrorState(this.errorMessage);
}

import 'package:flutter/foundation.dart';

@immutable
abstract class WorkorderPartsEvent {}

class WorkorderPartFetchEvent extends WorkorderPartsEvent {
  final String workorderId;

  WorkorderPartFetchEvent(this.workorderId);
}

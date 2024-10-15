import 'package:equatable/equatable.dart';

class WorkOrderTaskEntity extends Equatable {
  final String? workOrderName;
  final String? taskTypeName;
  final String? workOrderId;
  final String? taskName;
  final String? taskNo;
  final String? description;
  final String? sequenceNo;
  final double? taskDuration;
  final DateTime? actualStartDate;
  final DateTime? actualEndDate;
  final DateTime? targetStartDate;
  final DateTime? targetEndDate;
  final DateTime? plannedStartDate;
  final DateTime? plannedEndDate;
  final int? currentReading;
  final String? taskStatus;
  final String? dataInputTimeOfCompletion;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  const WorkOrderTaskEntity(
      {this.workOrderName,
      this.taskTypeName,
      this.workOrderId,
      this.taskName,
      this.taskNo,
      this.description,
      this.sequenceNo,
      this.taskDuration,
      this.actualStartDate,
      this.actualEndDate,
      this.targetStartDate,
      this.targetEndDate,
      this.plannedStartDate,
      this.plannedEndDate,
      this.currentReading,
      this.taskStatus,
      this.dataInputTimeOfCompletion,
      this.id,
      this.isActive,
      this.isDeleted,
      this.createdDate});

  @override
  List<Object?> get props => [
        workOrderName,
        taskTypeName,
        workOrderId,
        taskName,
        taskNo,
        description,
        sequenceNo,
        taskDuration,
        actualStartDate,
        actualEndDate,
        targetStartDate,
        targetEndDate,
        plannedStartDate,
        plannedEndDate,
        currentReading,
        taskStatus,
        dataInputTimeOfCompletion,
        id,
        isActive,
        isDeleted,
        createdDate,
      ];
}

import '../../domain/entities/workorder_task.dart';

class WorkOrderTaskModel extends WorkOrderTaskEntity {
  // Used Copy with method to create the below constructor
  const WorkOrderTaskModel({
    String? workOrderName,
    String? taskTypeName,
    String? workOrderId,
    String? taskName,
    String? taskNo,
    String? description,
    String? sequenceNo,
    double? taskDuration,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    DateTime? targetStartDate,
    DateTime? targetEndDate,
    DateTime? plannedStartDate,
    DateTime? plannedEndDate,
    int? currentReading,
    // Changed to Int on 07/12/2023
    // String? taskStatus,
    int? taskStatus,
    String? dataInputTimeOfCompletion,
    String? id,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
  });

  factory WorkOrderTaskModel.fromJson(Map<String, dynamic> json) => WorkOrderTaskModel(
        workOrderName: json["workOrderName"],
        taskTypeName: json["taskTypeName"],
        workOrderId: json["workOrderId"],
        taskName: json["taskName"],
        taskNo: json["taskNo"],
        description: json["description"],
        sequenceNo: json["sequenceNo"],
        taskDuration: json["taskDuration"],
        actualStartDate:
            json["actualStartDate"] == null ? null : DateTime.parse(json["actualStartDate"]),
        actualEndDate: json["actualEndDate"] == null ? null : DateTime.parse(json["actualEndDate"]),
        targetStartDate:
            json["targetStartDate"] == null ? null : DateTime.parse(json["targetStartDate"]),
        targetEndDate: json["targetEndDate"] == null ? null : DateTime.parse(json["targetEndDate"]),
        plannedStartDate:
            json["plannedStartDate"] == null ? null : DateTime.parse(json["plannedStartDate"]),
        plannedEndDate:
            json["plannedEndDate"] == null ? null : DateTime.parse(json["plannedEndDate"]),
        currentReading: json["currentReading"],
        taskStatus: json["taskStatus"],
        dataInputTimeOfCompletion: json["dataInputTimeOfCompletion"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );
}

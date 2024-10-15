import 'dart:convert';

WorkOrderTask workOrderTaskFromJson(String str) => WorkOrderTask.fromJson(json.decode(str));

String workOrderTaskToJson(WorkOrderTask data) => json.encode(data.toJson());

class WorkOrderTask {
  final String? workOrderName;
  final String? taskTypeName;
  final String? taskTypeId;
  final String? workOrderId;
  final String? meterId;
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

  WorkOrderTask({
    this.workOrderName,
    this.taskTypeName,
    this.taskTypeId,
    this.workOrderId,
    this.meterId,
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
    this.createdDate,
  });

  WorkOrderTask copyWith({
    String? workOrderName,
    String? taskTypeName,
    String? taskTypeId,
    String? workOrderId,
    String? meterId,
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
    String? taskStatus,
    String? dataInputTimeOfCompletion,
    String? id,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
  }) =>
      WorkOrderTask(
        workOrderName: workOrderName ?? this.workOrderName,
        taskTypeName: taskTypeName ?? this.taskTypeName,
        taskTypeId: taskTypeId ?? this.taskTypeId,
        workOrderId: workOrderId ?? this.workOrderId,
        meterId: meterId ?? this.meterId,
        taskName: taskName ?? this.taskName,
        taskNo: taskNo ?? this.taskNo,
        description: description ?? this.description,
        sequenceNo: sequenceNo ?? this.sequenceNo,
        taskDuration: taskDuration ?? this.taskDuration,
        actualStartDate: actualStartDate ?? this.actualStartDate,
        actualEndDate: actualEndDate ?? this.actualEndDate,
        targetStartDate: targetStartDate ?? this.targetStartDate,
        targetEndDate: targetEndDate ?? this.targetEndDate,
        plannedStartDate: plannedStartDate ?? this.plannedStartDate,
        plannedEndDate: plannedEndDate ?? this.plannedEndDate,
        currentReading: currentReading ?? this.currentReading,
        taskStatus: taskStatus ?? this.taskStatus,
        dataInputTimeOfCompletion: dataInputTimeOfCompletion ?? this.dataInputTimeOfCompletion,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        createdDate: createdDate ?? this.createdDate,
      );

  factory WorkOrderTask.fromJson(Map<String, dynamic> json) => WorkOrderTask(
        workOrderName: json["workOrderName"],
        taskTypeName: json["taskTypeName"],
    taskTypeId: json["taskTypeId"],
    meterId: json["meterId"],
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

  Map<String, dynamic> toJson() => {
        "workOrderName": workOrderName,
        "taskTypeName": taskTypeName,
    "taskTypeId": taskTypeId,
    "workOrderId": workOrderId,
    "meterId": meterId,
        "taskName": taskName,
        "taskNo": taskNo,
        "description": description,
        "sequenceNo": sequenceNo,
        "taskDuration": taskDuration,
        "actualStartDate": actualStartDate?.toIso8601String(),
        "actualEndDate": actualEndDate?.toIso8601String(),
        "targetStartDate": targetStartDate?.toIso8601String(),
        "targetEndDate": targetEndDate?.toIso8601String(),
        "plannedStartDate": plannedStartDate?.toIso8601String(),
        "plannedEndDate": plannedEndDate?.toIso8601String(),
        "currentReading": currentReading,
        "taskStatus": taskStatus,
        "dataInputTimeOfCompletion": dataInputTimeOfCompletion,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

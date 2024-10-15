import 'package:isar/isar.dart';
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';

part 'workorder.g.dart';

// @Entity(tableName: "workorder", primaryKeys: ["id"])
@Collection()
class WorkOrderModel extends WorkorderEntity {
  WorkOrderModel({
    String? workResponsible,
    String? priorityName,
    double? duration,
    String? assetName,
    String? jobPlanName,
    String? failureClassName,
    String? problemName,
    String? locationName,
    String? serviceRequestName,
    String? serviceRequestCode,
    String? preventiveMaintenanceName,
    String? approvedByName,
    String? rejectedByName,
    String? serviceRequestId,
    String? workOrderName,
    String? code,
    String? description,
    String? assetId,
    String? assetCode,
    String? locationId,
    String? locationCode,
    String? workTypeName,
    String? status,
    DateTime? actualStartDate,
    DateTime? actualEndDate,
    DateTime? targetStartDate,
    DateTime? targetEndDate,
    DateTime? plannedStartDate,
    DateTime? plannedEndDate,
    double? currentReading,
    DateTime? stopBeginDate,
    String? workOrderId,
    bool? isActive,
    bool? isDeleted,
    String? siteId,
    DateTime? createdDate,
  }) : super(
          workResponsible: workResponsible ?? workResponsible,
          priorityName: priorityName ?? priorityName,
          duration: duration ?? duration,
          assetName: assetName ?? assetName,
          jobPlanName: jobPlanName ?? jobPlanName,
          failureClassName: failureClassName ?? failureClassName,
          problemName: problemName ?? problemName,
          locationName: locationName ?? locationName,
          serviceRequestName: serviceRequestName ?? serviceRequestName,
          serviceRequestCode: serviceRequestCode ?? serviceRequestCode,
          preventiveMaintenanceName:
              preventiveMaintenanceName ?? preventiveMaintenanceName,
          approvedByName: approvedByName ?? approvedByName,
          rejectedByName: rejectedByName ?? rejectedByName,
          serviceRequestId: serviceRequestId ?? serviceRequestId,
          workOrderName: workOrderName ?? workOrderName,
          code: code ?? code,
          description: description ?? description,
          assetId: assetId ?? assetId,
          assetCode: assetCode ?? assetCode,
          locationCode: locationCode ?? locationCode,
          locationId: locationId ?? locationId,
          workTypeName: workTypeName ?? workTypeName,
          status: status ?? status,
          actualStartDate: actualStartDate ?? actualStartDate,
          actualEndDate: actualEndDate ?? actualEndDate,
          targetStartDate: targetStartDate ?? targetStartDate,
          targetEndDate: targetEndDate ?? targetEndDate,
          plannedStartDate: plannedStartDate ?? plannedStartDate,
          plannedEndDate: plannedEndDate ?? plannedEndDate,
          currentReading: currentReading ?? currentReading,
          stopBeginDate: stopBeginDate ?? stopBeginDate,
          workOrderId: workOrderId ?? workOrderId,
          isActive: isActive ?? isActive,
          isDeleted: isDeleted ?? isDeleted,
          siteId: siteId ?? siteId,
          createdDate: createdDate ?? createdDate,
        );

  factory WorkOrderModel.fromJson(Map<String, dynamic> json) => WorkOrderModel(
        workResponsible: json["workResponsible"],
        priorityName: json["priorityName"],
        duration: json["duration"],
        assetName: json["assetName"],
        assetCode: json["assetCode"],
        jobPlanName: json["jobPlanName"],
        failureClassName: json["failureClassName"],
        problemName: json["problemName"],
        locationName: json["locationName"],
        locationCode: json["locationCode"],
        serviceRequestName: json["serviceRequestName"],
        serviceRequestCode: json["serviceRequestCode"],
        preventiveMaintenanceName: json["preventiveMaintenanceName"],
        approvedByName: json["approvedByName"],
        rejectedByName: json["rejectedByName"],
        serviceRequestId: json["serviceRequestId"],
        workOrderName: json["workOrderName"],
        code: json["code"],
        description: json["description"],
        assetId: json["assetId"],
        locationId: json["locationId"],
        workTypeName: json["workTypeName"],
        status: json["status"],
        actualStartDate: json["actualStartDate"] == null
            ? null
            : DateTime.parse(json["actualStartDate"]),
        actualEndDate: json["actualEndDate"] == null
            ? null
            : DateTime.parse(json["actualEndDate"]),
        targetStartDate: json["targetStartDate"] == null
            ? null
            : DateTime.parse(json["targetStartDate"]),
        targetEndDate: json["targetEndDate"] == null
            ? null
            : DateTime.parse(json["targetEndDate"]),
        plannedStartDate: json["plannedStartDate"] == null
            ? null
            : DateTime.parse(json["plannedStartDate"]),
        plannedEndDate: json["plannedEndDate"] == null
            ? null
            : DateTime.parse(json["plannedEndDate"]),
        currentReading: json["currentReading"],
        stopBeginDate: json["stopBeginDate"] == null
            ? null
            : DateTime.parse(json["stopBeginDate"]),
        workOrderId: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        siteId: json["siteId"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  factory WorkOrderModel.fromEntity(WorkorderEntity entity) {
    return WorkOrderModel(
      workResponsible: entity.workResponsible,
      priorityName: entity.priorityName,
      duration: entity.duration,
      assetName: entity.assetName,
      assetCode: entity.assetCode,
      jobPlanName: entity.jobPlanName,
      failureClassName: entity.failureClassName,
      problemName: entity.problemName,
      locationName: entity.locationName,
      locationCode: entity.locationCode,
      serviceRequestName: entity.serviceRequestName,
      serviceRequestCode: entity.serviceRequestCode,
      preventiveMaintenanceName: entity.preventiveMaintenanceName,
      approvedByName: entity.approvedByName,
      rejectedByName: entity.rejectedByName,
      serviceRequestId: entity.serviceRequestId,
      workOrderName: entity.workOrderName,
      code: entity.code,
      description: entity.description,
      assetId: entity.assetId,
      locationId: entity.locationId,
      workTypeName: entity.workTypeName,
      status: entity.status,
      actualStartDate: entity.actualStartDate,
      actualEndDate: entity.actualEndDate,
      targetStartDate: entity.targetStartDate,
      targetEndDate: entity.targetEndDate,
      plannedStartDate: entity.plannedStartDate,
      plannedEndDate: entity.plannedEndDate,
      currentReading: entity.currentReading,
      stopBeginDate: entity.stopBeginDate,
      workOrderId: entity.workOrderId,
      isActive: entity.isActive,
      isDeleted: entity.isDeleted,
      siteId: entity.siteId,
      createdDate: entity.createdDate,
    );
  }
}

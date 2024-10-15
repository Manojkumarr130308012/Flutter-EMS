// class WorkorderEntity extends Equatable {
import 'package:isar/isar.dart';

class WorkorderEntity {
  Id id = Isar.autoIncrement;
  final String? workResponsible;
  final String? priorityName;
  final double? duration;
  final String? assetName;
  final String? jobPlanName;
  final String? failureClassName;
  final String? problemName;
  final String? locationName;
  final String? serviceRequestName;
  final String? serviceRequestCode;
  final String? preventiveMaintenanceName;
  final String? approvedByName;
  final String? rejectedByName;
  final String? serviceRequestId;
  final String? workOrderName;
  final String? code;
  final String? description;
  final String? assetId;
  final String? assetCode;
  final String? locationId;
  final String? locationCode;
  final String? workTypeName;
  final String? status;
  final DateTime? actualStartDate;
  final DateTime? actualEndDate;
  final DateTime? targetStartDate;
  final DateTime? targetEndDate;
  final DateTime? plannedStartDate;
  final DateTime? plannedEndDate;
  final double? currentReading;
  final DateTime? stopBeginDate;
  final String? workOrderId;
  final bool? isActive;
  final bool? isDeleted;
  final String? siteId;
  final DateTime? createdDate;
  bool isSynced;

  WorkorderEntity({
    required this.workResponsible,
    required this.priorityName,
    required this.duration,
    required this.assetName,
    required this.jobPlanName,
    required this.failureClassName,
    required this.problemName,
    required this.locationName,
    required this.serviceRequestName,
    required this.serviceRequestCode,
    required this.preventiveMaintenanceName,
    required this.approvedByName,
    required this.rejectedByName,
    required this.serviceRequestId,
    required this.workOrderName,
    required this.code,
    required this.description,
    required this.assetId,
    required this.assetCode,
    required this.locationId,
    required this.locationCode,
    required this.workTypeName,
    required this.status,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.targetStartDate,
    required this.targetEndDate,
    required this.plannedStartDate,
    required this.plannedEndDate,
    required this.currentReading,
    required this.stopBeginDate,
    required this.workOrderId,
    required this.isActive,
    required this.isDeleted,
    required this.siteId,
    required this.createdDate,
    this.isSynced = true,
  });

  @ignore
  List<Object?> get props => [
        workResponsible,
        priorityName,
        duration,
        assetName,
        jobPlanName,
        failureClassName,
        problemName,
        locationName,
        serviceRequestName,
        serviceRequestCode,
        preventiveMaintenanceName,
        approvedByName,
        rejectedByName,
        serviceRequestId,
        workOrderName,
        code,
        description,
        assetId,
        assetCode,
        locationId,
        locationCode,
        workTypeName,
        status,
        actualStartDate,
        actualEndDate,
        targetStartDate,
        targetEndDate,
        plannedStartDate,
        plannedEndDate,
        currentReading,
        stopBeginDate,
        id,
        isActive,
        isDeleted,
        siteId,
        createdDate,
      ];
}

class WorkOrder {
  final String? priorityName;
  final double? duration;
  final String? assetName;
  final String? jobPlanName;
  final String? failureClassName;
  final String? failureName;
  final String? locationName;
  final String? serviceRequestName;
  final String? preventiveMaintenanceName;
  final String? approvedByName;
  final String? rejectedByName;
  final String? workOrderName;
  final String? workOrderCode;
  final String? description;
  final String? assetId;
  final String? locationId;
  final String? workType;
  final String? status;
  final String? priorityId;
  final String? actualStartDate;
  final String? actualEndDate;
  final String? targetStartDate;
  final String? targetEndDate;
  final String? plannedStartDate;
  final String? plannedEndDate;
  final double? currentReading;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final String? createdDate;

  WorkOrder({
    required this.priorityName,
    required this.duration,
    required this.assetName,
    required this.jobPlanName,
    required this.failureClassName,
    required this.failureName,
    required this.locationName,
    required this.serviceRequestName,
    required this.preventiveMaintenanceName,
    required this.approvedByName,
    required this.rejectedByName,
    required this.workOrderName,
    required this.workOrderCode,
    required this.description,
    required this.assetId,
    required this.locationId,
    required this.workType,
    required this.status,
    required this.priorityId,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.targetStartDate,
    required this.targetEndDate,
    required this.plannedStartDate,
    required this.plannedEndDate,
    required this.currentReading,
    required this.id,
    required this.isActive,
    required this.isDeleted,
    required this.createdDate,
  });

  factory WorkOrder.fromJson(Map<String, dynamic> json) {
    return WorkOrder(
      priorityName: json['priorityName'],
      duration: json['duration'],
      assetName: json['assetName'],
      jobPlanName: json['jobPlanName'],
      failureClassName: json['failureClassName'],
      failureName: json['failureName'],
      locationName: json['locationName'],
      serviceRequestName: json['serviceRequestName'],
      preventiveMaintenanceName: json['preventiveMaintenanceName'],
      approvedByName: json['approvedByName'],
      rejectedByName: json['rejectedByName'],
      workOrderName: json['workOrderName'],
      workOrderCode: json['workOrderCode'],
      description: json['description'],
      assetId: json['assetId'],
      locationId: json['locationId'],
      workType: json['workType'],
      status: json['status'],
      priorityId: json['priorityId'] ?? "",
      actualStartDate: json['actualStartDate'],
      actualEndDate: json['actualEndDate'],
      targetStartDate: json['targetStartDate'],
      targetEndDate: json['targetEndDate'],
      plannedStartDate: json['plannedStartDate'],
      plannedEndDate: json['plannedEndDate'],
      currentReading: json['currentReading'],
      id: json['id'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdDate: json['createdDate'],
    );
  }

  static List<WorkOrder> fromMapList(List<dynamic> jsonList) =>
      jsonList.map((e) => WorkOrder.fromJson(e)).toList();

  @override
  String toString() {
    return 'WorkOrder{'
        'priorityName: $priorityName, '
        'duration: $duration,'
        'assetName: $assetName, '
        'jobPlanName: $jobPlanName, '
        'failureClassName: $failureClassName, '
        'failureName: $failureName, '
        'locationName: $locationName, '
        'serviceRequestName: $serviceRequestName,'
        ' preventiveMaintenanceName: $preventiveMaintenanceName, '
        'approvedByName: $approvedByName,'
        ' rejectedByName: $rejectedByName, '
        'workOrderName: $workOrderName,'
        ' workOrderCode: $workOrderCode, description: $description, '
        'assetId: $assetId, locationId: $locationId, workType: $workType, '
        'status: $status, priorityId: $priorityId, '
        'actualStartDate: $actualStartDate, '
        'actualEndDate: $actualEndDate, '
        'targetStartDate: $targetStartDate, '
        'targetEndDate: $targetEndDate, '
        'plannedStartDate: $plannedStartDate, '
        'plannedEndDate: $plannedEndDate, '
        'currentReading: $currentReading, '
        'id: $id, '
        'isActive: $isActive, '
        'isDeleted: $isDeleted, '
        'createdDate: $createdDate}';
  }
}

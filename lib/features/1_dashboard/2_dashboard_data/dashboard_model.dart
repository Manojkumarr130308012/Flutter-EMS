class DashBoardWorkOrder {
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
  final DateTime? actualStartDate;
  final DateTime? actualEndDate;
  final DateTime? targetStartDate;
  final DateTime? targetEndDate;
  final DateTime? plannedStartDate;
  final DateTime? plannedEndDate;
  final double? currentReading;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  DashBoardWorkOrder({
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

  factory DashBoardWorkOrder.fromJson(Map<String, dynamic> json) {
    return DashBoardWorkOrder(
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
      actualStartDate: DateTime.parse(json['actualStartDate']),
      actualEndDate: DateTime.parse(json['actualEndDate']),
      targetStartDate: DateTime.parse(json['targetStartDate']),
      targetEndDate: DateTime.parse(json['targetEndDate']),
      plannedStartDate: DateTime.parse(json['plannedStartDate']),
      plannedEndDate: DateTime.parse(json['plannedEndDate']),
      currentReading: json['currentReading'],
      id: json['id'],
      isActive: json['isActive'],
      isDeleted: json['isDeleted'],
      createdDate: DateTime.parse(json['createdDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        "priorityName": priorityName,
        "duration": duration,
        "assetName": assetName,
        "jobPlanName": jobPlanName,
        "failureClassName": failureClassName,
        "failureName": failureName,
        "locationName": locationName,
        "serviceRequestName": serviceRequestName,
        "preventiveMaintenanceName": preventiveMaintenanceName,
        "approvedByName": approvedByName,
        "rejectedByName": rejectedByName,
        "workOrderName": workOrderName,
        "workOrderCode": workOrderCode,
        "description": description,
        "assetId": assetId,
        "locationId": locationId,
        "workType": workType,
        "status": status,
        "priorityId": priorityId,
        "actualStartDate": actualStartDate?.toIso8601String(),
        "actualEndDate": actualEndDate?.toIso8601String(),
        "targetStartDate": targetStartDate?.toIso8601String(),
        "targetEndDate": targetEndDate?.toIso8601String(),
        "plannedStartDate": plannedStartDate?.toIso8601String(),
        "plannedEndDate": plannedEndDate?.toIso8601String(),
        "currentReading": currentReading,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };

  static List<DashBoardWorkOrder> fromMapList(List<dynamic> jsonList) =>
      jsonList.map((e) => DashBoardWorkOrder.fromJson(e)).toList();

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

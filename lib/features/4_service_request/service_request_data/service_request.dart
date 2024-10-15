import 'dart:convert';

ServiceRequest serviceRequestFromJson(String str) => ServiceRequest.fromJson(json.decode(str));

String serviceRequestToJson(ServiceRequest data) => json.encode(data.toJson());

class ServiceRequest {
  final String? assetName;
  final String? locationName;
  final String? failureClassName;
  final String? problemName;
  final String? failureCodetype;
  final String? serviceRequestName;
  final String? code;
  final String? description;
  final String? reasontoCancel;
  final String? workType;
  final String? status;
  final String? failureClassId;
  final String? problemId;
  final DateTime? requestedDate;
  final DateTime? stopBeginDate;
  final DateTime? closingDate;
  final DateTime? approvalDate;
  final String? assetId;
  final String? locationId;
  final bool? isWoCreated;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  ServiceRequest({
    this.assetName,
    this.locationName,
    this.failureClassName,
    this.problemName,
    this.failureCodetype,
    this.serviceRequestName,
    this.code,
    this.description,
    this.reasontoCancel,
    this.workType,
    this.status,
    this.failureClassId,
    this.problemId,
    this.requestedDate,
    this.stopBeginDate,
    this.closingDate,
    this.approvalDate,
    this.assetId,
    this.locationId,
    this.isWoCreated,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  ServiceRequest copyWith({
    String? assetName,
    String? locationName,
    String? failureClassName,
    String? problemName,
    String? failureCodetype,
    String? serviceRequestName,
    String? code,
    String? description,
    String? reasontoCancel,
    String? workType,
    String? status,
    String? failureClassId,
    String? problemId,
    DateTime? requestedDate,
    DateTime? stopBeginDate,
    DateTime? closingDate,
    DateTime? approvalDate,
    String? assetId,
    String? locationId,
    bool? isWoCreated,
    String? id,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
  }) =>
      ServiceRequest(
        assetName: assetName ?? this.assetName,
        locationName: locationName ?? this.locationName,
        failureClassName: failureClassName ?? this.failureClassName,
        problemName: problemName ?? this.problemName,
        failureCodetype: failureCodetype ?? this.failureCodetype,
        serviceRequestName: serviceRequestName ?? this.serviceRequestName,
        code: code ?? this.code,
        description: description ?? this.description,
        reasontoCancel: reasontoCancel ?? this.reasontoCancel,
        workType: workType ?? this.workType,
        status: status ?? this.status,
        failureClassId: failureClassId ?? this.failureClassId,
        problemId: problemId ?? this.problemId,
        requestedDate: requestedDate ?? this.requestedDate,
        stopBeginDate: stopBeginDate ?? this.stopBeginDate,
        closingDate: closingDate ?? this.closingDate,
        approvalDate: approvalDate ?? this.approvalDate,
        assetId: assetId ?? this.assetId,
        locationId: locationId ?? this.locationId,
        isWoCreated: isWoCreated ?? this.isWoCreated,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        createdDate: createdDate ?? this.createdDate,
      );

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
        assetName: json["assetName"],
        locationName: json["locationName"],
        failureClassName: json["failureClassName"],
        problemName: json["problemName"],
        failureCodetype: json["failureCodetype"],
        serviceRequestName: json["serviceRequestName"],
        code: json["code"],
        description: json["description"],
        reasontoCancel: json["reasontoCancel"],
        workType: json["workType"],
        status: json["status"],
        failureClassId: json["failureClassId"],
        problemId: json["problemId"],
        requestedDate: json["requestedDate"] == null ? null : DateTime.parse(json["requestedDate"]),
        stopBeginDate: json["stopBeginDate"] == null ? null : DateTime.parse(json["stopBeginDate"]),
        closingDate: json["closingDate"] == null ? null : DateTime.parse(json["closingDate"]),
        approvalDate: json["approvalDate"] == null ? null : DateTime.parse(json["approvalDate"]),
        assetId: json["assetId"],
        locationId: json["locationId"],
        isWoCreated: json["isWoCreated"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "assetName": assetName,
        "locationName": locationName,
        "failureClassName": failureClassName,
        "problemName": problemName,
        "failureCodetype": failureCodetype,
        "serviceRequestName": serviceRequestName,
        "code": code,
        "description": description,
        "reasontoCancel": reasontoCancel,
        "workType": workType,
        "status": status,
        "failureClassId": failureClassId,
        "problemId": problemId,
        "requestedDate": requestedDate?.toIso8601String(),
        "stopBeginDate": stopBeginDate?.toIso8601String(),
        "closingDate": closingDate?.toIso8601String(),
        "approvalDate": approvalDate?.toIso8601String(),
        "assetId": assetId,
        "locationId": locationId,
        "isWoCreated": isWoCreated,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": DateTime.now(),
      };
}

// ServiceRequest serviceRequestFromJson(String str) =>
//     ServiceRequest.fromJson(json.decode(str));
//
// String serviceRequestToJson(ServiceRequest data) => json.encode(data.toJson());
//
// class ServiceRequest {
//   final String assetName;
//   final String locationName;
//   final String failureClassName;
//   final String failureName;
//   final String failureCodetype;
//   final String serviceRequestName;
//   final String serviceRequestCode;
//   final String description;
//   final String reasontoCancel;
//   final String workType;
//   final String status;
//   final String failureClassId;
//   final String failureCodeId;
//   final DateTime requestedDate;
//   final DateTime stopBeginDate;
//   final DateTime closingDate;
//   final DateTime approvalDate;
//   final String assetId;
//   final String locationId;
//   final bool isWoCreated;
//   final String id;
//   final bool isActive;
//   final bool isDeleted;
//   final DateTime createdDate;
//
//   ServiceRequest({
//     required this.assetName,
//     required this.locationName,
//     required this.failureClassName,
//     required this.failureName,
//     required this.failureCodetype,
//     required this.serviceRequestName,
//     required this.serviceRequestCode,
//     required this.description,
//     required this.reasontoCancel,
//     required this.workType,
//     required this.status,
//     required this.failureClassId,
//     required this.failureCodeId,
//     required this.requestedDate,
//     required this.stopBeginDate,
//     required this.closingDate,
//     required this.approvalDate,
//     required this.assetId,
//     required this.locationId,
//     required this.isWoCreated,
//     required this.id,
//     required this.isActive,
//     required this.isDeleted,
//     required this.createdDate,
//   });
//
//   ServiceRequest copyWith({
//     String? assetName,
//     String? locationName,
//     String? failureClassName,
//     String? failureName,
//     String? failureCodetype,
//     String? serviceRequestName,
//     String? serviceRequestCode,
//     String? description,
//     String? reasontoCancel,
//     String? workType,
//     String? status,
//     String? failureClassId,
//     String? failureCodeId,
//     DateTime? requestedDate,
//     DateTime? stopBeginDate,
//     DateTime? closingDate,
//     DateTime? approvalDate,
//     String? assetId,
//     String? locationId,
//     bool? isWoCreated,
//     String? id,
//     bool? isActive,
//     bool? isDeleted,
//     DateTime? createdDate,
//   }) =>
//       ServiceRequest(
//         assetName: assetName ?? this.assetName,
//         locationName: locationName ?? this.locationName,
//         failureClassName: failureClassName ?? this.failureClassName,
//         failureName: failureName ?? this.failureName,
//         failureCodetype: failureCodetype ?? this.failureCodetype,
//         serviceRequestName: serviceRequestName ?? this.serviceRequestName,
//         serviceRequestCode: serviceRequestCode ?? this.serviceRequestCode,
//         description: description ?? this.description,
//         reasontoCancel: reasontoCancel ?? this.reasontoCancel,
//         workType: workType ?? this.workType,
//         status: status ?? this.status,
//         failureClassId: failureClassId ?? this.failureClassId,
//         failureCodeId: failureCodeId ?? this.failureCodeId,
//         requestedDate: requestedDate ?? this.requestedDate,
//         stopBeginDate: stopBeginDate ?? this.stopBeginDate,
//         closingDate: closingDate ?? this.closingDate,
//         approvalDate: approvalDate ?? this.approvalDate,
//         assetId: assetId ?? this.assetId,
//         locationId: locationId ?? this.locationId,
//         isWoCreated: isWoCreated ?? this.isWoCreated,
//         id: id ?? this.id,
//         isActive: isActive ?? this.isActive,
//         isDeleted: isDeleted ?? this.isDeleted,
//         createdDate: createdDate ?? this.createdDate,
//       );
//
//   factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
//         assetName: json["assetName"],
//         locationName: json["locationName"],
//         failureClassName: json["failureClassName"],
//         failureName: json["failureName"],
//         failureCodetype: json["failureCodetype"],
//         serviceRequestName: json["serviceRequestName"],
//         serviceRequestCode: json["serviceRequestCode"],
//         description: json["description"],
//         reasontoCancel: json["reasontoCancel"],
//         workType: json["workType"],
//         status: json["status"],
//         failureClassId: json["failureClassId"],
//         failureCodeId: json["failureCodeId"],
//         requestedDate: DateTime.parse(json["requestedDate"]),
//         stopBeginDate: DateTime.parse(json["stopBeginDate"]),
//         closingDate: DateTime.parse(json["closingDate"]),
//         approvalDate: DateTime.parse(json["approvalDate"]),
//         assetId: json["assetId"],
//         locationId: json["locationId"],
//         isWoCreated: json["isWoCreated"],
//         id: json["id"],
//         isActive: json["isActive"],
//         isDeleted: json["isDeleted"],
//         createdDate: DateTime.parse(json["createdDate"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "assetName": assetName,
//         "locationName": locationName,
//         "failureClassName": failureClassName,
//         "failureName": failureName,
//         "failureCodetype": failureCodetype,
//         "serviceRequestName": serviceRequestName,
//         "serviceRequestCode": serviceRequestCode,
//         "description": description,
//         "reasontoCancel": reasontoCancel,
//         "workType": workType,
//         "status": status,
//         "failureClassId": failureClassId,
//         "failureCodeId": failureCodeId,
//         "requestedDate": requestedDate.toIso8601String(),
//         "stopBeginDate": stopBeginDate.toIso8601String(),
//         "closingDate": closingDate.toIso8601String(),
//         "approvalDate": approvalDate.toIso8601String(),
//         "assetId": assetId,
//         "locationId": locationId,
//         "isWoCreated": isWoCreated,
//         "id": id,
//         "isActive": isActive,
//         "isDeleted": isDeleted,
//         "createdDate": createdDate.toIso8601String(),
//       };
// }
//

///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\

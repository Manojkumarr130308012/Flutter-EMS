import 'dart:convert';

FailureCode failureCodeFromJson(String str) => FailureCode.fromJson(json.decode(str));

String failureCodeToJson(FailureCode data) => json.encode(data.toJson());

class FailureCode {
  final String? failureClasName;
  final String? parentFailureName;
  final String? failureClassId;
  final String? failureName;
  final String? code;
  final String? failureCodetype;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  FailureCode({
    this.failureClasName,
    this.parentFailureName,
    this.failureClassId,
    this.failureName,
    this.code,
    this.failureCodetype,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  FailureCode copyWith({
    String? failureClasName,
    String? parentFailureName,
    String? failureClassId,
    String? failureName,
    String? code,
    String? failureCodetype,
    String? id,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
  }) =>
      FailureCode(
        failureClasName: failureClasName ?? this.failureClasName,
        parentFailureName: parentFailureName ?? this.parentFailureName,
        failureClassId: failureClassId ?? this.failureClassId,
        failureName: failureName ?? this.failureName,
        code: code ?? this.code,
        failureCodetype: failureCodetype ?? this.failureCodetype,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        createdDate: createdDate ?? this.createdDate,
      );

  factory FailureCode.fromJson(Map<String, dynamic> json) => FailureCode(
        failureClasName: json["failureClasName"],
        parentFailureName: json["parentFailureName"],
        failureClassId: json["failureClassId"],
        failureName: json["failureName"],
        code: json["code"],
        failureCodetype: json["failureCodetype"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "failureClasName": failureClasName,
        "parentFailureName": parentFailureName,
        "failureClassId": failureClassId,
        "failureName": failureName,
        "code": code,
        "failureCodetype": failureCodetype,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

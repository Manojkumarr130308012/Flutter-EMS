import 'dart:convert';

import 'package:oriens_eam/features/11_problem/domain/entities/problem.dart';

class ProblemModel extends ProblemEntity {
  const ProblemModel({
    String? failureClassName,
    String? failureClassCode,
    String? failureClassId,
    String? problemName,
    String? problemCode,
    String? problemDescription,
    String? id,
    bool? isActive,
    bool? isDeleted,
    String? createdDate,
  }) : super(
            failureClassName: failureClassName,
            failureClassCode: failureClassCode,
            failureClassId: failureClassId,
            problemName: problemName,
            problemCode: problemCode,
            problemDescription: problemDescription,
            id: id,
            isActive: isActive,
            isDeleted: isDeleted,
            createdDate: createdDate);

  factory ProblemModel.fromJson(Map<String, dynamic> json) => ProblemModel(
        failureClassName: json["failureClassName"],
        failureClassCode: json["failureClassCode"],
        failureClassId: json["failureClassId"],
        problemName: json["problemName"],
        problemCode: json["problemCode"],
        problemDescription: json["problemDescription"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "failureClassName": failureClassName,
        "failureClassCode": failureClassCode,
        "failureClassId": failureClassId,
        "problemName": problemName,
        "problemCode": problemCode,
        "problemDescription": problemDescription,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate,
      };
}

/////////////////////////////////////////////////////////////
///
/////////////////////////////////////////////////////////////

Problem problemFromJson(String str) => Problem.fromJson(json.decode(str));

String problemToJson(Problem data) => json.encode(data.toJson());

class Problem {
  final String? failureClassName;
  final String? failureClassCode;
  final String? failureClassId;
  final String? problemName;
  final String? problemCode;
  final String? problemDescription;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  Problem({
    this.failureClassName,
    this.failureClassCode,
    this.failureClassId,
    this.problemName,
    this.problemCode,
    this.problemDescription,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        failureClassName: json["failureClassName"],
        failureClassCode: json["failureClassCode"],
        failureClassId: json["failureClassId"],
        problemName: json["problemName"],
        problemCode: json["problemCode"],
        problemDescription: json["problemDescription"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "failureClassName": failureClassName,
        "failureClassCode": failureClassCode,
        "failureClassId": failureClassId,
        "problemName": problemName,
        "problemCode": problemCode,
        "problemDescription": problemDescription,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

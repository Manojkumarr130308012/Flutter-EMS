import 'dart:convert';

FailureClass failureClassFromJson(String str) => FailureClass.fromJson(json.decode(str));

String failureClassToJson(FailureClass data) => json.encode(data.toJson());

class FailureClass {
  final List<dynamic>? failureCodeList;
  final String? failureClassName;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final String? siteId;
  final DateTime? createdDate;
  final String? createdById;

  FailureClass({
    this.failureCodeList,
    this.failureClassName,
    this.id,
    this.isActive,
    this.isDeleted,
    this.siteId,
    this.createdDate,
    this.createdById,
  });

  FailureClass copyWith({
    List<dynamic>? failureCodeList,
    String? failureClassName,
    String? id,
    bool? isActive,
    bool? isDeleted,
    String? siteId,
    DateTime? createdDate,
    String? createdById,
  }) =>
      FailureClass(
        failureCodeList: failureCodeList ?? this.failureCodeList,
        failureClassName: failureClassName ?? this.failureClassName,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        siteId: siteId ?? this.siteId,
        createdDate: createdDate ?? this.createdDate,
        createdById: createdById ?? this.createdById,
      );

  factory FailureClass.fromJson(Map<String, dynamic> json) => FailureClass(
        failureCodeList: json["failureCodeList"] == null
            ? []
            : List<dynamic>.from(json["failureCodeList"]!.map((x) => x)),
        failureClassName: json["failureClassName"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        siteId: json["siteId"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        createdById: json["createdById"],
      );

  Map<String, dynamic> toJson() => {
        "failureCodeList":
            failureCodeList == null ? [] : List<dynamic>.from(failureCodeList!.map((x) => x)),
        "failureClassName": failureClassName,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "siteId": siteId,
        "createdDate": createdDate?.toIso8601String(),
        "createdById": createdById,
      };
}

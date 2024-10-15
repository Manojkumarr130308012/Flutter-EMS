import 'dart:convert';

WorkorderParts workorderPartsFromJson(String str) => WorkorderParts.fromJson(json.decode(str));

String workorderPartsToJson(WorkorderParts data) => json.encode(data.toJson());

class WorkorderParts {
  final String? partName;
  final String? workOrderId;
  final String? partId;
  final double? quantity;
  final String? id;
  final String? code;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  WorkorderParts({
    this.partName,
    this.workOrderId,
    this.partId,
    this.quantity,
    this.id,
    this.code,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  factory WorkorderParts.fromJson(Map<String, dynamic> json) => WorkorderParts(
        partName: json["partName"],
        workOrderId: json["workOrderId"],
        partId: json["partId"],
        quantity: json["quantity"],
        id: json["id"],
        code: json["code"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "partName": partName,
        "workOrderId": workOrderId,
        "partId": partId,
        "quantity": quantity,
        "id": id,
        "code": code,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

import 'dart:convert';

AssetPartsModel assetPartsFromJson(String str) => AssetPartsModel.fromJson(json.decode(str));

String assetPartsToJson(AssetPartsModel data) => json.encode(data.toJson());

class AssetPartsModel {
  final String? criticalityName;
  final String? partName;
  final String? partCode;
  final String? partDescription;
  final int? partQuantity;
  final String? partStatus;
  final bool? isRotating;
  final bool? isQcPassed;
  final String? purchasedUomId;
  final String? issuedUomId;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  AssetPartsModel({
    this.criticalityName,
    this.partName,
    this.partCode,
    this.partDescription,
    this.partQuantity,
    this.partStatus,
    this.isRotating,
    this.isQcPassed,
    this.purchasedUomId,
    this.issuedUomId,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  factory AssetPartsModel.fromJson(Map<String, dynamic> json) => AssetPartsModel(
        criticalityName: json["criticalityName"],
        partName: json["partName"],
        partCode: json["partCode"],
        partDescription: json["partDescription"],
        partQuantity: json["partQuantity"],
        partStatus: json["partStatus"],
        isRotating: json["isRotating"],
        isQcPassed: json["isQCPassed"],
        purchasedUomId: json["purchasedUomId"],
        issuedUomId: json["issuedUomId"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "criticalityName": criticalityName,
        "partName": partName,
        "partCode": partCode,
        "partDescription": partDescription,
        "partQuantity": partQuantity,
        "partStatus": partStatus,
        "isRotating": isRotating,
        "isQCPassed": isQcPassed,
        "purchasedUomId": purchasedUomId,
        "issuedUomId": issuedUomId,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

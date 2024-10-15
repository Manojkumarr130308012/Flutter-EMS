// To parse this JSON data, do
//
//     final assetFile = assetFileFromJson(jsonString);

import 'dart:convert';

AssetFile assetFileFromJson(String str) => AssetFile.fromJson(json.decode(str));

String assetFileToJson(AssetFile data) => json.encode(data.toJson());

class AssetFile {
  final String? assetId;
  final String? documentName;
  final String? documentcategory;
  final String? documenttype;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  AssetFile({
    this.assetId,
    this.documentName,
    this.documentcategory,
    this.documenttype,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  factory AssetFile.fromJson(Map<String, dynamic> json) => AssetFile(
        assetId: json["assetId"],
        documentName: json["documentName"],
        documentcategory: json["documentcategory"],
        documenttype: json["documenttype"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "assetId": assetId,
        "documentName": documentName,
        "documentcategory": documentcategory,
        "documenttype": documenttype,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

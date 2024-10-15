import 'dart:convert';

Asset assetFromJson(String str) => Asset.fromJson(json.decode(str));

String assetToJson(Asset data) => json.encode(data.toJson());

class Asset {
  final String? ownerName;
  final String? productionResponsiblePersonname;
  final String? maintenanceResponsiblePersonname;
  final String? techSpecName;
  final String? parentAssetName;
  final String? categoryName;
  final String? assetTypeName;
  final String? locationCode;
  final String? locationName;
  final String? statusName;
  final String? failureClassName;
  final String? failureClassesId;
  final String? assetName;
  final String? assetCode;
  final String? serialNumber;
  final String? model;
  final double? purchasePrice;
  final String? warrantyName;
  final String? warrantyType;
  final String? warrantyStatus;
  final String? startingUsage;
  final String? expirationUsage;
  final String? qrCodeData;
  final String? assetTypeId;
  final String? assetCategoryId;
  final String? assetStatusId;
  final String? locationId;
  final String? id;
  final bool? isActive;
  final bool? isDeleted;
  final DateTime? createdDate;

  Asset({
    this.ownerName,
    this.productionResponsiblePersonname,
    this.maintenanceResponsiblePersonname,
    this.techSpecName,
    this.parentAssetName,
    this.categoryName,
    this.assetTypeName,
    this.locationName,
    this.locationCode,
    this.statusName,
    this.failureClassName,
    this.failureClassesId,
    this.assetName,
    this.assetCode,
    this.serialNumber,
    this.model,
    this.purchasePrice,
    this.warrantyName,
    this.warrantyType,
    this.warrantyStatus,
    this.startingUsage,
    this.expirationUsage,
    this.qrCodeData,
    this.assetTypeId,
    this.assetCategoryId,
    this.assetStatusId,
    this.locationId,
    this.id,
    this.isActive,
    this.isDeleted,
    this.createdDate,
  });

  Asset copyWith({
    String? ownerName,
    String? productionResponsiblePersonname,
    String? maintenanceResponsiblePersonname,
    String? techSpecName,
    String? parentAssetName,
    String? categoryName,
    String? assetTypeName,
    String? locationName,
    String? locationCode,
    String? statusName,
    String? assetName,
    String? failureClassName,
    String? failureClassesId,
    String? assetCode,
    String? serialNumber,
    String? model,
    double? purchasePrice,
    String? warrantyName,
    String? warrantyType,
    String? warrantyStatus,
    String? startingUsage,
    String? expirationUsage,
    String? qrCodeData,
    String? assetTypeId,
    String? assetCategoryId,
    String? assetStatusId,
    String? locationId,
    String? id,
    bool? isActive,
    bool? isDeleted,
    DateTime? createdDate,
  }) =>
      Asset(
        ownerName: ownerName ?? this.ownerName,
        productionResponsiblePersonname:
            productionResponsiblePersonname ?? this.productionResponsiblePersonname,
        maintenanceResponsiblePersonname:
            maintenanceResponsiblePersonname ?? this.maintenanceResponsiblePersonname,
        techSpecName: techSpecName ?? this.techSpecName,
        parentAssetName: parentAssetName ?? this.parentAssetName,
        categoryName: categoryName ?? this.categoryName,
        assetTypeName: assetTypeName ?? this.assetTypeName,
        failureClassName: failureClassName ?? this.failureClassName,
        failureClassesId: failureClassesId ?? this.failureClassesId,
        locationName: locationName ?? this.locationName,
        locationCode: locationCode ?? this.locationCode,
        statusName: statusName ?? this.statusName,
        assetName: assetName ?? this.assetName,
        assetCode: assetCode ?? this.assetCode,
        serialNumber: serialNumber ?? this.serialNumber,
        model: model ?? this.model,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        warrantyName: warrantyName ?? this.warrantyName,
        warrantyType: warrantyType ?? this.warrantyType,
        warrantyStatus: warrantyStatus ?? this.warrantyStatus,
        startingUsage: startingUsage ?? this.startingUsage,
        expirationUsage: expirationUsage ?? this.expirationUsage,
        qrCodeData: qrCodeData ?? this.qrCodeData,
        assetTypeId: assetTypeId ?? this.assetTypeId,
        assetCategoryId: assetCategoryId ?? this.assetCategoryId,
        assetStatusId: assetStatusId ?? this.assetStatusId,
        locationId: locationId ?? this.locationId,
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
        isDeleted: isDeleted ?? this.isDeleted,
        createdDate: createdDate ?? this.createdDate,
      );

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        ownerName: json["ownerName"],
        productionResponsiblePersonname: json["production_responsible_personname"],
        maintenanceResponsiblePersonname: json["maintenance_responsible_personname"],
        techSpecName: json["techSpecName"],
        parentAssetName: json["parentAssetName"],
        categoryName: json["categoryName"],
        assetTypeName: json["assetTypeName"],
        locationName: json["locationName"],
        locationCode: json["locationCode"],
        statusName: json["statusName"],
        failureClassName: json["failureClassName"],
        failureClassesId: json["failureClassesId"],
        assetName: json["assetName"],
        assetCode: json["assetCode"],
        serialNumber: json["serialNumber"],
        model: json["model"],
        purchasePrice: json["purchasePrice"],
        warrantyName: json["warrantyName"],
        warrantyType: json["warrantyType"],
        warrantyStatus: json["warrantyStatus"],
        startingUsage: json["startingUsage"],
        expirationUsage: json["expirationUsage"],
        qrCodeData: json["qrCodeData"],
        assetTypeId: json["assetTypeId"],
        assetCategoryId: json["assetCategoryId"],
        assetStatusId: json["assetStatusId"],
        locationId: json["locationId"],
        id: json["id"],
        isActive: json["isActive"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "ownerName": ownerName,
        "production_responsible_personname": productionResponsiblePersonname,
        "maintenance_responsible_personname": maintenanceResponsiblePersonname,
        "techSpecName": techSpecName,
        "parentAssetName": parentAssetName,
        "categoryName": categoryName,
        "assetTypeName": assetTypeName,
        "locationName": locationName,
        "locationCode": locationCode,
        "statusName": statusName,
        "failureClassName": failureClassName,
        "failureClassesId": failureClassesId,
        "assetName": assetName,
        "assetCode": assetCode,
        "serialNumber": serialNumber,
        "model": model,
        "purchasePrice": purchasePrice,
        "warrantyName": warrantyName,
        "warrantyType": warrantyType,
        "warrantyStatus": warrantyStatus,
        "startingUsage": startingUsage,
        "expirationUsage": expirationUsage,
        "qrCodeData": qrCodeData,
        "assetTypeId": assetTypeId,
        "assetCategoryId": assetCategoryId,
        "assetStatusId": assetStatusId,
        "locationId": locationId,
        "id": id,
        "isActive": isActive,
        "isDeleted": isDeleted,
        "createdDate": createdDate?.toIso8601String(),
      };
}

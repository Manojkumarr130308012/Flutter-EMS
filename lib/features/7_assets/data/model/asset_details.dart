
class AssetDetail {
  String? manufacturerName;
  String? supplierName;
  String? ownerName;
  String? productionresponsiblepersonname;
  String? maintenanceresponsiblepersonname;
  String? techSpecName;
  String? parentAssetName;
  String? parentAssetCode;
  String? categoryName;
  String? assetTypeName;
  String? locationCode;
  String? locationName;
  String? statusName;
  String? criticalityName;
  String? failureClassName;
  String? priorityName;
  String? assetName;
  String? serialNumber;
  String? model;
  double? purchasePrice;
  String? installationDate;
  String? startDate;
  String? expirationDate;
  String? threshHoldCalendar;
  String? warrantyName;
  String? warrantyType;
  String? warrantyStatus;
  String? startingUsage;
  String? expirationUsage;
  String? qrCodeData;
  String? assetTypeId;
  String? assetCategoryId;
  String? failureClassesId;
  String? priorityId;
  String? criticalityId;
  String? assetStatusId;
  String? parentAssetId;
  String? locationId;
  String? supplierId;
  String? manufacturerId;
  String? assetImage;
  String? imageData;
  String? id;
  String? code;
  bool? isActive;
  bool? isDeleted;
  String? createdDate;

  AssetDetail({this.manufacturerName, this.supplierName, this.ownerName, this.productionresponsiblepersonname, this.maintenanceresponsiblepersonname, this.techSpecName, this.parentAssetName, this.parentAssetCode, this.categoryName, this.assetTypeName, this.locationCode, this.locationName, this.statusName, this.criticalityName, this.failureClassName, this.priorityName, this.assetName, this.serialNumber, this.model, this.purchasePrice, this.installationDate, this.startDate, this.expirationDate, this.threshHoldCalendar, this.warrantyName, this.warrantyType, this.warrantyStatus, this.startingUsage, this.expirationUsage, this.qrCodeData, this.assetTypeId, this.assetCategoryId, this.failureClassesId, this.priorityId, this.criticalityId, this.assetStatusId, this.parentAssetId, this.locationId, this.supplierId, this.manufacturerId, this.assetImage, this.imageData, this.id, this.code, this.isActive, this.isDeleted, this.createdDate});

  AssetDetail.fromJson(Map<String, dynamic> json) {
    manufacturerName = json['manufacturerName'];
    supplierName = json['supplierName'];
    ownerName = json['ownerName'];
    productionresponsiblepersonname = json['production_responsible_personname'];
    maintenanceresponsiblepersonname = json['maintenance_responsible_personname'];
    techSpecName = json['techSpecName'];
    parentAssetName = json['parentAssetName'];
    parentAssetCode = json['parentAssetCode'];
    categoryName = json['categoryName'];
    assetTypeName = json['assetTypeName'];
    locationCode = json['locationCode'];
    locationName = json['locationName'];
    statusName = json['statusName'];
    criticalityName = json['criticalityName'];
    failureClassName = json['failureClassName'];
    priorityName = json['priorityName'];
    assetName = json['assetName'];
    serialNumber = json['serialNumber'];
    model = json['model'];
    purchasePrice = json['purchasePrice'];
    installationDate = json['installationDate'];
    startDate = json['startDate'];
    expirationDate = json['expirationDate'];
    threshHoldCalendar = json['threshHoldCalendar'];
    warrantyName = json['warrantyName'];
    warrantyType = json['warrantyType'];
    warrantyStatus = json['warrantyStatus'];
    startingUsage = json['startingUsage'];
    expirationUsage = json['expirationUsage'];
    qrCodeData = json['qrCodeData'];
    assetTypeId = json['assetTypeId'];
    assetCategoryId = json['assetCategoryId'];
    failureClassesId = json['failureClassesId'];
    priorityId = json['priorityId'];
    criticalityId = json['criticalityId'];
    assetStatusId = json['assetStatusId'];
    parentAssetId = json['parentAssetId'];
    locationId = json['locationId'];
    supplierId = json['supplierId'];
    manufacturerId = json['manufacturerId'];
    assetImage = json['assetImage'];
    imageData = json['imageData'];
    id = json['id'];
    code = json['code'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['manufacturerName'] = manufacturerName;
    data['supplierName'] = supplierName;
    data['ownerName'] = ownerName;
    data['production_responsible_personname'] = productionresponsiblepersonname;
    data['maintenance_responsible_personname'] = maintenanceresponsiblepersonname;
    data['techSpecName'] = techSpecName;
    data['parentAssetName'] = parentAssetName;
    data['parentAssetCode'] = parentAssetCode;
    data['categoryName'] = categoryName;
    data['assetTypeName'] = assetTypeName;
    data['locationCode'] = locationCode;
    data['locationName'] = locationName;
    data['statusName'] = statusName;
    data['criticalityName'] = criticalityName;
    data['failureClassName'] = failureClassName;
    data['priorityName'] = priorityName;
    data['assetName'] = assetName;
    data['serialNumber'] = serialNumber;
    data['model'] = model;
    data['purchasePrice'] = purchasePrice;
    data['installationDate'] = installationDate;
    data['startDate'] = startDate;
    data['expirationDate'] = expirationDate;
    data['threshHoldCalendar'] = threshHoldCalendar;
    data['warrantyName'] = warrantyName;
    data['warrantyType'] = warrantyType;
    data['warrantyStatus'] = warrantyStatus;
    data['startingUsage'] = startingUsage;
    data['expirationUsage'] = expirationUsage;
    data['qrCodeData'] = qrCodeData;
    data['assetTypeId'] = assetTypeId;
    data['assetCategoryId'] = assetCategoryId;
    data['failureClassesId'] = failureClassesId;
    data['priorityId'] = priorityId;
    data['criticalityId'] = criticalityId;
    data['assetStatusId'] = assetStatusId;
    data['parentAssetId'] = parentAssetId;
    data['locationId'] = locationId;
    data['supplierId'] = supplierId;
    data['manufacturerId'] = manufacturerId;
    data['assetImage'] = assetImage;
    data['imageData'] = imageData;
    data['id'] = id;
    data['code'] = code;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    data['createdDate'] = createdDate;
    return data;
  }
}

class AssetDetails {
  AssetDetail? result;
  String? message;
  int? statusCode;

  AssetDetails({this.result, this.message, this.statusCode});

  AssetDetails.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? AssetDetail?.fromJson(json['result']) : null;
    message = json['message'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['result'] = result!.toJson();
    data['message'] = message;
    data['statusCode'] = statusCode;
    return data;
  }
}


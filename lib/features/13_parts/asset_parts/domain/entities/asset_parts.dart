import 'package:equatable/equatable.dart';

class AssetPartsEntity extends Equatable {
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

  const AssetPartsEntity({
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

  @override
  List<Object?> get props => [
        criticalityName,
        partName,
        partCode,
        partDescription,
        partQuantity,
        partStatus,
        isRotating,
        isQcPassed,
        purchasedUomId,
        issuedUomId,
        id,
        isActive,
        isDeleted,
        createdDate,
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workorder.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkOrderModelCollection on Isar {
  IsarCollection<WorkOrderModel> get workOrderModels => this.collection();
}

const WorkOrderModelSchema = CollectionSchema(
  name: r'WorkOrderModel',
  id: -5680994862373141074,
  properties: {
    r'actualEndDate': PropertySchema(
      id: 0,
      name: r'actualEndDate',
      type: IsarType.dateTime,
    ),
    r'actualStartDate': PropertySchema(
      id: 1,
      name: r'actualStartDate',
      type: IsarType.dateTime,
    ),
    r'approvedByName': PropertySchema(
      id: 2,
      name: r'approvedByName',
      type: IsarType.string,
    ),
    r'assetId': PropertySchema(
      id: 3,
      name: r'assetId',
      type: IsarType.string,
    ),
    r'assetName': PropertySchema(
      id: 4,
      name: r'assetName',
      type: IsarType.string,
    ),
    r'createdDate': PropertySchema(
      id: 5,
      name: r'createdDate',
      type: IsarType.dateTime,
    ),
    r'currentReading': PropertySchema(
      id: 6,
      name: r'currentReading',
      type: IsarType.double,
    ),
    r'description': PropertySchema(
      id: 7,
      name: r'description',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 8,
      name: r'duration',
      type: IsarType.double,
    ),
    r'failureClassName': PropertySchema(
      id: 9,
      name: r'failureClassName',
      type: IsarType.string,
    ),
    r'isActive': PropertySchema(
      id: 10,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'isDeleted': PropertySchema(
      id: 11,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'jobPlanName': PropertySchema(
      id: 12,
      name: r'jobPlanName',
      type: IsarType.string,
    ),
    r'locationId': PropertySchema(
      id: 13,
      name: r'locationId',
      type: IsarType.string,
    ),
    r'locationName': PropertySchema(
      id: 14,
      name: r'locationName',
      type: IsarType.string,
    ),
    r'plannedEndDate': PropertySchema(
      id: 15,
      name: r'plannedEndDate',
      type: IsarType.dateTime,
    ),
    r'plannedStartDate': PropertySchema(
      id: 16,
      name: r'plannedStartDate',
      type: IsarType.dateTime,
    ),
    r'preventiveMaintenanceName': PropertySchema(
      id: 17,
      name: r'preventiveMaintenanceName',
      type: IsarType.string,
    ),
    r'priorityName': PropertySchema(
      id: 18,
      name: r'priorityName',
      type: IsarType.string,
    ),
    r'problemName': PropertySchema(
      id: 19,
      name: r'problemName',
      type: IsarType.string,
    ),
    r'rejectedByName': PropertySchema(
      id: 20,
      name: r'rejectedByName',
      type: IsarType.string,
    ),
    r'serviceRequestCode': PropertySchema(
      id: 21,
      name: r'serviceRequestCode',
      type: IsarType.string,
    ),
    r'serviceRequestId': PropertySchema(
      id: 22,
      name: r'serviceRequestId',
      type: IsarType.string,
    ),
    r'serviceRequestName': PropertySchema(
      id: 23,
      name: r'serviceRequestName',
      type: IsarType.string,
    ),
    r'siteId': PropertySchema(
      id: 24,
      name: r'siteId',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 25,
      name: r'status',
      type: IsarType.string,
    ),
    r'stopBeginDate': PropertySchema(
      id: 26,
      name: r'stopBeginDate',
      type: IsarType.dateTime,
    ),
    r'targetEndDate': PropertySchema(
      id: 27,
      name: r'targetEndDate',
      type: IsarType.dateTime,
    ),
    r'targetStartDate': PropertySchema(
      id: 28,
      name: r'targetStartDate',
      type: IsarType.dateTime,
    ),
    r'workOrderCode': PropertySchema(
      id: 29,
      name: r'workOrderCode',
      type: IsarType.string,
    ),
    r'workOrderId': PropertySchema(
      id: 30,
      name: r'workOrderId',
      type: IsarType.string,
    ),
    r'workOrderName': PropertySchema(
      id: 31,
      name: r'workOrderName',
      type: IsarType.string,
    ),
    r'workResponsible': PropertySchema(
      id: 32,
      name: r'workResponsible',
      type: IsarType.string,
    ),
    r'workType': PropertySchema(
      id: 33,
      name: r'workType',
      type: IsarType.string,
    ),
    r'assetCode': PropertySchema(
      id: 34,
      name: r'assetCode',
      type: IsarType.string,
    ),
    r'locationCode': PropertySchema(
      id: 35,
      name: r'locationCode',
      type: IsarType.string,
    ),
  },
  estimateSize: _workOrderModelEstimateSize,
  serialize: _workOrderModelSerialize,
  deserialize: _workOrderModelDeserialize,
  deserializeProp: _workOrderModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _workOrderModelGetId,
  getLinks: _workOrderModelGetLinks,
  attach: _workOrderModelAttach,
  version: '3.1.0+1',
);

int _workOrderModelEstimateSize(
  WorkOrderModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.approvedByName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.assetId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.assetName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.assetCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.failureClassName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.jobPlanName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locationCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.preventiveMaintenanceName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.priorityName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.problemName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rejectedByName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serviceRequestCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serviceRequestId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.serviceRequestName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.siteId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.status;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workOrderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workOrderName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workResponsible;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.workTypeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _workOrderModelSerialize(
  WorkOrderModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.actualEndDate);
  writer.writeDateTime(offsets[1], object.actualStartDate);
  writer.writeString(offsets[2], object.approvedByName);
  writer.writeString(offsets[3], object.assetId);
  writer.writeString(offsets[4], object.assetName);
  writer.writeDateTime(offsets[5], object.createdDate);
  writer.writeDouble(offsets[6], object.currentReading);
  writer.writeString(offsets[7], object.description);
  writer.writeDouble(offsets[8], object.duration);
  writer.writeString(offsets[9], object.failureClassName);
  writer.writeBool(offsets[10], object.isActive);
  writer.writeBool(offsets[11], object.isDeleted);
  writer.writeString(offsets[12], object.jobPlanName);
  writer.writeString(offsets[13], object.locationId);
  writer.writeString(offsets[14], object.locationName);
  writer.writeDateTime(offsets[15], object.plannedEndDate);
  writer.writeDateTime(offsets[16], object.plannedStartDate);
  writer.writeString(offsets[17], object.preventiveMaintenanceName);
  writer.writeString(offsets[18], object.priorityName);
  writer.writeString(offsets[19], object.problemName);
  writer.writeString(offsets[20], object.rejectedByName);
  writer.writeString(offsets[21], object.serviceRequestCode);
  writer.writeString(offsets[22], object.serviceRequestId);
  writer.writeString(offsets[23], object.serviceRequestName);
  writer.writeString(offsets[24], object.siteId);
  writer.writeString(offsets[25], object.status);
  writer.writeDateTime(offsets[26], object.stopBeginDate);
  writer.writeDateTime(offsets[27], object.targetEndDate);
  writer.writeDateTime(offsets[28], object.targetStartDate);
  writer.writeString(offsets[29], object.code);
  writer.writeString(offsets[30], object.workOrderId);
  writer.writeString(offsets[31], object.workOrderName);
  writer.writeString(offsets[32], object.workResponsible);
  writer.writeString(offsets[33], object.workTypeName);
  writer.writeString(offsets[34], object.assetCode);
  writer.writeString(offsets[35], object.locationCode);
}

WorkOrderModel _workOrderModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkOrderModel(
    actualEndDate: reader.readDateTimeOrNull(offsets[0]),
    actualStartDate: reader.readDateTimeOrNull(offsets[1]),
    approvedByName: reader.readStringOrNull(offsets[2]),
    assetId: reader.readStringOrNull(offsets[3]),
    assetName: reader.readStringOrNull(offsets[4]),
    createdDate: reader.readDateTimeOrNull(offsets[5]),
    currentReading: reader.readDoubleOrNull(offsets[6]),
    description: reader.readStringOrNull(offsets[7]),
    duration: reader.readDoubleOrNull(offsets[8]),
    failureClassName: reader.readStringOrNull(offsets[9]),
    isActive: reader.readBoolOrNull(offsets[10]),
    isDeleted: reader.readBoolOrNull(offsets[11]),
    jobPlanName: reader.readStringOrNull(offsets[12]),
    locationId: reader.readStringOrNull(offsets[13]),
    locationName: reader.readStringOrNull(offsets[14]),
    plannedEndDate: reader.readDateTimeOrNull(offsets[15]),
    plannedStartDate: reader.readDateTimeOrNull(offsets[16]),
    preventiveMaintenanceName: reader.readStringOrNull(offsets[17]),
    priorityName: reader.readStringOrNull(offsets[18]),
    problemName: reader.readStringOrNull(offsets[19]),
    rejectedByName: reader.readStringOrNull(offsets[20]),
    serviceRequestCode: reader.readStringOrNull(offsets[21]),
    serviceRequestId: reader.readStringOrNull(offsets[22]),
    serviceRequestName: reader.readStringOrNull(offsets[23]),
    siteId: reader.readStringOrNull(offsets[24]),
    status: reader.readStringOrNull(offsets[25]),
    stopBeginDate: reader.readDateTimeOrNull(offsets[26]),
    targetEndDate: reader.readDateTimeOrNull(offsets[27]),
    targetStartDate: reader.readDateTimeOrNull(offsets[28]),
    code: reader.readStringOrNull(offsets[29]),
    workOrderId: reader.readStringOrNull(offsets[30]),
    workOrderName: reader.readStringOrNull(offsets[31]),
    workResponsible: reader.readStringOrNull(offsets[32]),
    workTypeName: reader.readStringOrNull(offsets[33]),
    assetCode: reader.readStringOrNull(offsets[33]),
    locationCode: reader.readStringOrNull(offsets[33]),
  );
  object.id = id;
  return object;
}

P _workOrderModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDoubleOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (reader.readStringOrNull(offset)) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 27:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 28:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readStringOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readStringOrNull(offset)) as P;
    case 35:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workOrderModelGetId(WorkOrderModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workOrderModelGetLinks(WorkOrderModel object) {
  return [];
}

void _workOrderModelAttach(
    IsarCollection<dynamic> col, Id id, WorkOrderModel object) {
  object.id = id;
}

extension WorkOrderModelQueryWhereSort
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QWhere> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkOrderModelQueryWhere
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QWhereClause> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WorkOrderModelQueryFilter
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QFilterCondition> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'actualStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'actualStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'actualStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'actualStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'actualStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      actualStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'actualStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'approvedByName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'approvedByName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'approvedByName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'approvedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'approvedByName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'approvedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      approvedByNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'approvedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      createdDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currentReading',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currentReading',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentReading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentReading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentReading',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      currentReadingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentReading',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      durationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'failureClassName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'failureClassName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'failureClassName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'failureClassName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'failureClassName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'failureClassName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      failureClassNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'failureClassName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isActiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isActiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isActive',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isActiveEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isDeletedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDeleted',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isDeletedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDeleted',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      isDeletedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'jobPlanName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'jobPlanName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobPlanName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobPlanName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobPlanName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobPlanName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      jobPlanNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobPlanName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plannedStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plannedStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plannedStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plannedStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plannedStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      plannedStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plannedStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'preventiveMaintenanceName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'preventiveMaintenanceName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preventiveMaintenanceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preventiveMaintenanceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preventiveMaintenanceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preventiveMaintenanceName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      preventiveMaintenanceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preventiveMaintenanceName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priorityName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priorityName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priorityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priorityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priorityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      priorityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priorityName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'problemName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'problemName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'problemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'problemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'problemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problemName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      problemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'problemName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rejectedByName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rejectedByName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rejectedByName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rejectedByName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rejectedByName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rejectedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      rejectedByNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rejectedByName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serviceRequestCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serviceRequestCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceRequestCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceRequestCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceRequestCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceRequestCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serviceRequestId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serviceRequestId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceRequestId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceRequestId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceRequestId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceRequestId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'serviceRequestName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'serviceRequestName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serviceRequestName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'serviceRequestName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'serviceRequestName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serviceRequestName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      serviceRequestNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'serviceRequestName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'siteId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'siteId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'siteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'siteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'siteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'siteId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      siteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'siteId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stopBeginDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stopBeginDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stopBeginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stopBeginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stopBeginDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      stopBeginDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stopBeginDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetEndDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetEndDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetEndDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetEndDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'targetStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'targetStartDate',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      targetStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workOrderCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workOrderCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workOrderCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workOrderCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workOrderCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workOrderCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workOrderId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workOrderId',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workOrderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workOrderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workOrderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workOrderId',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workOrderName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workOrderName',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workOrderName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workOrderName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workOrderName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workOrderName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workOrderNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workOrderName',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workResponsible',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workResponsible',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workResponsible',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workResponsible',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workResponsible',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workResponsible',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workResponsibleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workResponsible',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'workType',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'workType',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'workType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'workType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'workType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'workType',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      workTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'workType',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assetCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assetCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      assetCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locationCode',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locationCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locationCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locationCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locationCode',
        value: '',
      ));
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterFilterCondition>
      locationCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locationCode',
        value: '',
      ));
    });
  }
}

extension WorkOrderModelQueryObject
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QFilterCondition> {}

extension WorkOrderModelQueryLinks
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QFilterCondition> {}

extension WorkOrderModelQuerySortBy
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QSortBy> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByActualEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByActualEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByActualStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByActualStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByApprovedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedByName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByApprovedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedByName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByAssetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByAssetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByAssetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByAssetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByCurrentReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReading', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByCurrentReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReading', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByFailureClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureClassName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByFailureClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureClassName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByJobPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPlanName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByJobPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPlanName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPlannedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPlannedEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPlannedStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPlannedStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPreventiveMaintenanceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMaintenanceName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPreventiveMaintenanceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMaintenanceName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPriorityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByPriorityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByProblemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByProblemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByRejectedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedByName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByRejectedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedByName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestCode', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByServiceRequestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortBySiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortBySiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByStopBeginDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopBeginDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByStopBeginDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopBeginDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByTargetEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByTargetEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByTargetStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByTargetStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderCode', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkOrderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkResponsible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workResponsible', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkResponsibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workResponsible', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> sortByWorkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workType', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      sortByWorkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workType', Sort.desc);
    });
  }
}

extension WorkOrderModelQuerySortThenBy
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QSortThenBy> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByActualEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByActualEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByActualStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByActualStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'actualStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByApprovedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedByName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByApprovedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'approvedByName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByAssetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByAssetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByAssetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByAssetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByCreatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByCurrentReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReading', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByCurrentReadingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentReading', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByFailureClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureClassName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByFailureClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'failureClassName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByJobPlanName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPlanName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByJobPlanNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobPlanName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPlannedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPlannedEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPlannedStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPlannedStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPreventiveMaintenanceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMaintenanceName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPreventiveMaintenanceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preventiveMaintenanceName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPriorityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByPriorityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priorityName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByProblemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByProblemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problemName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByRejectedByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedByName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByRejectedByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rejectedByName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestCode', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByServiceRequestNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serviceRequestName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenBySiteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenBySiteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'siteId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByStopBeginDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopBeginDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByStopBeginDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stopBeginDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByTargetEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetEndDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByTargetEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetEndDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByTargetStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetStartDate', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByTargetStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetStartDate', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderCode', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderId', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderId', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderName', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkOrderNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workOrderName', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkResponsible() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workResponsible', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkResponsibleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workResponsible', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByWorkType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workType', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByWorkTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'workType', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy> thenByAssetCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByAssetCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetCode', Sort.desc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.asc);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QAfterSortBy>
      thenByLocationCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locationCode', Sort.desc);
    });
  }
}

extension WorkOrderModelQueryWhereDistinct
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> {
  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByActualEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByActualStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'actualStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByApprovedByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'approvedByName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByAssetId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByAssetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByCreatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByCurrentReading() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentReading');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByFailureClassName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'failureClassName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByJobPlanName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobPlanName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByLocationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByLocationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByPlannedEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByPlannedStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByPreventiveMaintenanceName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preventiveMaintenanceName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByPriorityName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priorityName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByProblemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByRejectedByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rejectedByName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByServiceRequestCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceRequestCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByServiceRequestId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceRequestId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByServiceRequestName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serviceRequestName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctBySiteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'siteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByStopBeginDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stopBeginDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByTargetEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByTargetStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByWorkOrderCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workOrderCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByWorkOrderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workOrderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByWorkOrderName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workOrderName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByWorkResponsible({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workResponsible',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByWorkType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'workType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct> distinctByAssetCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WorkOrderModel, WorkOrderModel, QDistinct>
      distinctByLocationCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locationCode', caseSensitive: caseSensitive);
    });
  }
}

extension WorkOrderModelQueryProperty
    on QueryBuilder<WorkOrderModel, WorkOrderModel, QQueryProperty> {
  QueryBuilder<WorkOrderModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      actualEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      actualStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'actualStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      approvedByNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'approvedByName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> assetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetId');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> assetNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetName');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      createdDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdDate');
    });
  }

  QueryBuilder<WorkOrderModel, double?, QQueryOperations>
      currentReadingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentReading');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<WorkOrderModel, double?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      failureClassNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'failureClassName');
    });
  }

  QueryBuilder<WorkOrderModel, bool?, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<WorkOrderModel, bool?, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      jobPlanNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobPlanName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> locationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationId');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      locationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationName');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      plannedEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      plannedStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      preventiveMaintenanceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preventiveMaintenanceName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      priorityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priorityName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      problemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problemName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      rejectedByNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rejectedByName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      serviceRequestCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceRequestCode');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      serviceRequestIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceRequestId');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      serviceRequestNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serviceRequestName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> siteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'siteId');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      stopBeginDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stopBeginDate');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      targetEndDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetEndDate');
    });
  }

  QueryBuilder<WorkOrderModel, DateTime?, QQueryOperations>
      targetStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetStartDate');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      workOrderCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workOrderCode');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      workOrderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workOrderId');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      workOrderNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workOrderName');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      workResponsibleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workResponsible');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> workTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'workType');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations> assetCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetCode');
    });
  }

  QueryBuilder<WorkOrderModel, String?, QQueryOperations>
      locationCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locationCode');
    });
  }
}

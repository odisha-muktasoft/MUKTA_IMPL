// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mb_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MBDetailResponse _$$_MBDetailResponseFromJson(Map<String, dynamic> json) =>
    _$_MBDetailResponse(
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
      estimate: json['estimate'] == null
          ? null
          : Estimate.fromJson(json['estimate'] as Map<String, dynamic>),
      period: json['period'] == null
          ? null
          : Period.fromJson(json['period'] as Map<String, dynamic>),
      allMeasurements: (json['allMeasurements'] as List<dynamic>?)
          ?.map((e) => Measurement.fromJson(e as Map<String, dynamic>))
          .toList(),
      measurement: json['measurement'] == null
          ? null
          : Measurement.fromJson(json['measurement'] as Map<String, dynamic>),
      musterRolls: json['musterRolls'],
    );

Map<String, dynamic> _$$_MBDetailResponseToJson(_$_MBDetailResponse instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'estimate': instance.estimate,
      'period': instance.period,
      'allMeasurements': instance.allMeasurements,
      'measurement': instance.measurement,
      'musterRolls': instance.musterRolls,
    };

_$_WorkFlow _$$_WorkFlowFromJson(Map<String, dynamic> json) => _$_WorkFlow(
      action: json['action'] as String?,
      comment: json['comment'] as String?,
      assignees: (json['assignees'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_WorkFlowToJson(_$_WorkFlow instance) =>
    <String, dynamic>{
      'action': instance.action,
      'comment': instance.comment,
      'assignees': instance.assignees,
    };

_$_MusterRoll _$$_MusterRollFromJson(Map<String, dynamic> json) =>
    _$_MusterRoll(
      id: json['id'] as String?,
      tenantId: json['tenantId'] as String?,
      musterRollNumber: json['musterRollNumber'],
      registerId: json['registerId'] as String?,
      status: json['status'] as String?,
      musterRollStatus: json['musterRollStatus'] as String?,
      startDate: json['startDate'] as int?,
      endDate: json['endDate'] as int?,
      referenceId: json['referenceId'] as String?,
      serviceCode: json['serviceCode'] as String?,
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
      additional: json['additionalDetails'] == null
          ? null
          : MusterRollAdditionalDetails.fromJson(
              json['additionalDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MusterRollToJson(_$_MusterRoll instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'musterRollNumber': instance.musterRollNumber,
      'registerId': instance.registerId,
      'status': instance.status,
      'musterRollStatus': instance.musterRollStatus,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'referenceId': instance.referenceId,
      'serviceCode': instance.serviceCode,
      'auditDetails': instance.auditDetails,
      'additionalDetails': instance.additional,
    };

_$_MusterRollAdditionalDetails _$$_MusterRollAdditionalDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_MusterRollAdditionalDetails(
      ward: json['ward'] as String?,
      orgId: json['orgId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      orgName: json['orgName'] as String?,
      locality: json['locality'] as String?,
      projectId: json['projectId'] as String?,
      contractId: json['contractId'] as String?,
      projectDesc: json['projectDesc'] as String?,
      projectName: json['projectName'] as String?,
      projectType: json['projectType'] as String?,
      executingAuthority: json['executingAuthority'] as String?,
      attendanceRegisterNo: json['attendanceRegisterNo'] as String?,
      attendanceRegisterName: json['attendanceRegisterName'] as String?,
    );

Map<String, dynamic> _$$_MusterRollAdditionalDetailsToJson(
        _$_MusterRollAdditionalDetails instance) =>
    <String, dynamic>{
      'ward': instance.ward,
      'orgId': instance.orgId,
      'amount': instance.amount,
      'orgName': instance.orgName,
      'locality': instance.locality,
      'projectId': instance.projectId,
      'contractId': instance.contractId,
      'projectDesc': instance.projectDesc,
      'projectName': instance.projectName,
      'projectType': instance.projectType,
      'executingAuthority': instance.executingAuthority,
      'attendanceRegisterNo': instance.attendanceRegisterNo,
      'attendanceRegisterName': instance.attendanceRegisterName,
    };

_$_Measurement _$$_MeasurementFromJson(Map<String, dynamic> json) =>
    _$_Measurement(
      id: json['id'] as String?,
      tenantId: json['tenantId'] as String?,
      measurementNumber: json['measurementNumber'] as String?,
      physicalRefNumber: json['physicalRefNumber'] as String?,
      referenceId: json['referenceId'] as String?,
      entryDate: json['entryDate'] as int?,
      isActive: json['isActive'] as bool?,
      wfStatus: json['wfStatus'] as String?,
      workflow: json['workflow'] == null
          ? null
          : WorkFlow.fromJson(json['workflow'] as Map<String, dynamic>),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
      additionalDetail: json['additionalDetails'] == null
          ? null
          : MeasurementAdditionalDetail.fromJson(
              json['additionalDetails'] as Map<String, dynamic>),
      measures: (json['measures'] as List<dynamic>?)
          ?.map((e) => Measure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MeasurementToJson(_$_Measurement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'measurementNumber': instance.measurementNumber,
      'physicalRefNumber': instance.physicalRefNumber,
      'referenceId': instance.referenceId,
      'entryDate': instance.entryDate,
      'isActive': instance.isActive,
      'wfStatus': instance.wfStatus,
      'workflow': instance.workflow,
      'auditDetails': instance.auditDetails,
      'additionalDetails': instance.additionalDetail,
      'measures': instance.measures,
    };

_$_MeasurementAdditionalDetail _$$_MeasurementAdditionalDetailFromJson(
        Map<String, dynamic> json) =>
    _$_MeasurementAdditionalDetail(
      endDate: json['endDate'] as int?,
      sorAmount: (json['sorAmount'] as num?)?.toDouble(),
      startDate: json['startDate'] as int?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      nonSorAmount: (json['nonSorAmount'] as num?)?.toDouble(),
      musterRollNumber: json['musterRollNumber'],
    );

Map<String, dynamic> _$$_MeasurementAdditionalDetailToJson(
        _$_MeasurementAdditionalDetail instance) =>
    <String, dynamic>{
      'endDate': instance.endDate,
      'sorAmount': instance.sorAmount,
      'startDate': instance.startDate,
      'totalAmount': instance.totalAmount,
      'nonSorAmount': instance.nonSorAmount,
      'musterRollNumber': instance.musterRollNumber,
    };

_$_Period _$$_PeriodFromJson(Map<String, dynamic> json) => _$_Period(
      startDate: json['startDate'] as int?,
      endDate: json['endDate'] as int?,
    );

Map<String, dynamic> _$$_PeriodToJson(_$_Period instance) => <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_$_Estimate _$$_EstimateFromJson(Map<String, dynamic> json) => _$_Estimate(
      id: json['id'] as String?,
      tenantId: json['tenantId'] as String?,
      estimateNumber: json['estimateNumber'] as String?,
      revisionNumber: json['revisionNumber'] as String?,
      businessService: json['businessService'] as String?,
      oldUuid: json['oldUuid'] as String?,
      projectId: json['projectId'] as String?,
      versionNumber: json['versionNumber'] as int?,
      proposalDate: json['proposalDate'] as int?,
      status: json['status'] as String?,
      wfStatus: json['wfStatus'] as String?,
      name: json['name'] as String?,
      referenceNumber: json['referenceNumber'] as String?,
      description: json['description'] as String?,
      executingDepartment: json['executingDepartment'] as String?,
      address: json['address'] == null
          ? null
          : EstimateAddress.fromJson(json['address'] as Map<String, dynamic>),
      estimateDetails: (json['estimateDetails'] as List<dynamic>?)
          ?.map((e) => EstimateDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_EstimateToJson(_$_Estimate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'estimateNumber': instance.estimateNumber,
      'revisionNumber': instance.revisionNumber,
      'businessService': instance.businessService,
      'oldUuid': instance.oldUuid,
      'projectId': instance.projectId,
      'versionNumber': instance.versionNumber,
      'proposalDate': instance.proposalDate,
      'status': instance.status,
      'wfStatus': instance.wfStatus,
      'name': instance.name,
      'referenceNumber': instance.referenceNumber,
      'description': instance.description,
      'executingDepartment': instance.executingDepartment,
      'address': instance.address,
      'estimateDetails': instance.estimateDetails,
      'auditDetails': instance.auditDetails,
    };

_$_EstimateDetail _$$_EstimateDetailFromJson(Map<String, dynamic> json) =>
    _$_EstimateDetail(
      id: json['id'] as String?,
      previousLineItemId: json['previousLineItemId'] as String?,
      sorId: json['sorId'] as String?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      unitRate: (json['unitRate'] as num?)?.toDouble(),
      noOfunit: json['noOfunit'] as int?,
      uom: json['uom'] as String?,
      uomValue: (json['uomValue'] as num?)?.toDouble(),
      length: json['length'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      quantity: json['quantity'] as int?,
      isDeduction: json['isDeduction'] as bool?,
      isActive: json['isActive'] as bool?,
      amountDetails: (json['amountDetail'] as List<dynamic>?)
          ?.map((e) => AmoutDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EstimateDetailToJson(_$_EstimateDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'previousLineItemId': instance.previousLineItemId,
      'sorId': instance.sorId,
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
      'unitRate': instance.unitRate,
      'noOfunit': instance.noOfunit,
      'uom': instance.uom,
      'uomValue': instance.uomValue,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'quantity': instance.quantity,
      'isDeduction': instance.isDeduction,
      'isActive': instance.isActive,
      'amountDetail': instance.amountDetails,
    };

_$_AmoutDetail _$$_AmoutDetailFromJson(Map<String, dynamic> json) =>
    _$_AmoutDetail(
      type: json['type'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      id: json['id'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$_AmoutDetailToJson(_$_AmoutDetail instance) =>
    <String, dynamic>{
      'type': instance.type,
      'amount': instance.amount,
      'id': instance.id,
      'isActive': instance.isActive,
    };

_$_EstimateAddress _$$_EstimateAddressFromJson(Map<String, dynamic> json) =>
    _$_EstimateAddress(
      id: json['id'] as String?,
      tenantId: json['tenantId'] as String?,
      doorNo: json['doorNo'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationAccuracy: (json['locationAccuracy'] as num?)?.toDouble(),
      type: json['type'] as String?,
      addressNumber: json['addressNumber'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      landmark: json['landmark'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$_EstimateAddressToJson(_$_EstimateAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'doorNo': instance.doorNo,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationAccuracy': instance.locationAccuracy,
      'type': instance.type,
      'addressNumber': instance.addressNumber,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'landmark': instance.landmark,
      'city': instance.city,
    };

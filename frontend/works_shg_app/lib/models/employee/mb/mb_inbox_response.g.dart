// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mb_inbox_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MBInboxResponse _$$_MBInboxResponseFromJson(Map<String, dynamic> json) =>
    _$_MBInboxResponse(
      totalCount: json['totalCount'] as int?,
      nearingSlaCount: json['nearingSlaCount'] as int?,
      statusMap: (json['statusMap'] as List<dynamic>?)
          ?.map((e) => StatusMap.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MBInboxResponseToJson(_$_MBInboxResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nearingSlaCount': instance.nearingSlaCount,
      'statusMap': instance.statusMap,
      'items': instance.items,
    };

_$_StatusMap _$$_StatusMapFromJson(Map<String, dynamic> json) => _$_StatusMap(
      statusid: json['statusid'] as String?,
      count: json['count'] as int?,
      state: json['state'] as String?,
      applicationstatus: json['applicationstatus'] as String?,
      businessservice: json['businessservice'] as String?,
    );

Map<String, dynamic> _$$_StatusMapToJson(_$_StatusMap instance) =>
    <String, dynamic>{
      'statusid': instance.statusid,
      'count': instance.count,
      'state': instance.state,
      'applicationstatus': instance.applicationstatus,
      'businessservice': instance.businessservice,
    };

_$_ItemData _$$_ItemDataFromJson(Map<String, dynamic> json) => _$_ItemData(
      processInstance: json['ProcessInstance'] == null
          ? null
          : ProcessInstance.fromJson(
              json['ProcessInstance'] as Map<String, dynamic>),
      businessObject: json['businessObject'] == null
          ? null
          : BusinessObject.fromJson(
              json['businessObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ItemDataToJson(_$_ItemData instance) =>
    <String, dynamic>{
      'ProcessInstance': instance.processInstance,
      'businessObject': instance.businessObject,
    };

_$_ProcessInstance _$$_ProcessInstanceFromJson(Map<String, dynamic> json) =>
    _$_ProcessInstance(
      id: json['id'] as String?,
      tenantId: json['tenantId'] as String?,
      businessService: json['businessService'] as String?,
      businessId: json['businessId'] as String?,
      action: json['action'] as String?,
      moduleName: json['moduleName'] as String?,
      businesssServiceSla: json['businesssServiceSla'] as int?,
      rating: json['rating'] as int?,
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
      assigner: json['assigner'] == null
          ? null
          : Assigner.fromJson(json['assigner'] as Map<String, dynamic>),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProcessInstanceToJson(_$_ProcessInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'businessService': instance.businessService,
      'businessId': instance.businessId,
      'action': instance.action,
      'moduleName': instance.moduleName,
      'businesssServiceSla': instance.businesssServiceSla,
      'rating': instance.rating,
      'state': instance.state,
      'assigner': instance.assigner,
      'auditDetails': instance.auditDetails,
    };

_$_AuditDetails _$$_AuditDetailsFromJson(Map<String, dynamic> json) =>
    _$_AuditDetails(
      createdBy: json['createdBy'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      createdTime: json['createdTime'] as int?,
      lastModifiedTime: json['lastModifiedTime'] as int?,
    );

Map<String, dynamic> _$$_AuditDetailsToJson(_$_AuditDetails instance) =>
    <String, dynamic>{
      'createdBy': instance.createdBy,
      'lastModifiedBy': instance.lastModifiedBy,
      'createdTime': instance.createdTime,
      'lastModifiedTime': instance.lastModifiedTime,
    };

_$_State _$$_StateFromJson(Map<String, dynamic> json) => _$_State(
      uuid: json['uuid'] as String?,
      tenantId: json['tenantId'] as String?,
      businessServiceId: json['businessServiceId'] as String?,
      sla: json['sla'] as int?,
      state: json['state'] as String?,
      applicationStatus: json['applicationStatus'] as String?,
      docUploadRequired: json['docUploadRequired'] as bool?,
      isStartState: json['isStartState'] as bool?,
      isTerminateState: json['isTerminateState'] as bool?,
      isStateUpdatable: json['isStateUpdatable'] as bool?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StateToJson(_$_State instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'tenantId': instance.tenantId,
      'businessServiceId': instance.businessServiceId,
      'sla': instance.sla,
      'state': instance.state,
      'applicationStatus': instance.applicationStatus,
      'docUploadRequired': instance.docUploadRequired,
      'isStartState': instance.isStartState,
      'isTerminateState': instance.isTerminateState,
      'isStateUpdatable': instance.isStateUpdatable,
      'actions': instance.actions,
    };

_$_Action _$$_ActionFromJson(Map<String, dynamic> json) => _$_Action(
      uuid: json['uuid'] as String?,
      tenantId: json['tenantId'] as String?,
      currentState: json['currentState'] as String?,
      action: json['action'] as String?,
      nextState: json['nextState'] as String?,
      active: json['active'] as bool?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_ActionToJson(_$_Action instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'tenantId': instance.tenantId,
      'currentState': instance.currentState,
      'action': instance.action,
      'nextState': instance.nextState,
      'active': instance.active,
      'roles': instance.roles,
    };

_$_Assigner _$$_AssignerFromJson(Map<String, dynamic> json) => _$_Assigner(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailId: json['emailId'] as String?,
      tenantId: json['tenantId'] as String?,
      uuid: json['uuid'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AssignerToJson(_$_Assigner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'name': instance.name,
      'type': instance.type,
      'mobileNumber': instance.mobileNumber,
      'emailId': instance.emailId,
      'tenantId': instance.tenantId,
      'uuid': instance.uuid,
      'roles': instance.roles,
    };

_$_Role _$$_RoleFromJson(Map<String, dynamic> json) => _$_Role(
      name: json['name'] as String?,
      id: json['id'] as String?,
      code: json['code'] as String?,
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$$_RoleToJson(_$_Role instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'code': instance.code,
      'tenantId': instance.tenantId,
    };

_$_BusinessObject _$$_BusinessObjectFromJson(Map<String, dynamic> json) =>
    _$_BusinessObject(
      measurementNumber: json['measurementNumber'] as String?,
      id: json['id'] as String?,
      referenceId: json['referenceId'] as String?,
      measures: (json['measures'] as List<dynamic>?)
          ?.map((e) => Measure.fromJson(e as Map<String, dynamic>))
          .toList(),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
      contract: json['contract'] == null
          ? null
          : Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BusinessObjectToJson(_$_BusinessObject instance) =>
    <String, dynamic>{
      'measurementNumber': instance.measurementNumber,
      'id': instance.id,
      'referenceId': instance.referenceId,
      'measures': instance.measures,
      'auditDetails': instance.auditDetails,
      'contract': instance.contract,
    };

_$_Measure _$$_MeasureFromJson(Map<String, dynamic> json) => _$_Measure(
      comments: json['comments'] as String?,
      targetId: json['targetId'] as String?,
      breadth: (json['breadth'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool?,
      referenceId: json['referenceId'] as String?,
      numItems: (json['numItems'] as num?)?.toDouble(),
      id: json['id'] as String?,
      currentValue: (json['currentValue'] as num?)?.toDouble(),
      cumulativeValue: json['cumulativeValue'] as int?,
      height: (json['height'] as num?)?.toDouble(),
      measureAdditionalDetails: json['additionalDetails'] == null
          ? null
          : MeasureAdditionalDetails.fromJson(
              json['additionalDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MeasureToJson(_$_Measure instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'targetId': instance.targetId,
      'breadth': instance.breadth,
      'length': instance.length,
      'isActive': instance.isActive,
      'referenceId': instance.referenceId,
      'numItems': instance.numItems,
      'id': instance.id,
      'currentValue': instance.currentValue,
      'cumulativeValue': instance.cumulativeValue,
      'height': instance.height,
      'additionalDetails': instance.measureAdditionalDetails,
    };

_$_MeasureAdditionalDetails _$$_MeasureAdditionalDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_MeasureAdditionalDetails(
      type: json['type'] as String?,
      mbAmount: (json['mbAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MeasureAdditionalDetailsToJson(
        _$_MeasureAdditionalDetails instance) =>
    <String, dynamic>{
      'type': instance.type,
      'mbAmount': instance.mbAmount,
    };

_$_Contract _$$_ContractFromJson(Map<String, dynamic> json) => _$_Contract(
      contractNumber: json['contractNumber'] as String?,
      id: json['id'] as String?,
      additionalDetails: json['additionalDetails'] == null
          ? null
          : ContractAdditionalDetails.fromJson(
              json['additionalDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContractToJson(_$_Contract instance) =>
    <String, dynamic>{
      'contractNumber': instance.contractNumber,
      'id': instance.id,
      'additionalDetails': instance.additionalDetails,
    };

_$_ContractAdditionalDetails _$$_ContractAdditionalDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_ContractAdditionalDetails(
      orgName: json['orgName'] as String?,
      totalEstimatedAmount: (json['totalEstimatedAmount'] as num?)?.toDouble(),
      attendanceRegisterNumber: json['attendanceRegisterNumber'] as String?,
      officerInChargeId: json['officerInChargeId'] as String?,
      cboOrgNumber: json['cboOrgNumber'] as String?,
      estimateNumber: json['estimateNumber'] as String?,
      locality: json['locality'] as String?,
      projectType: json['projectType'] as String?,
      timeExtReason: json['timeExtReason'] as String?,
      ward: json['ward'] as String?,
      officerInChargeDesgn: json['officerInChargeDesgn'] as String?,
      projectDesc: json['projectDesc'] as String?,
      projectName: json['projectName'] as String?,
      cboCode: json['cboCode'] as String?,
      projectId: json['projectId'] as String?,
      cboName: json['cboName'] as String?,
    );

Map<String, dynamic> _$$_ContractAdditionalDetailsToJson(
        _$_ContractAdditionalDetails instance) =>
    <String, dynamic>{
      'orgName': instance.orgName,
      'totalEstimatedAmount': instance.totalEstimatedAmount,
      'attendanceRegisterNumber': instance.attendanceRegisterNumber,
      'officerInChargeId': instance.officerInChargeId,
      'cboOrgNumber': instance.cboOrgNumber,
      'estimateNumber': instance.estimateNumber,
      'locality': instance.locality,
      'projectType': instance.projectType,
      'timeExtReason': instance.timeExtReason,
      'ward': instance.ward,
      'officerInChargeDesgn': instance.officerInChargeDesgn,
      'projectDesc': instance.projectDesc,
      'projectName': instance.projectName,
      'cboCode': instance.cboCode,
      'projectId': instance.projectId,
      'cboName': instance.cboName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wo_inbox_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WOInboxResponse _$$_WOInboxResponseFromJson(Map<String, dynamic> json) =>
    _$_WOInboxResponse(
      totalCount: json['totalCount'] as int?,
      nearingSlaCount: json['nearingSlaCount'] as int?,
      statusMap: (json['statusMap'] as List<dynamic>?)
          ?.map((e) => StatusMap.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => WOItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WOInboxResponseToJson(_$_WOInboxResponse instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nearingSlaCount': instance.nearingSlaCount,
      'statusMap': instance.statusMap,
      'items': instance.items,
    };

_$_WOItemData _$$_WOItemDataFromJson(Map<String, dynamic> json) =>
    _$_WOItemData(
      processInstance: json['ProcessInstance'] == null
          ? null
          : ProcessInstance.fromJson(
              json['ProcessInstance'] as Map<String, dynamic>),
      woBusinessObject: json['businessObject'] == null
          ? null
          : WOBusinessObject.fromJson(
              json['businessObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WOItemDataToJson(_$_WOItemData instance) =>
    <String, dynamic>{
      'ProcessInstance': instance.processInstance,
      'businessObject': instance.woBusinessObject,
    };

_$_WOBusinessObject _$$_WOBusinessObjectFromJson(Map<String, dynamic> json) =>
    _$_WOBusinessObject(
      totalContractedAmount:
          (json['totalContractedAmount'] as num?)?.toDouble(),
      businessService: json['businessService'] as String?,
      contractNumber: json['contractNumber'] as String?,
      serviceSla: json['serviceSla'] as int?,
      woAdditionalDetails: json['additionalDetails'] == null
          ? null
          : WOAdditionalDetails.fromJson(
              json['additionalDetails'] as Map<String, dynamic>),
      auditDetails: json['auditDetails'] == null
          ? null
          : AuditDetails.fromJson(json['auditDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WOBusinessObjectToJson(_$_WOBusinessObject instance) =>
    <String, dynamic>{
      'totalContractedAmount': instance.totalContractedAmount,
      'businessService': instance.businessService,
      'contractNumber': instance.contractNumber,
      'serviceSla': instance.serviceSla,
      'additionalDetails': instance.woAdditionalDetails,
      'auditDetails': instance.auditDetails,
    };

_$_WOAdditionalDetails _$$_WOAdditionalDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_WOAdditionalDetails(
      orgName: json['orgName'] as String?,
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
    );

Map<String, dynamic> _$$_WOAdditionalDetailsToJson(
        _$_WOAdditionalDetails instance) =>
    <String, dynamic>{
      'orgName': instance.orgName,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
    };

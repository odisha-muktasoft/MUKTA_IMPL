import 'package:freezed_annotation/freezed_annotation.dart';

part 'mb_inbox_response.freezed.dart';
part 'mb_inbox_response.g.dart';

@freezed
class MBInboxResponse with _$MBInboxResponse {
  const factory MBInboxResponse(
      {@JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'nearingSlaCount') int? nearingSlaCount,
      @JsonKey(name: 'statusMap') List<StatusMap>? statusMap,
      @JsonKey(name: 'items') List<ItemData>? items}) = _MBInboxResponse;

  factory MBInboxResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MBInboxResponseFromJson(json);
}

@freezed
class StatusMap with _$StatusMap {
  const factory StatusMap({
    @JsonKey(name: 'statusid') String? statusid,
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'applicationstatus') String? applicationstatus,
    @JsonKey(name: 'businessservice') String? businessservice,
  }) = _StatusMap;

  factory StatusMap.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StatusMapFromJson(json);
}

@freezed
class ItemData with _$ItemData {
  const factory ItemData({
    @JsonKey(name: 'ProcessInstance') ProcessInstance? processInstance,
    @JsonKey(name: 'businessObject') BusinessObject? businessObject,
  }) = _ItemData;

  factory ItemData.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ItemDataFromJson(json);
}

@freezed
class ProcessInstance with _$ProcessInstance {
  const factory ProcessInstance(
          {@JsonKey(name: 'id') String? id,
          @JsonKey(name: 'tenantId') String? tenantId,
          @JsonKey(name: 'businessService') String? businessService,
          @JsonKey(name: 'businessId') String? businessId,
          @JsonKey(name: 'action') String? action,
          @JsonKey(name: 'moduleName') String? moduleName,
          @JsonKey(name: 'businesssServiceSla') int? businesssServiceSla,
          @JsonKey(name: 'rating') int? rating,
          @JsonKey(name: 'state') State? state,
          @JsonKey(name: 'assigner') Assigner? assigner,
          @JsonKey(name: 'auditDetails') AuditDetails? auditDetails}) =
      _ProcessInstance;

  factory ProcessInstance.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProcessInstanceFromJson(json);
}

@freezed
class AuditDetails with _$AuditDetails {
  const factory AuditDetails(
      {String? createdBy,
      String? lastModifiedBy,
      int? createdTime,
      int? lastModifiedTime}) = _AuditDetails;

  factory AuditDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AuditDetailsFromJson(json);
}

@freezed
class State with _$State {
  const factory State({
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'tenantId') String? tenantId,
    @JsonKey(name: 'businessServiceId') String? businessServiceId,
    @JsonKey(name: 'sla') int? sla,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'applicationStatus') String? applicationStatus,
    @JsonKey(name: 'docUploadRequired') bool? docUploadRequired,
    @JsonKey(name: 'isStartState') bool? isStartState,
    @JsonKey(name: 'isTerminateState') bool? isTerminateState,
    @JsonKey(name: 'isStateUpdatable') bool? isStateUpdatable,
    @JsonKey(name: 'actions') List<Action>? actions,
  }) = _State;

  factory State.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StateFromJson(json);
}

@freezed
class Action with _$Action {
  const factory Action({
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'tenantId') String? tenantId,
    @JsonKey(name: 'currentState') String? currentState,
    @JsonKey(name: 'action') String? action,
    @JsonKey(name: 'nextState') String? nextState,
    @JsonKey(name: 'active') bool? active,
    @JsonKey(name: 'roles') List<String>? roles,
  }) = _Action;

  factory Action.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ActionFromJson(json);
}

@freezed
class Assigner with _$Assigner {
  const factory Assigner({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'userName') String? userName,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'mobileNumber') String? mobileNumber,
    @JsonKey(name: 'emailId') String? emailId,
    @JsonKey(name: 'tenantId') String? tenantId,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'roles') List<Role>? roles,
  }) = _Assigner;

  factory Assigner.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AssignerFromJson(json);
}

@freezed
class Role with _$Role {
  const factory Role(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'tenantId') String? tenantId}) = _Role;

  factory Role.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RoleFromJson(json);
}

@freezed
class BusinessObject with _$BusinessObject {
  const factory BusinessObject(
      {@JsonKey(name: 'measurementNumber') String? measurementNumber,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'referenceId') String? referenceId,
      @JsonKey(name: 'measures') List<Measure>? measures,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails,
      @JsonKey(name: 'contract') Contract? contract,

      }) = _BusinessObject;

  factory BusinessObject.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$BusinessObjectFromJson(json);
}

@freezed
class Measure with _$Measure {
  const factory Measure(
      {@JsonKey(name: 'comments')
          String? comments,
      @JsonKey(name: 'targetId')
          String? targetId,
      @JsonKey(name: 'breadth')
          double? breadth,
      @JsonKey(name: 'length')
          double? length,
      @JsonKey(name: 'isActive')
          bool? isActive,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'numItems')
          double? numItems,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'currentValue')
          double? currentValue,
      @JsonKey(name: 'cumulativeValue')
          int? cumulativeValue,
      @JsonKey(name: 'height')
          double? height,
      @JsonKey(name: 'additionalDetails')
          MeasureAdditionalDetails? measureAdditionalDetails,}) = _Measure;

  factory Measure.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MeasureFromJson(json);
}

@freezed
class MeasureAdditionalDetails with _$MeasureAdditionalDetails {
  const factory MeasureAdditionalDetails({
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'mbAmount') double? mbAmount,
  }) = _MeasureAdditionalDetails;

  factory MeasureAdditionalDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MeasureAdditionalDetailsFromJson(json);
}



@freezed
class Contract with _$Contract {
  const factory Contract({
    @JsonKey(name: 'contractNumber') String? contractNumber,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'additionalDetails') ContractAdditionalDetails? additionalDetails
  }) = _Contract;

  factory Contract.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ContractFromJson(json);
}



@freezed
class ContractAdditionalDetails with _$ContractAdditionalDetails {
  const factory ContractAdditionalDetails({
    @JsonKey(name: 'orgName') String? orgName,
    @JsonKey(name: 'totalEstimatedAmount') double? totalEstimatedAmount,
    @JsonKey(name: 'attendanceRegisterNumber') String? attendanceRegisterNumber,
    @JsonKey(name: 'officerInChargeId') String? officerInChargeId,
    @JsonKey(name: 'cboOrgNumber') String? cboOrgNumber,
    @JsonKey(name: 'estimateNumber')String? estimateNumber,
    @JsonKey(name: 'locality') String? locality,
    @JsonKey(name: 'projectType')String? projectType,
    @JsonKey(name: 'timeExtReason')String? timeExtReason,
    @JsonKey(name: 'ward') String? ward,

    @JsonKey(name: 'officerInChargeDesgn') String? officerInChargeDesgn,
     @JsonKey(name: 'projectDesc') String? projectDesc,
      @JsonKey(name: 'projectName') String? projectName,
       @JsonKey(name: 'cboCode') String? cboCode,
        @JsonKey(name: 'projectId') String? projectId,
          @JsonKey(name: 'cboName') String? cboName,
        


  }) = _ContractAdditionalDetails;

  factory ContractAdditionalDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ContractAdditionalDetailsFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModuleStatus _$$_ModuleStatusFromJson(Map<String, dynamic> json) =>
    _$_ModuleStatus(
      status: Map<String, bool>.from(json['status'] as Map),
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_ModuleStatusToJson(_$_ModuleStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'label': instance.label,
      'value': instance.value,
    };

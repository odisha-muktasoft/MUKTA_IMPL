// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModuleStatus _$$_ModuleStatusFromJson(Map<String, dynamic> json) =>
    _$_ModuleStatus(
      status: Map<String, bool>.from(json['status'] as Map),
      isEng: json['isEng'] as bool,
      label: json['label'] as String,
      value: json['value'] as String,
      isOdia: json['isOdia'] as bool,
    );

Map<String, dynamic> _$$_ModuleStatusToJson(_$_ModuleStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'isEng': instance.isEng,
      'label': instance.label,
      'value': instance.value,
      'isOdia': instance.isOdia,
    };

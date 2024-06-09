// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mb_project_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MBProjectType _$$_MBProjectTypeFromJson(Map<String, dynamic> json) =>
    _$_MBProjectType(
      mdmsRes: json['MdmsRes'] == null
          ? null
          : MdmsRes.fromJson(json['MdmsRes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MBProjectTypeToJson(_$_MBProjectType instance) =>
    <String, dynamic>{
      'MdmsRes': instance.mdmsRes,
    };

_$_MdmsRes _$$_MdmsResFromJson(Map<String, dynamic> json) => _$_MdmsRes(
      mbWorks: json['works'] == null
          ? null
          : MBWorks.fromJson(json['works'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MdmsResToJson(_$_MdmsRes instance) =>
    <String, dynamic>{
      'works': instance.mbWorks,
    };

_$_MBWorks _$$_MBWorksFromJson(Map<String, dynamic> json) => _$_MBWorks(
      projectType: (json['ProjectType'] as List<dynamic>?)
          ?.map((e) => ProjectType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MBWorksToJson(_$_MBWorks instance) =>
    <String, dynamic>{
      'ProjectType': instance.projectType,
    };

_$_ProjectType _$$_ProjectTypeFromJson(Map<String, dynamic> json) =>
    _$_ProjectType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$$_ProjectTypeToJson(_$_ProjectType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'active': instance.active,
    };

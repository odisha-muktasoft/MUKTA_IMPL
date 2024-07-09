// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SkillsList _$$_SkillsListFromJson(Map<String, dynamic> json) =>
    _$_SkillsList(
      wageSeekerSkills: (json['SOR'] as List<dynamic>?)
          ?.map((e) => WageSeekerSkills.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SkillsListToJson(_$_SkillsList instance) =>
    <String, dynamic>{
      'SOR': instance.wageSeekerSkills,
    };

_$_WageSeekerSkills _$$_WageSeekerSkillsFromJson(Map<String, dynamic> json) =>
    _$_WageSeekerSkills(
      json['code'] as String?,
      json['amount'] as int?,
      json['active'] as bool?,
      json['description'] as String?,
      json['id'] as String?,
    );

Map<String, dynamic> _$$_WageSeekerSkillsToJson(_$_WageSeekerSkills instance) =>
    <String, dynamic>{
      'code': instance.code,
      'amount': instance.amount,
      'active': instance.active,
      'description': instance.description,
      'id': instance.id,
    };

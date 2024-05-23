// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeConfigModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeConfigModel _$$_HomeConfigModelFromJson(Map<String, dynamic> json) =>
    _$_HomeConfigModel(
      homeActions: (json['actions'] as List<dynamic>)
          .map((e) => HomeAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HomeConfigModelToJson(_$_HomeConfigModel instance) =>
    <String, dynamic>{
      'actions': instance.homeActions,
    };

_$_HomeAction _$$_HomeActionFromJson(Map<String, dynamic> json) =>
    _$_HomeAction(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      parentModule: json['parentModule'] as String,
      enabled: json['enabled'] as bool,
      tenantId: json['tenantId'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$_HomeActionToJson(_$_HomeAction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'parentModule': instance.parentModule,
      'enabled': instance.enabled,
      'tenantId': instance.tenantId,
      'url': instance.url,
    };

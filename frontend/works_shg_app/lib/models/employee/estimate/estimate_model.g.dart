// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EstimateDetailResponse _$$_EstimateDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_EstimateDetailResponse(
      estimates: (json['estimates'] as List<dynamic>?)
          ?.map((e) => Estimate.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );

Map<String, dynamic> _$$_EstimateDetailResponseToJson(
        _$_EstimateDetailResponse instance) =>
    <String, dynamic>{
      'estimates': instance.estimates,
      'TotalCount': instance.totalCount,
    };

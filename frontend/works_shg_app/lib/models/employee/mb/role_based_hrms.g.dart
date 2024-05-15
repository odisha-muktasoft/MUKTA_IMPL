// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_based_hrms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HRMSResponse _$$_HRMSResponseFromJson(Map<String, dynamic> json) =>
    _$_HRMSResponse(
      employees: (json['Employees'] as List<dynamic>?)
          ?.map((e) => HRMSEmployee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HRMSResponseToJson(_$_HRMSResponse instance) =>
    <String, dynamic>{
      'Employees': instance.employees,
    };

_$_HRMSEmployee _$$_HRMSEmployeeFromJson(Map<String, dynamic> json) =>
    _$_HRMSEmployee(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      code: json['code'] as String?,
      isActive: json['isActive'] as bool?,
      dateOfAppointment: json['dateOfAppointment'] as int?,
      employeeType: json['employeeType'] as String?,
    );

Map<String, dynamic> _$$_HRMSEmployeeToJson(_$_HRMSEmployee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'code': instance.code,
      'isActive': instance.isActive,
      'dateOfAppointment': instance.dateOfAppointment,
      'employeeType': instance.employeeType,
    };

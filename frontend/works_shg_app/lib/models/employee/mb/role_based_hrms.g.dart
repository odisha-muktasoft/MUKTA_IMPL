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
      employeeUser: json['user'] == null
          ? null
          : EmployeeUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HRMSEmployeeToJson(_$_HRMSEmployee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'code': instance.code,
      'isActive': instance.isActive,
      'dateOfAppointment': instance.dateOfAppointment,
      'employeeType': instance.employeeType,
      'user': instance.employeeUser,
    };

_$_EmployeeUser _$$_EmployeeUserFromJson(Map<String, dynamic> json) =>
    _$_EmployeeUser(
      correspondenceAddress: json['correspondenceAddress'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$_EmployeeUserToJson(_$_EmployeeUser instance) =>
    <String, dynamic>{
      'correspondenceAddress': instance.correspondenceAddress,
      'mobileNumber': instance.mobileNumber,
      'name': instance.name,
      'userName': instance.userName,
    };

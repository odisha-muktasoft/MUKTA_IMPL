//filtered_Measures

import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_based_hrms.freezed.dart';
part 'role_based_hrms.g.dart';

@freezed
class HRMSResponse with _$HRMSResponse {
  const factory HRMSResponse({
    @JsonKey(name: 'Employees') List<HRMSEmployee>? employees,
  }) = _HRMSResponse;

  factory HRMSResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$HRMSResponseFromJson(json);
}

@freezed
class HRMSEmployee with _$HRMSEmployee {
  const factory HRMSEmployee({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'uuid') String? uuid,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'isActive') bool? isActive,
    @JsonKey(name: 'dateOfAppointment') int? dateOfAppointment,
    @JsonKey(name: 'employeeType') String? employeeType,
  }) = _HRMSEmployee;

  factory HRMSEmployee.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$HRMSEmployeeFromJson(json);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_based_hrms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HRMSResponse _$HRMSResponseFromJson(Map<String, dynamic> json) {
  return _HRMSResponse.fromJson(json);
}

/// @nodoc
mixin _$HRMSResponse {
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HRMSResponseCopyWith<HRMSResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HRMSResponseCopyWith<$Res> {
  factory $HRMSResponseCopyWith(
          HRMSResponse value, $Res Function(HRMSResponse) then) =
      _$HRMSResponseCopyWithImpl<$Res, HRMSResponse>;
  @useResult
  $Res call({@JsonKey(name: 'Employees') List<HRMSEmployee>? employees});
}

/// @nodoc
class _$HRMSResponseCopyWithImpl<$Res, $Val extends HRMSResponse>
    implements $HRMSResponseCopyWith<$Res> {
  _$HRMSResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_value.copyWith(
      employees: freezed == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<HRMSEmployee>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HRMSResponseCopyWith<$Res>
    implements $HRMSResponseCopyWith<$Res> {
  factory _$$_HRMSResponseCopyWith(
          _$_HRMSResponse value, $Res Function(_$_HRMSResponse) then) =
      __$$_HRMSResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Employees') List<HRMSEmployee>? employees});
}

/// @nodoc
class __$$_HRMSResponseCopyWithImpl<$Res>
    extends _$HRMSResponseCopyWithImpl<$Res, _$_HRMSResponse>
    implements _$$_HRMSResponseCopyWith<$Res> {
  __$$_HRMSResponseCopyWithImpl(
      _$_HRMSResponse _value, $Res Function(_$_HRMSResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employees = freezed,
  }) {
    return _then(_$_HRMSResponse(
      employees: freezed == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<HRMSEmployee>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HRMSResponse implements _HRMSResponse {
  const _$_HRMSResponse(
      {@JsonKey(name: 'Employees') final List<HRMSEmployee>? employees})
      : _employees = employees;

  factory _$_HRMSResponse.fromJson(Map<String, dynamic> json) =>
      _$$_HRMSResponseFromJson(json);

  final List<HRMSEmployee>? _employees;
  @override
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees {
    final value = _employees;
    if (value == null) return null;
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HRMSResponse(employees: $employees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HRMSResponse &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_employees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HRMSResponseCopyWith<_$_HRMSResponse> get copyWith =>
      __$$_HRMSResponseCopyWithImpl<_$_HRMSResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HRMSResponseToJson(
      this,
    );
  }
}

abstract class _HRMSResponse implements HRMSResponse {
  const factory _HRMSResponse(
          {@JsonKey(name: 'Employees') final List<HRMSEmployee>? employees}) =
      _$_HRMSResponse;

  factory _HRMSResponse.fromJson(Map<String, dynamic> json) =
      _$_HRMSResponse.fromJson;

  @override
  @JsonKey(name: 'Employees')
  List<HRMSEmployee>? get employees;
  @override
  @JsonKey(ignore: true)
  _$$_HRMSResponseCopyWith<_$_HRMSResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

HRMSEmployee _$HRMSEmployeeFromJson(Map<String, dynamic> json) {
  return _HRMSEmployee.fromJson(json);
}

/// @nodoc
mixin _$HRMSEmployee {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfAppointment')
  int? get dateOfAppointment => throw _privateConstructorUsedError;
  @JsonKey(name: 'employeeType')
  String? get employeeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  EmployeeUser? get employeeUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HRMSEmployeeCopyWith<HRMSEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HRMSEmployeeCopyWith<$Res> {
  factory $HRMSEmployeeCopyWith(
          HRMSEmployee value, $Res Function(HRMSEmployee) then) =
      _$HRMSEmployeeCopyWithImpl<$Res, HRMSEmployee>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'dateOfAppointment') int? dateOfAppointment,
      @JsonKey(name: 'employeeType') String? employeeType,
      @JsonKey(name: 'user') EmployeeUser? employeeUser});

  $EmployeeUserCopyWith<$Res>? get employeeUser;
}

/// @nodoc
class _$HRMSEmployeeCopyWithImpl<$Res, $Val extends HRMSEmployee>
    implements $HRMSEmployeeCopyWith<$Res> {
  _$HRMSEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? dateOfAppointment = freezed,
    Object? employeeType = freezed,
    Object? employeeUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfAppointment: freezed == dateOfAppointment
          ? _value.dateOfAppointment
          : dateOfAppointment // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeUser: freezed == employeeUser
          ? _value.employeeUser
          : employeeUser // ignore: cast_nullable_to_non_nullable
              as EmployeeUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeeUserCopyWith<$Res>? get employeeUser {
    if (_value.employeeUser == null) {
      return null;
    }

    return $EmployeeUserCopyWith<$Res>(_value.employeeUser!, (value) {
      return _then(_value.copyWith(employeeUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HRMSEmployeeCopyWith<$Res>
    implements $HRMSEmployeeCopyWith<$Res> {
  factory _$$_HRMSEmployeeCopyWith(
          _$_HRMSEmployee value, $Res Function(_$_HRMSEmployee) then) =
      __$$_HRMSEmployeeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'dateOfAppointment') int? dateOfAppointment,
      @JsonKey(name: 'employeeType') String? employeeType,
      @JsonKey(name: 'user') EmployeeUser? employeeUser});

  @override
  $EmployeeUserCopyWith<$Res>? get employeeUser;
}

/// @nodoc
class __$$_HRMSEmployeeCopyWithImpl<$Res>
    extends _$HRMSEmployeeCopyWithImpl<$Res, _$_HRMSEmployee>
    implements _$$_HRMSEmployeeCopyWith<$Res> {
  __$$_HRMSEmployeeCopyWithImpl(
      _$_HRMSEmployee _value, $Res Function(_$_HRMSEmployee) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uuid = freezed,
    Object? code = freezed,
    Object? isActive = freezed,
    Object? dateOfAppointment = freezed,
    Object? employeeType = freezed,
    Object? employeeUser = freezed,
  }) {
    return _then(_$_HRMSEmployee(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      dateOfAppointment: freezed == dateOfAppointment
          ? _value.dateOfAppointment
          : dateOfAppointment // ignore: cast_nullable_to_non_nullable
              as int?,
      employeeType: freezed == employeeType
          ? _value.employeeType
          : employeeType // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeUser: freezed == employeeUser
          ? _value.employeeUser
          : employeeUser // ignore: cast_nullable_to_non_nullable
              as EmployeeUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HRMSEmployee implements _HRMSEmployee {
  const _$_HRMSEmployee(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'dateOfAppointment') this.dateOfAppointment,
      @JsonKey(name: 'employeeType') this.employeeType,
      @JsonKey(name: 'user') this.employeeUser});

  factory _$_HRMSEmployee.fromJson(Map<String, dynamic> json) =>
      _$$_HRMSEmployeeFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'dateOfAppointment')
  final int? dateOfAppointment;
  @override
  @JsonKey(name: 'employeeType')
  final String? employeeType;
  @override
  @JsonKey(name: 'user')
  final EmployeeUser? employeeUser;

  @override
  String toString() {
    return 'HRMSEmployee(id: $id, uuid: $uuid, code: $code, isActive: $isActive, dateOfAppointment: $dateOfAppointment, employeeType: $employeeType, employeeUser: $employeeUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HRMSEmployee &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateOfAppointment, dateOfAppointment) ||
                other.dateOfAppointment == dateOfAppointment) &&
            (identical(other.employeeType, employeeType) ||
                other.employeeType == employeeType) &&
            (identical(other.employeeUser, employeeUser) ||
                other.employeeUser == employeeUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uuid, code, isActive,
      dateOfAppointment, employeeType, employeeUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HRMSEmployeeCopyWith<_$_HRMSEmployee> get copyWith =>
      __$$_HRMSEmployeeCopyWithImpl<_$_HRMSEmployee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HRMSEmployeeToJson(
      this,
    );
  }
}

abstract class _HRMSEmployee implements HRMSEmployee {
  const factory _HRMSEmployee(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'uuid') final String? uuid,
          @JsonKey(name: 'code') final String? code,
          @JsonKey(name: 'isActive') final bool? isActive,
          @JsonKey(name: 'dateOfAppointment') final int? dateOfAppointment,
          @JsonKey(name: 'employeeType') final String? employeeType,
          @JsonKey(name: 'user') final EmployeeUser? employeeUser}) =
      _$_HRMSEmployee;

  factory _HRMSEmployee.fromJson(Map<String, dynamic> json) =
      _$_HRMSEmployee.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'dateOfAppointment')
  int? get dateOfAppointment;
  @override
  @JsonKey(name: 'employeeType')
  String? get employeeType;
  @override
  @JsonKey(name: 'user')
  EmployeeUser? get employeeUser;
  @override
  @JsonKey(ignore: true)
  _$$_HRMSEmployeeCopyWith<_$_HRMSEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

EmployeeUser _$EmployeeUserFromJson(Map<String, dynamic> json) {
  return _EmployeeUser.fromJson(json);
}

/// @nodoc
mixin _$EmployeeUser {
  @JsonKey(name: 'correspondenceAddress')
  String? get correspondenceAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeUserCopyWith<EmployeeUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeUserCopyWith<$Res> {
  factory $EmployeeUserCopyWith(
          EmployeeUser value, $Res Function(EmployeeUser) then) =
      _$EmployeeUserCopyWithImpl<$Res, EmployeeUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'correspondenceAddress') String? correspondenceAddress,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'userName') String? userName});
}

/// @nodoc
class _$EmployeeUserCopyWithImpl<$Res, $Val extends EmployeeUser>
    implements $EmployeeUserCopyWith<$Res> {
  _$EmployeeUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correspondenceAddress = freezed,
    Object? mobileNumber = freezed,
    Object? name = freezed,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      correspondenceAddress: freezed == correspondenceAddress
          ? _value.correspondenceAddress
          : correspondenceAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeUserCopyWith<$Res>
    implements $EmployeeUserCopyWith<$Res> {
  factory _$$_EmployeeUserCopyWith(
          _$_EmployeeUser value, $Res Function(_$_EmployeeUser) then) =
      __$$_EmployeeUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'correspondenceAddress') String? correspondenceAddress,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'userName') String? userName});
}

/// @nodoc
class __$$_EmployeeUserCopyWithImpl<$Res>
    extends _$EmployeeUserCopyWithImpl<$Res, _$_EmployeeUser>
    implements _$$_EmployeeUserCopyWith<$Res> {
  __$$_EmployeeUserCopyWithImpl(
      _$_EmployeeUser _value, $Res Function(_$_EmployeeUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correspondenceAddress = freezed,
    Object? mobileNumber = freezed,
    Object? name = freezed,
    Object? userName = freezed,
  }) {
    return _then(_$_EmployeeUser(
      correspondenceAddress: freezed == correspondenceAddress
          ? _value.correspondenceAddress
          : correspondenceAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeUser implements _EmployeeUser {
  const _$_EmployeeUser(
      {@JsonKey(name: 'correspondenceAddress') this.correspondenceAddress,
      @JsonKey(name: 'mobileNumber') this.mobileNumber,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'userName') this.userName});

  factory _$_EmployeeUser.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeUserFromJson(json);

  @override
  @JsonKey(name: 'correspondenceAddress')
  final String? correspondenceAddress;
  @override
  @JsonKey(name: 'mobileNumber')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'userName')
  final String? userName;

  @override
  String toString() {
    return 'EmployeeUser(correspondenceAddress: $correspondenceAddress, mobileNumber: $mobileNumber, name: $name, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeUser &&
            (identical(other.correspondenceAddress, correspondenceAddress) ||
                other.correspondenceAddress == correspondenceAddress) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, correspondenceAddress, mobileNumber, name, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeUserCopyWith<_$_EmployeeUser> get copyWith =>
      __$$_EmployeeUserCopyWithImpl<_$_EmployeeUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeUserToJson(
      this,
    );
  }
}

abstract class _EmployeeUser implements EmployeeUser {
  const factory _EmployeeUser(
      {@JsonKey(name: 'correspondenceAddress')
          final String? correspondenceAddress,
      @JsonKey(name: 'mobileNumber')
          final String? mobileNumber,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'userName')
          final String? userName}) = _$_EmployeeUser;

  factory _EmployeeUser.fromJson(Map<String, dynamic> json) =
      _$_EmployeeUser.fromJson;

  @override
  @JsonKey(name: 'correspondenceAddress')
  String? get correspondenceAddress;
  @override
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'userName')
  String? get userName;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeUserCopyWith<_$_EmployeeUser> get copyWith =>
      throw _privateConstructorUsedError;
}

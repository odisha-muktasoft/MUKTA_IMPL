// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDetailsModel _$UserDetailsModelFromJson(Map<String, dynamic> json) {
  return _UserDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$UserDetailsModel {
  @JsonKey(name: 'UserRequest')
  UserRequestModel? get userRequestModel => throw _privateConstructorUsedError;
  String? get access_token => throw _privateConstructorUsedError;
  String? get token_type => throw _privateConstructorUsedError;
  String? get refresh_token => throw _privateConstructorUsedError;
  int? get expires_in => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsModelCopyWith<UserDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsModelCopyWith<$Res> {
  factory $UserDetailsModelCopyWith(
          UserDetailsModel value, $Res Function(UserDetailsModel) then) =
      _$UserDetailsModelCopyWithImpl<$Res, UserDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRequest') UserRequestModel? userRequestModel,
      String? access_token,
      String? token_type,
      String? refresh_token,
      int? expires_in,
      String? scope});

  $UserRequestModelCopyWith<$Res>? get userRequestModel;
}

/// @nodoc
class _$UserDetailsModelCopyWithImpl<$Res, $Val extends UserDetailsModel>
    implements $UserDetailsModelCopyWith<$Res> {
  _$UserDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRequestModel = freezed,
    Object? access_token = freezed,
    Object? token_type = freezed,
    Object? refresh_token = freezed,
    Object? expires_in = freezed,
    Object? scope = freezed,
  }) {
    return _then(_value.copyWith(
      userRequestModel: freezed == userRequestModel
          ? _value.userRequestModel
          : userRequestModel // ignore: cast_nullable_to_non_nullable
              as UserRequestModel?,
      access_token: freezed == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String?,
      token_type: freezed == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      expires_in: freezed == expires_in
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestModelCopyWith<$Res>? get userRequestModel {
    if (_value.userRequestModel == null) {
      return null;
    }

    return $UserRequestModelCopyWith<$Res>(_value.userRequestModel!, (value) {
      return _then(_value.copyWith(userRequestModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDetailsModelImplCopyWith<$Res>
    implements $UserDetailsModelCopyWith<$Res> {
  factory _$$UserDetailsModelImplCopyWith(_$UserDetailsModelImpl value,
          $Res Function(_$UserDetailsModelImpl) then) =
      __$$UserDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRequest') UserRequestModel? userRequestModel,
      String? access_token,
      String? token_type,
      String? refresh_token,
      int? expires_in,
      String? scope});

  @override
  $UserRequestModelCopyWith<$Res>? get userRequestModel;
}

/// @nodoc
class __$$UserDetailsModelImplCopyWithImpl<$Res>
    extends _$UserDetailsModelCopyWithImpl<$Res, _$UserDetailsModelImpl>
    implements _$$UserDetailsModelImplCopyWith<$Res> {
  __$$UserDetailsModelImplCopyWithImpl(_$UserDetailsModelImpl _value,
      $Res Function(_$UserDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRequestModel = freezed,
    Object? access_token = freezed,
    Object? token_type = freezed,
    Object? refresh_token = freezed,
    Object? expires_in = freezed,
    Object? scope = freezed,
  }) {
    return _then(_$UserDetailsModelImpl(
      userRequestModel: freezed == userRequestModel
          ? _value.userRequestModel
          : userRequestModel // ignore: cast_nullable_to_non_nullable
              as UserRequestModel?,
      access_token: freezed == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String?,
      token_type: freezed == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      expires_in: freezed == expires_in
          ? _value.expires_in
          : expires_in // ignore: cast_nullable_to_non_nullable
              as int?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDetailsModelImpl implements _UserDetailsModel {
  const _$UserDetailsModelImpl(
      {@JsonKey(name: 'UserRequest') this.userRequestModel,
      this.access_token,
      this.token_type,
      this.refresh_token,
      this.expires_in,
      this.scope});

  factory _$UserDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: 'UserRequest')
  final UserRequestModel? userRequestModel;
  @override
  final String? access_token;
  @override
  final String? token_type;
  @override
  final String? refresh_token;
  @override
  final int? expires_in;
  @override
  final String? scope;

  @override
  String toString() {
    return 'UserDetailsModel(userRequestModel: $userRequestModel, access_token: $access_token, token_type: $token_type, refresh_token: $refresh_token, expires_in: $expires_in, scope: $scope)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsModelImpl &&
            (identical(other.userRequestModel, userRequestModel) ||
                other.userRequestModel == userRequestModel) &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.token_type, token_type) ||
                other.token_type == token_type) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.expires_in, expires_in) ||
                other.expires_in == expires_in) &&
            (identical(other.scope, scope) || other.scope == scope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userRequestModel, access_token,
      token_type, refresh_token, expires_in, scope);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      __$$UserDetailsModelImplCopyWithImpl<_$UserDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _UserDetailsModel implements UserDetailsModel {
  const factory _UserDetailsModel(
      {@JsonKey(name: 'UserRequest') final UserRequestModel? userRequestModel,
      final String? access_token,
      final String? token_type,
      final String? refresh_token,
      final int? expires_in,
      final String? scope}) = _$UserDetailsModelImpl;

  factory _UserDetailsModel.fromJson(Map<String, dynamic> json) =
      _$UserDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'UserRequest')
  UserRequestModel? get userRequestModel;
  @override
  String? get access_token;
  @override
  String? get token_type;
  @override
  String? get refresh_token;
  @override
  int? get expires_in;
  @override
  String? get scope;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsModelImplCopyWith<_$UserDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) {
  return _UserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserRequestModel {
  bool? get active => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get emailId => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<RolesModel>? get rolesModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestModelCopyWith<UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestModelCopyWith<$Res> {
  factory $UserRequestModelCopyWith(
          UserRequestModel value, $Res Function(UserRequestModel) then) =
      _$UserRequestModelCopyWithImpl<$Res, UserRequestModel>;
  @useResult
  $Res call(
      {bool? active,
      int? id,
      String? emailId,
      String? mobileNumber,
      String? name,
      String? scope,
      String tenantId,
      String? type,
      String? userName,
      String? uuid,
      @JsonKey(name: 'roles') List<RolesModel>? rolesModel});
}

/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res, $Val extends UserRequestModel>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = freezed,
    Object? id = freezed,
    Object? emailId = freezed,
    Object? mobileNumber = freezed,
    Object? name = freezed,
    Object? scope = freezed,
    Object? tenantId = null,
    Object? type = freezed,
    Object? userName = freezed,
    Object? uuid = freezed,
    Object? rolesModel = freezed,
  }) {
    return _then(_value.copyWith(
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesModel: freezed == rolesModel
          ? _value.rolesModel
          : rolesModel // ignore: cast_nullable_to_non_nullable
              as List<RolesModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRequestModelImplCopyWith<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  factory _$$UserRequestModelImplCopyWith(_$UserRequestModelImpl value,
          $Res Function(_$UserRequestModelImpl) then) =
      __$$UserRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? active,
      int? id,
      String? emailId,
      String? mobileNumber,
      String? name,
      String? scope,
      String tenantId,
      String? type,
      String? userName,
      String? uuid,
      @JsonKey(name: 'roles') List<RolesModel>? rolesModel});
}

/// @nodoc
class __$$UserRequestModelImplCopyWithImpl<$Res>
    extends _$UserRequestModelCopyWithImpl<$Res, _$UserRequestModelImpl>
    implements _$$UserRequestModelImplCopyWith<$Res> {
  __$$UserRequestModelImplCopyWithImpl(_$UserRequestModelImpl _value,
      $Res Function(_$UserRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = freezed,
    Object? id = freezed,
    Object? emailId = freezed,
    Object? mobileNumber = freezed,
    Object? name = freezed,
    Object? scope = freezed,
    Object? tenantId = null,
    Object? type = freezed,
    Object? userName = freezed,
    Object? uuid = freezed,
    Object? rolesModel = freezed,
  }) {
    return _then(_$UserRequestModelImpl(
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesModel: freezed == rolesModel
          ? _value._rolesModel
          : rolesModel // ignore: cast_nullable_to_non_nullable
              as List<RolesModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRequestModelImpl implements _UserRequestModel {
  const _$UserRequestModelImpl(
      {this.active,
      this.id,
      this.emailId,
      this.mobileNumber,
      this.name,
      this.scope,
      required this.tenantId,
      this.type,
      this.userName,
      this.uuid,
      @JsonKey(name: 'roles') final List<RolesModel>? rolesModel})
      : _rolesModel = rolesModel;

  factory _$UserRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRequestModelImplFromJson(json);

  @override
  final bool? active;
  @override
  final int? id;
  @override
  final String? emailId;
  @override
  final String? mobileNumber;
  @override
  final String? name;
  @override
  final String? scope;
  @override
  final String tenantId;
  @override
  final String? type;
  @override
  final String? userName;
  @override
  final String? uuid;
  final List<RolesModel>? _rolesModel;
  @override
  @JsonKey(name: 'roles')
  List<RolesModel>? get rolesModel {
    final value = _rolesModel;
    if (value == null) return null;
    if (_rolesModel is EqualUnmodifiableListView) return _rolesModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserRequestModel(active: $active, id: $id, emailId: $emailId, mobileNumber: $mobileNumber, name: $name, scope: $scope, tenantId: $tenantId, type: $type, userName: $userName, uuid: $uuid, rolesModel: $rolesModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRequestModelImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality()
                .equals(other._rolesModel, _rolesModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      active,
      id,
      emailId,
      mobileNumber,
      name,
      scope,
      tenantId,
      type,
      userName,
      uuid,
      const DeepCollectionEquality().hash(_rolesModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRequestModelImplCopyWith<_$UserRequestModelImpl> get copyWith =>
      __$$UserRequestModelImplCopyWithImpl<_$UserRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRequestModelImplToJson(
      this,
    );
  }
}

abstract class _UserRequestModel implements UserRequestModel {
  const factory _UserRequestModel(
          {final bool? active,
          final int? id,
          final String? emailId,
          final String? mobileNumber,
          final String? name,
          final String? scope,
          required final String tenantId,
          final String? type,
          final String? userName,
          final String? uuid,
          @JsonKey(name: 'roles') final List<RolesModel>? rolesModel}) =
      _$UserRequestModelImpl;

  factory _UserRequestModel.fromJson(Map<String, dynamic> json) =
      _$UserRequestModelImpl.fromJson;

  @override
  bool? get active;
  @override
  int? get id;
  @override
  String? get emailId;
  @override
  String? get mobileNumber;
  @override
  String? get name;
  @override
  String? get scope;
  @override
  String get tenantId;
  @override
  String? get type;
  @override
  String? get userName;
  @override
  String? get uuid;
  @override
  @JsonKey(name: 'roles')
  List<RolesModel>? get rolesModel;
  @override
  @JsonKey(ignore: true)
  _$$UserRequestModelImplCopyWith<_$UserRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RolesModel _$RolesModelFromJson(Map<String, dynamic> json) {
  return _RolesModel.fromJson(json);
}

/// @nodoc
mixin _$RolesModel {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesModelCopyWith<RolesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesModelCopyWith<$Res> {
  factory $RolesModelCopyWith(
          RolesModel value, $Res Function(RolesModel) then) =
      _$RolesModelCopyWithImpl<$Res, RolesModel>;
  @useResult
  $Res call({String? code, String? name, String? tenantId});
}

/// @nodoc
class _$RolesModelCopyWithImpl<$Res, $Val extends RolesModel>
    implements $RolesModelCopyWith<$Res> {
  _$RolesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolesModelImplCopyWith<$Res>
    implements $RolesModelCopyWith<$Res> {
  factory _$$RolesModelImplCopyWith(
          _$RolesModelImpl value, $Res Function(_$RolesModelImpl) then) =
      __$$RolesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? name, String? tenantId});
}

/// @nodoc
class __$$RolesModelImplCopyWithImpl<$Res>
    extends _$RolesModelCopyWithImpl<$Res, _$RolesModelImpl>
    implements _$$RolesModelImplCopyWith<$Res> {
  __$$RolesModelImplCopyWithImpl(
      _$RolesModelImpl _value, $Res Function(_$RolesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_$RolesModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolesModelImpl implements _RolesModel {
  const _$RolesModelImpl({this.code, this.name, this.tenantId});

  factory _$RolesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolesModelImplFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? tenantId;

  @override
  String toString() {
    return 'RolesModel(code: $code, name: $name, tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolesModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RolesModelImplCopyWith<_$RolesModelImpl> get copyWith =>
      __$$RolesModelImplCopyWithImpl<_$RolesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolesModelImplToJson(
      this,
    );
  }
}

abstract class _RolesModel implements RolesModel {
  const factory _RolesModel(
      {final String? code,
      final String? name,
      final String? tenantId}) = _$RolesModelImpl;

  factory _RolesModel.fromJson(Map<String, dynamic> json) =
      _$RolesModelImpl.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$RolesModelImplCopyWith<_$RolesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homeConfigModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeConfigModel _$HomeConfigModelFromJson(Map<String, dynamic> json) {
  return _HomeConfigModel.fromJson(json);
}

/// @nodoc
mixin _$HomeConfigModel {
  @JsonKey(name: 'actions')
  List<HomeAction> get homeActions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeConfigModelCopyWith<HomeConfigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeConfigModelCopyWith<$Res> {
  factory $HomeConfigModelCopyWith(
          HomeConfigModel value, $Res Function(HomeConfigModel) then) =
      _$HomeConfigModelCopyWithImpl<$Res, HomeConfigModel>;
  @useResult
  $Res call({@JsonKey(name: 'actions') List<HomeAction> homeActions});
}

/// @nodoc
class _$HomeConfigModelCopyWithImpl<$Res, $Val extends HomeConfigModel>
    implements $HomeConfigModelCopyWith<$Res> {
  _$HomeConfigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeActions = null,
  }) {
    return _then(_value.copyWith(
      homeActions: null == homeActions
          ? _value.homeActions
          : homeActions // ignore: cast_nullable_to_non_nullable
              as List<HomeAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeConfigModelImplCopyWith<$Res>
    implements $HomeConfigModelCopyWith<$Res> {
  factory _$$HomeConfigModelImplCopyWith(_$HomeConfigModelImpl value,
          $Res Function(_$HomeConfigModelImpl) then) =
      __$$HomeConfigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'actions') List<HomeAction> homeActions});
}

/// @nodoc
class __$$HomeConfigModelImplCopyWithImpl<$Res>
    extends _$HomeConfigModelCopyWithImpl<$Res, _$HomeConfigModelImpl>
    implements _$$HomeConfigModelImplCopyWith<$Res> {
  __$$HomeConfigModelImplCopyWithImpl(
      _$HomeConfigModelImpl _value, $Res Function(_$HomeConfigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeActions = null,
  }) {
    return _then(_$HomeConfigModelImpl(
      homeActions: null == homeActions
          ? _value._homeActions
          : homeActions // ignore: cast_nullable_to_non_nullable
              as List<HomeAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeConfigModelImpl implements _HomeConfigModel {
  _$HomeConfigModelImpl(
      {@JsonKey(name: 'actions') required final List<HomeAction> homeActions})
      : _homeActions = homeActions;

  factory _$HomeConfigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeConfigModelImplFromJson(json);

  final List<HomeAction> _homeActions;
  @override
  @JsonKey(name: 'actions')
  List<HomeAction> get homeActions {
    if (_homeActions is EqualUnmodifiableListView) return _homeActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homeActions);
  }

  @override
  String toString() {
    return 'HomeConfigModel(homeActions: $homeActions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeConfigModelImpl &&
            const DeepCollectionEquality()
                .equals(other._homeActions, _homeActions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_homeActions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeConfigModelImplCopyWith<_$HomeConfigModelImpl> get copyWith =>
      __$$HomeConfigModelImplCopyWithImpl<_$HomeConfigModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeConfigModelImplToJson(
      this,
    );
  }
}

abstract class _HomeConfigModel implements HomeConfigModel {
  factory _HomeConfigModel(
      {@JsonKey(name: 'actions')
      required final List<HomeAction> homeActions}) = _$HomeConfigModelImpl;

  factory _HomeConfigModel.fromJson(Map<String, dynamic> json) =
      _$HomeConfigModelImpl.fromJson;

  @override
  @JsonKey(name: 'actions')
  List<HomeAction> get homeActions;
  @override
  @JsonKey(ignore: true)
  _$$HomeConfigModelImplCopyWith<_$HomeConfigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeAction _$HomeActionFromJson(Map<String, dynamic> json) {
  return _HomeAction.fromJson(json);
}

/// @nodoc
mixin _$HomeAction {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentModule')
  String get parentModule => throw _privateConstructorUsedError;
  @JsonKey(name: 'enabled')
  bool get enabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeActionCopyWith<HomeAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeActionCopyWith<$Res> {
  factory $HomeActionCopyWith(
          HomeAction value, $Res Function(HomeAction) then) =
      _$HomeActionCopyWithImpl<$Res, HomeAction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'parentModule') String parentModule,
      @JsonKey(name: 'enabled') bool enabled,
      @JsonKey(name: 'tenantId') String tenantId,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$HomeActionCopyWithImpl<$Res, $Val extends HomeAction>
    implements $HomeActionCopyWith<$Res> {
  _$HomeActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? parentModule = null,
    Object? enabled = null,
    Object? tenantId = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      parentModule: null == parentModule
          ? _value.parentModule
          : parentModule // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeActionImplCopyWith<$Res>
    implements $HomeActionCopyWith<$Res> {
  factory _$$HomeActionImplCopyWith(
          _$HomeActionImpl value, $Res Function(_$HomeActionImpl) then) =
      __$$HomeActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'displayName') String displayName,
      @JsonKey(name: 'parentModule') String parentModule,
      @JsonKey(name: 'enabled') bool enabled,
      @JsonKey(name: 'tenantId') String tenantId,
      @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$HomeActionImplCopyWithImpl<$Res>
    extends _$HomeActionCopyWithImpl<$Res, _$HomeActionImpl>
    implements _$$HomeActionImplCopyWith<$Res> {
  __$$HomeActionImplCopyWithImpl(
      _$HomeActionImpl _value, $Res Function(_$HomeActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? parentModule = null,
    Object? enabled = null,
    Object? tenantId = null,
    Object? url = null,
  }) {
    return _then(_$HomeActionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      parentModule: null == parentModule
          ? _value.parentModule
          : parentModule // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeActionImpl implements _HomeAction {
  const _$HomeActionImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'displayName') required this.displayName,
      @JsonKey(name: 'parentModule') required this.parentModule,
      @JsonKey(name: 'enabled') required this.enabled,
      @JsonKey(name: 'tenantId') required this.tenantId,
      @JsonKey(name: 'url') required this.url});

  factory _$HomeActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeActionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'displayName')
  final String displayName;
  @override
  @JsonKey(name: 'parentModule')
  final String parentModule;
  @override
  @JsonKey(name: 'enabled')
  final bool enabled;
  @override
  @JsonKey(name: 'tenantId')
  final String tenantId;
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'HomeAction(id: $id, displayName: $displayName, parentModule: $parentModule, enabled: $enabled, tenantId: $tenantId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.parentModule, parentModule) ||
                other.parentModule == parentModule) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, displayName, parentModule, enabled, tenantId, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeActionImplCopyWith<_$HomeActionImpl> get copyWith =>
      __$$HomeActionImplCopyWithImpl<_$HomeActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeActionImplToJson(
      this,
    );
  }
}

abstract class _HomeAction implements HomeAction {
  const factory _HomeAction(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'displayName') required final String displayName,
      @JsonKey(name: 'parentModule') required final String parentModule,
      @JsonKey(name: 'enabled') required final bool enabled,
      @JsonKey(name: 'tenantId') required final String tenantId,
      @JsonKey(name: 'url') required final String url}) = _$HomeActionImpl;

  factory _HomeAction.fromJson(Map<String, dynamic> json) =
      _$HomeActionImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'displayName')
  String get displayName;
  @override
  @JsonKey(name: 'parentModule')
  String get parentModule;
  @override
  @JsonKey(name: 'enabled')
  bool get enabled;
  @override
  @JsonKey(name: 'tenantId')
  String get tenantId;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$HomeActionImplCopyWith<_$HomeActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

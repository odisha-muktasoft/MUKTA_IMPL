// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModuleStatus _$ModuleStatusFromJson(Map<String, dynamic> json) {
  return _ModuleStatus.fromJson(json);
}

/// @nodoc
mixin _$ModuleStatus {
  bool get isEng => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get isOdia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModuleStatusCopyWith<ModuleStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleStatusCopyWith<$Res> {
  factory $ModuleStatusCopyWith(
          ModuleStatus value, $Res Function(ModuleStatus) then) =
      _$ModuleStatusCopyWithImpl<$Res, ModuleStatus>;
  @useResult
  $Res call({bool isEng, String label, String value, bool isOdia});
}

/// @nodoc
class _$ModuleStatusCopyWithImpl<$Res, $Val extends ModuleStatus>
    implements $ModuleStatusCopyWith<$Res> {
  _$ModuleStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEng = null,
    Object? label = null,
    Object? value = null,
    Object? isOdia = null,
  }) {
    return _then(_value.copyWith(
      isEng: null == isEng
          ? _value.isEng
          : isEng // ignore: cast_nullable_to_non_nullable
              as bool,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isOdia: null == isOdia
          ? _value.isOdia
          : isOdia // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModuleStatusCopyWith<$Res>
    implements $ModuleStatusCopyWith<$Res> {
  factory _$$_ModuleStatusCopyWith(
          _$_ModuleStatus value, $Res Function(_$_ModuleStatus) then) =
      __$$_ModuleStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEng, String label, String value, bool isOdia});
}

/// @nodoc
class __$$_ModuleStatusCopyWithImpl<$Res>
    extends _$ModuleStatusCopyWithImpl<$Res, _$_ModuleStatus>
    implements _$$_ModuleStatusCopyWith<$Res> {
  __$$_ModuleStatusCopyWithImpl(
      _$_ModuleStatus _value, $Res Function(_$_ModuleStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEng = null,
    Object? label = null,
    Object? value = null,
    Object? isOdia = null,
  }) {
    return _then(_$_ModuleStatus(
      isEng: null == isEng
          ? _value.isEng
          : isEng // ignore: cast_nullable_to_non_nullable
              as bool,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isOdia: null == isOdia
          ? _value.isOdia
          : isOdia // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModuleStatus implements _ModuleStatus {
  _$_ModuleStatus(
      {required this.isEng,
      required this.label,
      required this.value,
      required this.isOdia});

  factory _$_ModuleStatus.fromJson(Map<String, dynamic> json) =>
      _$$_ModuleStatusFromJson(json);

  @override
  final bool isEng;
  @override
  final String label;
  @override
  final String value;
  @override
  final bool isOdia;

  @override
  String toString() {
    return 'ModuleStatus(isEng: $isEng, label: $label, value: $value, isOdia: $isOdia)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModuleStatus &&
            (identical(other.isEng, isEng) || other.isEng == isEng) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isOdia, isOdia) || other.isOdia == isOdia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isEng, label, value, isOdia);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModuleStatusCopyWith<_$_ModuleStatus> get copyWith =>
      __$$_ModuleStatusCopyWithImpl<_$_ModuleStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModuleStatusToJson(
      this,
    );
  }
}

abstract class _ModuleStatus implements ModuleStatus {
  factory _ModuleStatus(
      {required final bool isEng,
      required final String label,
      required final String value,
      required final bool isOdia}) = _$_ModuleStatus;

  factory _ModuleStatus.fromJson(Map<String, dynamic> json) =
      _$_ModuleStatus.fromJson;

  @override
  bool get isEng;
  @override
  String get label;
  @override
  String get value;
  @override
  bool get isOdia;
  @override
  @JsonKey(ignore: true)
  _$$_ModuleStatusCopyWith<_$_ModuleStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

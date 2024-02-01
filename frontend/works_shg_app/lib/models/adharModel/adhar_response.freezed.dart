// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adhar_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdharCardResponse _$AdharCardResponseFromJson(Map<String, dynamic> json) {
  return _AdharCardResponse.fromJson(json);
}

/// @nodoc
mixin _$AdharCardResponse {
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn')
  String? get txn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdharCardResponseCopyWith<AdharCardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdharCardResponseCopyWith<$Res> {
  factory $AdharCardResponseCopyWith(
          AdharCardResponse value, $Res Function(AdharCardResponse) then) =
      _$AdharCardResponseCopyWithImpl<$Res, AdharCardResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'txn') String? txn});
}

/// @nodoc
class _$AdharCardResponseCopyWithImpl<$Res, $Val extends AdharCardResponse>
    implements $AdharCardResponseCopyWith<$Res> {
  _$AdharCardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? txn = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      txn: freezed == txn
          ? _value.txn
          : txn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdharCardResponseCopyWith<$Res>
    implements $AdharCardResponseCopyWith<$Res> {
  factory _$$_AdharCardResponseCopyWith(_$_AdharCardResponse value,
          $Res Function(_$_AdharCardResponse) then) =
      __$$_AdharCardResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') String? status,
      @JsonKey(name: 'txn') String? txn});
}

/// @nodoc
class __$$_AdharCardResponseCopyWithImpl<$Res>
    extends _$AdharCardResponseCopyWithImpl<$Res, _$_AdharCardResponse>
    implements _$$_AdharCardResponseCopyWith<$Res> {
  __$$_AdharCardResponseCopyWithImpl(
      _$_AdharCardResponse _value, $Res Function(_$_AdharCardResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? txn = freezed,
  }) {
    return _then(_$_AdharCardResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      txn: freezed == txn
          ? _value.txn
          : txn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdharCardResponse implements _AdharCardResponse {
  const _$_AdharCardResponse(
      {@JsonKey(name: 'status') this.status, @JsonKey(name: 'txn') this.txn});

  factory _$_AdharCardResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AdharCardResponseFromJson(json);

  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'txn')
  final String? txn;

  @override
  String toString() {
    return 'AdharCardResponse(status: $status, txn: $txn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdharCardResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.txn, txn) || other.txn == txn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, txn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdharCardResponseCopyWith<_$_AdharCardResponse> get copyWith =>
      __$$_AdharCardResponseCopyWithImpl<_$_AdharCardResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdharCardResponseToJson(
      this,
    );
  }
}

abstract class _AdharCardResponse implements AdharCardResponse {
  const factory _AdharCardResponse(
      {@JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'txn') final String? txn}) = _$_AdharCardResponse;

  factory _AdharCardResponse.fromJson(Map<String, dynamic> json) =
      _$_AdharCardResponse.fromJson;

  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'txn')
  String? get txn;
  @override
  @JsonKey(ignore: true)
  _$$_AdharCardResponseCopyWith<_$_AdharCardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

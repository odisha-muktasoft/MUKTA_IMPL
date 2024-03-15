// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mb_detail_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeasurementDetailBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tenantId, String contractNumber, String measurementNumber)
        create,
    required TResult Function() clear,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        addToMeasurementLineList,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        updateToMeasurementLineList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult? Function()? clear,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult Function()? clear,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementDetailBookBlocEvent value) create,
    required TResult Function(MeasurementDetailBlocClearEvent value) clear,
    required TResult Function(AddToMeasurementLineEvent value)
        addToMeasurementLineList,
    required TResult Function(UpdateToMeasurementLineEvent value)
        updateToMeasurementLineList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementDetailBookBlocEvent value)? create,
    TResult? Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult? Function(AddToMeasurementLineEvent value)?
        addToMeasurementLineList,
    TResult? Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementDetailBookBlocEvent value)? create,
    TResult Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult Function(AddToMeasurementLineEvent value)? addToMeasurementLineList,
    TResult Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementDetailBlocEventCopyWith<$Res> {
  factory $MeasurementDetailBlocEventCopyWith(MeasurementDetailBlocEvent value,
          $Res Function(MeasurementDetailBlocEvent) then) =
      _$MeasurementDetailBlocEventCopyWithImpl<$Res,
          MeasurementDetailBlocEvent>;
}

/// @nodoc
class _$MeasurementDetailBlocEventCopyWithImpl<$Res,
        $Val extends MeasurementDetailBlocEvent>
    implements $MeasurementDetailBlocEventCopyWith<$Res> {
  _$MeasurementDetailBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MeasurementDetailBookBlocEventCopyWith<$Res> {
  factory _$$MeasurementDetailBookBlocEventCopyWith(
          _$MeasurementDetailBookBlocEvent value,
          $Res Function(_$MeasurementDetailBookBlocEvent) then) =
      __$$MeasurementDetailBookBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String tenantId, String contractNumber, String measurementNumber});
}

/// @nodoc
class __$$MeasurementDetailBookBlocEventCopyWithImpl<$Res>
    extends _$MeasurementDetailBlocEventCopyWithImpl<$Res,
        _$MeasurementDetailBookBlocEvent>
    implements _$$MeasurementDetailBookBlocEventCopyWith<$Res> {
  __$$MeasurementDetailBookBlocEventCopyWithImpl(
      _$MeasurementDetailBookBlocEvent _value,
      $Res Function(_$MeasurementDetailBookBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? contractNumber = null,
    Object? measurementNumber = null,
  }) {
    return _then(_$MeasurementDetailBookBlocEvent(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      measurementNumber: null == measurementNumber
          ? _value.measurementNumber
          : measurementNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MeasurementDetailBookBlocEvent
    implements MeasurementDetailBookBlocEvent {
  const _$MeasurementDetailBookBlocEvent(
      {required this.tenantId,
      required this.contractNumber,
      required this.measurementNumber});

  @override
  final String tenantId;
  @override
  final String contractNumber;
  @override
  final String measurementNumber;

  @override
  String toString() {
    return 'MeasurementDetailBlocEvent.create(tenantId: $tenantId, contractNumber: $contractNumber, measurementNumber: $measurementNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementDetailBookBlocEvent &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.measurementNumber, measurementNumber) ||
                other.measurementNumber == measurementNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tenantId, contractNumber, measurementNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementDetailBookBlocEventCopyWith<_$MeasurementDetailBookBlocEvent>
      get copyWith => __$$MeasurementDetailBookBlocEventCopyWithImpl<
          _$MeasurementDetailBookBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tenantId, String contractNumber, String measurementNumber)
        create,
    required TResult Function() clear,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        addToMeasurementLineList,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        updateToMeasurementLineList,
  }) {
    return create(tenantId, contractNumber, measurementNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult? Function()? clear,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
  }) {
    return create?.call(tenantId, contractNumber, measurementNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult Function()? clear,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(tenantId, contractNumber, measurementNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementDetailBookBlocEvent value) create,
    required TResult Function(MeasurementDetailBlocClearEvent value) clear,
    required TResult Function(AddToMeasurementLineEvent value)
        addToMeasurementLineList,
    required TResult Function(UpdateToMeasurementLineEvent value)
        updateToMeasurementLineList,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementDetailBookBlocEvent value)? create,
    TResult? Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult? Function(AddToMeasurementLineEvent value)?
        addToMeasurementLineList,
    TResult? Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementDetailBookBlocEvent value)? create,
    TResult Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult Function(AddToMeasurementLineEvent value)? addToMeasurementLineList,
    TResult Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class MeasurementDetailBookBlocEvent
    implements MeasurementDetailBlocEvent {
  const factory MeasurementDetailBookBlocEvent(
          {required final String tenantId,
          required final String contractNumber,
          required final String measurementNumber}) =
      _$MeasurementDetailBookBlocEvent;

  String get tenantId;
  String get contractNumber;
  String get measurementNumber;
  @JsonKey(ignore: true)
  _$$MeasurementDetailBookBlocEventCopyWith<_$MeasurementDetailBookBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeasurementDetailBlocClearEventCopyWith<$Res> {
  factory _$$MeasurementDetailBlocClearEventCopyWith(
          _$MeasurementDetailBlocClearEvent value,
          $Res Function(_$MeasurementDetailBlocClearEvent) then) =
      __$$MeasurementDetailBlocClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MeasurementDetailBlocClearEventCopyWithImpl<$Res>
    extends _$MeasurementDetailBlocEventCopyWithImpl<$Res,
        _$MeasurementDetailBlocClearEvent>
    implements _$$MeasurementDetailBlocClearEventCopyWith<$Res> {
  __$$MeasurementDetailBlocClearEventCopyWithImpl(
      _$MeasurementDetailBlocClearEvent _value,
      $Res Function(_$MeasurementDetailBlocClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MeasurementDetailBlocClearEvent
    implements MeasurementDetailBlocClearEvent {
  const _$MeasurementDetailBlocClearEvent();

  @override
  String toString() {
    return 'MeasurementDetailBlocEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementDetailBlocClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tenantId, String contractNumber, String measurementNumber)
        create,
    required TResult Function() clear,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        addToMeasurementLineList,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        updateToMeasurementLineList,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult? Function()? clear,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult Function()? clear,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementDetailBookBlocEvent value) create,
    required TResult Function(MeasurementDetailBlocClearEvent value) clear,
    required TResult Function(AddToMeasurementLineEvent value)
        addToMeasurementLineList,
    required TResult Function(UpdateToMeasurementLineEvent value)
        updateToMeasurementLineList,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementDetailBookBlocEvent value)? create,
    TResult? Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult? Function(AddToMeasurementLineEvent value)?
        addToMeasurementLineList,
    TResult? Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementDetailBookBlocEvent value)? create,
    TResult Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult Function(AddToMeasurementLineEvent value)? addToMeasurementLineList,
    TResult Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class MeasurementDetailBlocClearEvent
    implements MeasurementDetailBlocEvent {
  const factory MeasurementDetailBlocClearEvent() =
      _$MeasurementDetailBlocClearEvent;
}

/// @nodoc
abstract class _$$AddToMeasurementLineEventCopyWith<$Res> {
  factory _$$AddToMeasurementLineEventCopyWith(
          _$AddToMeasurementLineEvent value,
          $Res Function(_$AddToMeasurementLineEvent) then) =
      __$$AddToMeasurementLineEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String sorId,
      String type,
      int? index,
      int? measurementLineIndex,
      String? filteredMeasurementMeasureId,
      dynamic height,
      dynamic width,
      dynamic length,
      dynamic number,
      dynamic quantity});
}

/// @nodoc
class __$$AddToMeasurementLineEventCopyWithImpl<$Res>
    extends _$MeasurementDetailBlocEventCopyWithImpl<$Res,
        _$AddToMeasurementLineEvent>
    implements _$$AddToMeasurementLineEventCopyWith<$Res> {
  __$$AddToMeasurementLineEventCopyWithImpl(_$AddToMeasurementLineEvent _value,
      $Res Function(_$AddToMeasurementLineEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorId = null,
    Object? type = null,
    Object? index = freezed,
    Object? measurementLineIndex = freezed,
    Object? filteredMeasurementMeasureId = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? number = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$AddToMeasurementLineEvent(
      sorId: null == sorId
          ? _value.sorId
          : sorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      measurementLineIndex: freezed == measurementLineIndex
          ? _value.measurementLineIndex
          : measurementLineIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      filteredMeasurementMeasureId: freezed == filteredMeasurementMeasureId
          ? _value.filteredMeasurementMeasureId
          : filteredMeasurementMeasureId // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as dynamic,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$AddToMeasurementLineEvent implements AddToMeasurementLineEvent {
  const _$AddToMeasurementLineEvent(
      {required this.sorId,
      required this.type,
      this.index,
      this.measurementLineIndex,
      this.filteredMeasurementMeasureId,
      this.height,
      this.width,
      this.length,
      this.number,
      this.quantity});

  @override
  final String sorId;
  @override
  final String type;
  @override
  final int? index;
  @override
  final int? measurementLineIndex;
  @override
  final String? filteredMeasurementMeasureId;
  @override
  final dynamic height;
  @override
  final dynamic width;
  @override
  final dynamic length;
  @override
  final dynamic number;
  @override
  final dynamic quantity;

  @override
  String toString() {
    return 'MeasurementDetailBlocEvent.addToMeasurementLineList(sorId: $sorId, type: $type, index: $index, measurementLineIndex: $measurementLineIndex, filteredMeasurementMeasureId: $filteredMeasurementMeasureId, height: $height, width: $width, length: $length, number: $number, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToMeasurementLineEvent &&
            (identical(other.sorId, sorId) || other.sorId == sorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.measurementLineIndex, measurementLineIndex) ||
                other.measurementLineIndex == measurementLineIndex) &&
            (identical(other.filteredMeasurementMeasureId,
                    filteredMeasurementMeasureId) ||
                other.filteredMeasurementMeasureId ==
                    filteredMeasurementMeasureId) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sorId,
      type,
      index,
      measurementLineIndex,
      filteredMeasurementMeasureId,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToMeasurementLineEventCopyWith<_$AddToMeasurementLineEvent>
      get copyWith => __$$AddToMeasurementLineEventCopyWithImpl<
          _$AddToMeasurementLineEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tenantId, String contractNumber, String measurementNumber)
        create,
    required TResult Function() clear,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        addToMeasurementLineList,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        updateToMeasurementLineList,
  }) {
    return addToMeasurementLineList(sorId, type, index, measurementLineIndex,
        filteredMeasurementMeasureId, height, width, length, number, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult? Function()? clear,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
  }) {
    return addToMeasurementLineList?.call(
        sorId,
        type,
        index,
        measurementLineIndex,
        filteredMeasurementMeasureId,
        height,
        width,
        length,
        number,
        quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult Function()? clear,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (addToMeasurementLineList != null) {
      return addToMeasurementLineList(
          sorId,
          type,
          index,
          measurementLineIndex,
          filteredMeasurementMeasureId,
          height,
          width,
          length,
          number,
          quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementDetailBookBlocEvent value) create,
    required TResult Function(MeasurementDetailBlocClearEvent value) clear,
    required TResult Function(AddToMeasurementLineEvent value)
        addToMeasurementLineList,
    required TResult Function(UpdateToMeasurementLineEvent value)
        updateToMeasurementLineList,
  }) {
    return addToMeasurementLineList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementDetailBookBlocEvent value)? create,
    TResult? Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult? Function(AddToMeasurementLineEvent value)?
        addToMeasurementLineList,
    TResult? Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
  }) {
    return addToMeasurementLineList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementDetailBookBlocEvent value)? create,
    TResult Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult Function(AddToMeasurementLineEvent value)? addToMeasurementLineList,
    TResult Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (addToMeasurementLineList != null) {
      return addToMeasurementLineList(this);
    }
    return orElse();
  }
}

abstract class AddToMeasurementLineEvent implements MeasurementDetailBlocEvent {
  const factory AddToMeasurementLineEvent(
      {required final String sorId,
      required final String type,
      final int? index,
      final int? measurementLineIndex,
      final String? filteredMeasurementMeasureId,
      final dynamic height,
      final dynamic width,
      final dynamic length,
      final dynamic number,
      final dynamic quantity}) = _$AddToMeasurementLineEvent;

  String get sorId;
  String get type;
  int? get index;
  int? get measurementLineIndex;
  String? get filteredMeasurementMeasureId;
  dynamic get height;
  dynamic get width;
  dynamic get length;
  dynamic get number;
  dynamic get quantity;
  @JsonKey(ignore: true)
  _$$AddToMeasurementLineEventCopyWith<_$AddToMeasurementLineEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateToMeasurementLineEventCopyWith<$Res> {
  factory _$$UpdateToMeasurementLineEventCopyWith(
          _$UpdateToMeasurementLineEvent value,
          $Res Function(_$UpdateToMeasurementLineEvent) then) =
      __$$UpdateToMeasurementLineEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String sorId,
      String type,
      int? index,
      int? measurementLineIndex,
      String? filteredMeasurementMeasureId,
      dynamic height,
      dynamic width,
      dynamic length,
      dynamic number,
      dynamic quantity});
}

/// @nodoc
class __$$UpdateToMeasurementLineEventCopyWithImpl<$Res>
    extends _$MeasurementDetailBlocEventCopyWithImpl<$Res,
        _$UpdateToMeasurementLineEvent>
    implements _$$UpdateToMeasurementLineEventCopyWith<$Res> {
  __$$UpdateToMeasurementLineEventCopyWithImpl(
      _$UpdateToMeasurementLineEvent _value,
      $Res Function(_$UpdateToMeasurementLineEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sorId = null,
    Object? type = null,
    Object? index = freezed,
    Object? measurementLineIndex = freezed,
    Object? filteredMeasurementMeasureId = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? number = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$UpdateToMeasurementLineEvent(
      sorId: null == sorId
          ? _value.sorId
          : sorId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      measurementLineIndex: freezed == measurementLineIndex
          ? _value.measurementLineIndex
          : measurementLineIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      filteredMeasurementMeasureId: freezed == filteredMeasurementMeasureId
          ? _value.filteredMeasurementMeasureId
          : filteredMeasurementMeasureId // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as dynamic,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as dynamic,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$UpdateToMeasurementLineEvent implements UpdateToMeasurementLineEvent {
  const _$UpdateToMeasurementLineEvent(
      {required this.sorId,
      required this.type,
      this.index,
      this.measurementLineIndex,
      this.filteredMeasurementMeasureId,
      this.height,
      this.width,
      this.length,
      this.number,
      this.quantity});

  @override
  final String sorId;
  @override
  final String type;
  @override
  final int? index;
  @override
  final int? measurementLineIndex;
  @override
  final String? filteredMeasurementMeasureId;
  @override
  final dynamic height;
  @override
  final dynamic width;
  @override
  final dynamic length;
  @override
  final dynamic number;
  @override
  final dynamic quantity;

  @override
  String toString() {
    return 'MeasurementDetailBlocEvent.updateToMeasurementLineList(sorId: $sorId, type: $type, index: $index, measurementLineIndex: $measurementLineIndex, filteredMeasurementMeasureId: $filteredMeasurementMeasureId, height: $height, width: $width, length: $length, number: $number, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateToMeasurementLineEvent &&
            (identical(other.sorId, sorId) || other.sorId == sorId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.measurementLineIndex, measurementLineIndex) ||
                other.measurementLineIndex == measurementLineIndex) &&
            (identical(other.filteredMeasurementMeasureId,
                    filteredMeasurementMeasureId) ||
                other.filteredMeasurementMeasureId ==
                    filteredMeasurementMeasureId) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.quantity, quantity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sorId,
      type,
      index,
      measurementLineIndex,
      filteredMeasurementMeasureId,
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(quantity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateToMeasurementLineEventCopyWith<_$UpdateToMeasurementLineEvent>
      get copyWith => __$$UpdateToMeasurementLineEventCopyWithImpl<
          _$UpdateToMeasurementLineEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String tenantId, String contractNumber, String measurementNumber)
        create,
    required TResult Function() clear,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        addToMeasurementLineList,
    required TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)
        updateToMeasurementLineList,
  }) {
    return updateToMeasurementLineList(sorId, type, index, measurementLineIndex,
        filteredMeasurementMeasureId, height, width, length, number, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult? Function()? clear,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult? Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
  }) {
    return updateToMeasurementLineList?.call(
        sorId,
        type,
        index,
        measurementLineIndex,
        filteredMeasurementMeasureId,
        height,
        width,
        length,
        number,
        quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String tenantId, String contractNumber, String measurementNumber)?
        create,
    TResult Function()? clear,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        addToMeasurementLineList,
    TResult Function(
            String sorId,
            String type,
            int? index,
            int? measurementLineIndex,
            String? filteredMeasurementMeasureId,
            dynamic height,
            dynamic width,
            dynamic length,
            dynamic number,
            dynamic quantity)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (updateToMeasurementLineList != null) {
      return updateToMeasurementLineList(
          sorId,
          type,
          index,
          measurementLineIndex,
          filteredMeasurementMeasureId,
          height,
          width,
          length,
          number,
          quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementDetailBookBlocEvent value) create,
    required TResult Function(MeasurementDetailBlocClearEvent value) clear,
    required TResult Function(AddToMeasurementLineEvent value)
        addToMeasurementLineList,
    required TResult Function(UpdateToMeasurementLineEvent value)
        updateToMeasurementLineList,
  }) {
    return updateToMeasurementLineList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementDetailBookBlocEvent value)? create,
    TResult? Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult? Function(AddToMeasurementLineEvent value)?
        addToMeasurementLineList,
    TResult? Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
  }) {
    return updateToMeasurementLineList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementDetailBookBlocEvent value)? create,
    TResult Function(MeasurementDetailBlocClearEvent value)? clear,
    TResult Function(AddToMeasurementLineEvent value)? addToMeasurementLineList,
    TResult Function(UpdateToMeasurementLineEvent value)?
        updateToMeasurementLineList,
    required TResult orElse(),
  }) {
    if (updateToMeasurementLineList != null) {
      return updateToMeasurementLineList(this);
    }
    return orElse();
  }
}

abstract class UpdateToMeasurementLineEvent
    implements MeasurementDetailBlocEvent {
  const factory UpdateToMeasurementLineEvent(
      {required final String sorId,
      required final String type,
      final int? index,
      final int? measurementLineIndex,
      final String? filteredMeasurementMeasureId,
      final dynamic height,
      final dynamic width,
      final dynamic length,
      final dynamic number,
      final dynamic quantity}) = _$UpdateToMeasurementLineEvent;

  String get sorId;
  String get type;
  int? get index;
  int? get measurementLineIndex;
  String? get filteredMeasurementMeasureId;
  dynamic get height;
  dynamic get width;
  dynamic get length;
  dynamic get number;
  dynamic get quantity;
  @JsonKey(ignore: true)
  _$$UpdateToMeasurementLineEventCopyWith<_$UpdateToMeasurementLineEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MeasurementDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)
        loaded,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementDetailStateCopyWith<$Res> {
  factory $MeasurementDetailStateCopyWith(MeasurementDetailState value,
          $Res Function(MeasurementDetailState) then) =
      _$MeasurementDetailStateCopyWithImpl<$Res, MeasurementDetailState>;
}

/// @nodoc
class _$MeasurementDetailStateCopyWithImpl<$Res,
        $Val extends MeasurementDetailState>
    implements $MeasurementDetailStateCopyWith<$Res> {
  _$MeasurementDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MeasurementDetailStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'MeasurementDetailState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends MeasurementDetailState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MeasurementDetailStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'MeasurementDetailState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends MeasurementDetailState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Measurement rawData,
      List<FilteredMeasurements> data,
      List<SorObject>? sor,
      List<SorObject>? nonSor,
      List<SorObject>? preSor,
      List<SorObject>? preNonSor});

  $MeasurementCopyWith<$Res> get rawData;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$MeasurementDetailStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rawData = null,
    Object? data = null,
    Object? sor = freezed,
    Object? nonSor = freezed,
    Object? preSor = freezed,
    Object? preNonSor = freezed,
  }) {
    return _then(_$_Loaded(
      null == rawData
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as Measurement,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FilteredMeasurements>,
      freezed == sor
          ? _value._sor
          : sor // ignore: cast_nullable_to_non_nullable
              as List<SorObject>?,
      freezed == nonSor
          ? _value._nonSor
          : nonSor // ignore: cast_nullable_to_non_nullable
              as List<SorObject>?,
      freezed == preSor
          ? _value._preSor
          : preSor // ignore: cast_nullable_to_non_nullable
              as List<SorObject>?,
      freezed == preNonSor
          ? _value._preNonSor
          : preNonSor // ignore: cast_nullable_to_non_nullable
              as List<SorObject>?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementCopyWith<$Res> get rawData {
    return $MeasurementCopyWith<$Res>(_value.rawData, (value) {
      return _then(_value.copyWith(rawData: value));
    });
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(
      this.rawData,
      final List<FilteredMeasurements> data,
      final List<SorObject>? sor,
      final List<SorObject>? nonSor,
      final List<SorObject>? preSor,
      final List<SorObject>? preNonSor)
      : _data = data,
        _sor = sor,
        _nonSor = nonSor,
        _preSor = preSor,
        _preNonSor = preNonSor,
        super._();

  @override
  final Measurement rawData;
  final List<FilteredMeasurements> _data;
  @override
  List<FilteredMeasurements> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<SorObject>? _sor;
  @override
  List<SorObject>? get sor {
    final value = _sor;
    if (value == null) return null;
    if (_sor is EqualUnmodifiableListView) return _sor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SorObject>? _nonSor;
  @override
  List<SorObject>? get nonSor {
    final value = _nonSor;
    if (value == null) return null;
    if (_nonSor is EqualUnmodifiableListView) return _nonSor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SorObject>? _preSor;
  @override
  List<SorObject>? get preSor {
    final value = _preSor;
    if (value == null) return null;
    if (_preSor is EqualUnmodifiableListView) return _preSor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SorObject>? _preNonSor;
  @override
  List<SorObject>? get preNonSor {
    final value = _preNonSor;
    if (value == null) return null;
    if (_preNonSor is EqualUnmodifiableListView) return _preNonSor;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MeasurementDetailState.loaded(rawData: $rawData, data: $data, sor: $sor, nonSor: $nonSor, preSor: $preSor, preNonSor: $preNonSor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.rawData, rawData) || other.rawData == rawData) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._sor, _sor) &&
            const DeepCollectionEquality().equals(other._nonSor, _nonSor) &&
            const DeepCollectionEquality().equals(other._preSor, _preSor) &&
            const DeepCollectionEquality()
                .equals(other._preNonSor, _preNonSor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      rawData,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_sor),
      const DeepCollectionEquality().hash(_nonSor),
      const DeepCollectionEquality().hash(_preSor),
      const DeepCollectionEquality().hash(_preNonSor));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loaded(rawData, data, sor, nonSor, preSor, preNonSor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loaded?.call(rawData, data, sor, nonSor, preSor, preNonSor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(rawData, data, sor, nonSor, preSor, preNonSor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends MeasurementDetailState {
  const factory _Loaded(
      final Measurement rawData,
      final List<FilteredMeasurements> data,
      final List<SorObject>? sor,
      final List<SorObject>? nonSor,
      final List<SorObject>? preSor,
      final List<SorObject>? preNonSor) = _$_Loaded;
  const _Loaded._() : super._();

  Measurement get rawData;
  List<FilteredMeasurements> get data;
  List<SorObject>? get sor;
  List<SorObject>? get nonSor;
  List<SorObject>? get preSor;
  List<SorObject>? get preNonSor;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$MeasurementDetailStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_Error(
      freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Error extends _Error {
  const _$_Error(this.error) : super._();

  @override
  final String? error;

  @override
  String toString() {
    return 'MeasurementDetailState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            Measurement rawData,
            List<FilteredMeasurements> data,
            List<SorObject>? sor,
            List<SorObject>? nonSor,
            List<SorObject>? preSor,
            List<SorObject>? preNonSor)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends MeasurementDetailState {
  const factory _Error(final String? error) = _$_Error;
  const _Error._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

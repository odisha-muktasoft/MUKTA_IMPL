// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_business_workflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BusinessWorkflowEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService) get,
    required TResult Function() dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService)? get,
    TResult? Function()? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService)? get,
    TResult Function()? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBusinessWorkflowEvent value) get,
    required TResult Function(DisposeBusinessWorkflowEvent value) dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBusinessWorkflowEvent value)? get,
    TResult? Function(DisposeBusinessWorkflowEvent value)? dispose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBusinessWorkflowEvent value)? get,
    TResult Function(DisposeBusinessWorkflowEvent value)? dispose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessWorkflowEventCopyWith<$Res> {
  factory $BusinessWorkflowEventCopyWith(BusinessWorkflowEvent value,
          $Res Function(BusinessWorkflowEvent) then) =
      _$BusinessWorkflowEventCopyWithImpl<$Res, BusinessWorkflowEvent>;
}

/// @nodoc
class _$BusinessWorkflowEventCopyWithImpl<$Res,
        $Val extends BusinessWorkflowEvent>
    implements $BusinessWorkflowEventCopyWith<$Res> {
  _$BusinessWorkflowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBusinessWorkflowEventImplCopyWith<$Res> {
  factory _$$GetBusinessWorkflowEventImplCopyWith(
          _$GetBusinessWorkflowEventImpl value,
          $Res Function(_$GetBusinessWorkflowEventImpl) then) =
      __$$GetBusinessWorkflowEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tenantId, String businessService});
}

/// @nodoc
class __$$GetBusinessWorkflowEventImplCopyWithImpl<$Res>
    extends _$BusinessWorkflowEventCopyWithImpl<$Res,
        _$GetBusinessWorkflowEventImpl>
    implements _$$GetBusinessWorkflowEventImplCopyWith<$Res> {
  __$$GetBusinessWorkflowEventImplCopyWithImpl(
      _$GetBusinessWorkflowEventImpl _value,
      $Res Function(_$GetBusinessWorkflowEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? businessService = null,
  }) {
    return _then(_$GetBusinessWorkflowEventImpl(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      businessService: null == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetBusinessWorkflowEventImpl implements GetBusinessWorkflowEvent {
  const _$GetBusinessWorkflowEventImpl(
      {required this.tenantId, required this.businessService});

  @override
  final String tenantId;
  @override
  final String businessService;

  @override
  String toString() {
    return 'BusinessWorkflowEvent.get(tenantId: $tenantId, businessService: $businessService)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBusinessWorkflowEventImpl &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenantId, businessService);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBusinessWorkflowEventImplCopyWith<_$GetBusinessWorkflowEventImpl>
      get copyWith => __$$GetBusinessWorkflowEventImplCopyWithImpl<
          _$GetBusinessWorkflowEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService) get,
    required TResult Function() dispose,
  }) {
    return get(tenantId, businessService);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService)? get,
    TResult? Function()? dispose,
  }) {
    return get?.call(tenantId, businessService);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService)? get,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(tenantId, businessService);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBusinessWorkflowEvent value) get,
    required TResult Function(DisposeBusinessWorkflowEvent value) dispose,
  }) {
    return get(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBusinessWorkflowEvent value)? get,
    TResult? Function(DisposeBusinessWorkflowEvent value)? dispose,
  }) {
    return get?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBusinessWorkflowEvent value)? get,
    TResult Function(DisposeBusinessWorkflowEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (get != null) {
      return get(this);
    }
    return orElse();
  }
}

abstract class GetBusinessWorkflowEvent implements BusinessWorkflowEvent {
  const factory GetBusinessWorkflowEvent(
      {required final String tenantId,
      required final String businessService}) = _$GetBusinessWorkflowEventImpl;

  String get tenantId;
  String get businessService;
  @JsonKey(ignore: true)
  _$$GetBusinessWorkflowEventImplCopyWith<_$GetBusinessWorkflowEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisposeBusinessWorkflowEventImplCopyWith<$Res> {
  factory _$$DisposeBusinessWorkflowEventImplCopyWith(
          _$DisposeBusinessWorkflowEventImpl value,
          $Res Function(_$DisposeBusinessWorkflowEventImpl) then) =
      __$$DisposeBusinessWorkflowEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeBusinessWorkflowEventImplCopyWithImpl<$Res>
    extends _$BusinessWorkflowEventCopyWithImpl<$Res,
        _$DisposeBusinessWorkflowEventImpl>
    implements _$$DisposeBusinessWorkflowEventImplCopyWith<$Res> {
  __$$DisposeBusinessWorkflowEventImplCopyWithImpl(
      _$DisposeBusinessWorkflowEventImpl _value,
      $Res Function(_$DisposeBusinessWorkflowEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisposeBusinessWorkflowEventImpl
    implements DisposeBusinessWorkflowEvent {
  const _$DisposeBusinessWorkflowEventImpl();

  @override
  String toString() {
    return 'BusinessWorkflowEvent.dispose()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisposeBusinessWorkflowEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService) get,
    required TResult Function() dispose,
  }) {
    return dispose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService)? get,
    TResult? Function()? dispose,
  }) {
    return dispose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService)? get,
    TResult Function()? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetBusinessWorkflowEvent value) get,
    required TResult Function(DisposeBusinessWorkflowEvent value) dispose,
  }) {
    return dispose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetBusinessWorkflowEvent value)? get,
    TResult? Function(DisposeBusinessWorkflowEvent value)? dispose,
  }) {
    return dispose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetBusinessWorkflowEvent value)? get,
    TResult Function(DisposeBusinessWorkflowEvent value)? dispose,
    required TResult orElse(),
  }) {
    if (dispose != null) {
      return dispose(this);
    }
    return orElse();
  }
}

abstract class DisposeBusinessWorkflowEvent implements BusinessWorkflowEvent {
  const factory DisposeBusinessWorkflowEvent() =
      _$DisposeBusinessWorkflowEventImpl;
}

/// @nodoc
mixin _$BusinessGetWorkflowState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            BusinessServiceWorkflowModel? businessWorkFlowModel)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult Function()? error,
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
abstract class $BusinessGetWorkflowStateCopyWith<$Res> {
  factory $BusinessGetWorkflowStateCopyWith(BusinessGetWorkflowState value,
          $Res Function(BusinessGetWorkflowState) then) =
      _$BusinessGetWorkflowStateCopyWithImpl<$Res, BusinessGetWorkflowState>;
}

/// @nodoc
class _$BusinessGetWorkflowStateCopyWithImpl<$Res,
        $Val extends BusinessGetWorkflowState>
    implements $BusinessGetWorkflowStateCopyWith<$Res> {
  _$BusinessGetWorkflowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BusinessGetWorkflowStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl() : super._();

  @override
  String toString() {
    return 'BusinessGetWorkflowState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            BusinessServiceWorkflowModel? businessWorkFlowModel)
        loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult Function()? error,
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

abstract class _Initial extends BusinessGetWorkflowState {
  const factory _Initial() = _$InitialImpl;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BusinessGetWorkflowStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'BusinessGetWorkflowState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            BusinessServiceWorkflowModel? businessWorkFlowModel)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult Function()? error,
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

abstract class _Loading extends BusinessGetWorkflowState {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BusinessServiceWorkflowModel? businessWorkFlowModel});

  $BusinessServiceWorkflowModelCopyWith<$Res>? get businessWorkFlowModel;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BusinessGetWorkflowStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? businessWorkFlowModel = freezed,
  }) {
    return _then(_$LoadedImpl(
      businessWorkFlowModel: freezed == businessWorkFlowModel
          ? _value.businessWorkFlowModel
          : businessWorkFlowModel // ignore: cast_nullable_to_non_nullable
              as BusinessServiceWorkflowModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessServiceWorkflowModelCopyWith<$Res>? get businessWorkFlowModel {
    if (_value.businessWorkFlowModel == null) {
      return null;
    }

    return $BusinessServiceWorkflowModelCopyWith<$Res>(
        _value.businessWorkFlowModel!, (value) {
      return _then(_value.copyWith(businessWorkFlowModel: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl extends _Loaded {
  const _$LoadedImpl({this.businessWorkFlowModel}) : super._();

  @override
  final BusinessServiceWorkflowModel? businessWorkFlowModel;

  @override
  String toString() {
    return 'BusinessGetWorkflowState.loaded(businessWorkFlowModel: $businessWorkFlowModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.businessWorkFlowModel, businessWorkFlowModel) ||
                other.businessWorkFlowModel == businessWorkFlowModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, businessWorkFlowModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            BusinessServiceWorkflowModel? businessWorkFlowModel)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(businessWorkFlowModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(businessWorkFlowModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(businessWorkFlowModel);
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

abstract class _Loaded extends BusinessGetWorkflowState {
  const factory _Loaded(
          {final BusinessServiceWorkflowModel? businessWorkFlowModel}) =
      _$LoadedImpl;
  const _Loaded._() : super._();

  BusinessServiceWorkflowModel? get businessWorkFlowModel;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BusinessGetWorkflowStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'BusinessGetWorkflowState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            BusinessServiceWorkflowModel? businessWorkFlowModel)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(BusinessServiceWorkflowModel? businessWorkFlowModel)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
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

abstract class _Error extends BusinessGetWorkflowState {
  const factory _Error() = _$ErrorImpl;
  const _Error._() : super._();
}

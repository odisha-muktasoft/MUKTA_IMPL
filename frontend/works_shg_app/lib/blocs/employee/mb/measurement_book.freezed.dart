// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MeasurementInboxBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementBookInboxBlocEvent value) create,
    required TResult Function(MeasurementBookInboxSearchBlocEvent value) search,
    required TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(MeasurementBookInboxBlocClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementBookInboxBlocEvent value)? create,
    TResult? Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult? Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult? Function(MeasurementBookInboxBlocClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementBookInboxBlocEvent value)? create,
    TResult Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult Function(MeasurementBookInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementInboxBlocEventCopyWith<$Res> {
  factory $MeasurementInboxBlocEventCopyWith(MeasurementInboxBlocEvent value,
          $Res Function(MeasurementInboxBlocEvent) then) =
      _$MeasurementInboxBlocEventCopyWithImpl<$Res, MeasurementInboxBlocEvent>;
}

/// @nodoc
class _$MeasurementInboxBlocEventCopyWithImpl<$Res,
        $Val extends MeasurementInboxBlocEvent>
    implements $MeasurementInboxBlocEventCopyWith<$Res> {
  _$MeasurementInboxBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MeasurementBookInboxBlocEventCopyWith<$Res> {
  factory _$$MeasurementBookInboxBlocEventCopyWith(
          _$MeasurementBookInboxBlocEvent value,
          $Res Function(_$MeasurementBookInboxBlocEvent) then) =
      __$$MeasurementBookInboxBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String tenantId,
      String businessService,
      String moduleName,
      int limit,
      int offset});
}

/// @nodoc
class __$$MeasurementBookInboxBlocEventCopyWithImpl<$Res>
    extends _$MeasurementInboxBlocEventCopyWithImpl<$Res,
        _$MeasurementBookInboxBlocEvent>
    implements _$$MeasurementBookInboxBlocEventCopyWith<$Res> {
  __$$MeasurementBookInboxBlocEventCopyWithImpl(
      _$MeasurementBookInboxBlocEvent _value,
      $Res Function(_$MeasurementBookInboxBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? businessService = null,
    Object? moduleName = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$MeasurementBookInboxBlocEvent(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      businessService: null == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MeasurementBookInboxBlocEvent implements MeasurementBookInboxBlocEvent {
  const _$MeasurementBookInboxBlocEvent(
      {required this.tenantId,
      required this.businessService,
      required this.moduleName,
      required this.limit,
      required this.offset});

  @override
  final String tenantId;
  @override
  final String businessService;
  @override
  final String moduleName;
  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'MeasurementInboxBlocEvent.create(tenantId: $tenantId, businessService: $businessService, moduleName: $moduleName, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementBookInboxBlocEvent &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tenantId, businessService, moduleName, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementBookInboxBlocEventCopyWith<_$MeasurementBookInboxBlocEvent>
      get copyWith => __$$MeasurementBookInboxBlocEventCopyWithImpl<
          _$MeasurementBookInboxBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return create(tenantId, businessService, moduleName, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return create?.call(tenantId, businessService, moduleName, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(tenantId, businessService, moduleName, limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementBookInboxBlocEvent value) create,
    required TResult Function(MeasurementBookInboxSearchBlocEvent value) search,
    required TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(MeasurementBookInboxBlocClearEvent value) clear,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementBookInboxBlocEvent value)? create,
    TResult? Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult? Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult? Function(MeasurementBookInboxBlocClearEvent value)? clear,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementBookInboxBlocEvent value)? create,
    TResult Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult Function(MeasurementBookInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class MeasurementBookInboxBlocEvent
    implements MeasurementInboxBlocEvent {
  const factory MeasurementBookInboxBlocEvent(
      {required final String tenantId,
      required final String businessService,
      required final String moduleName,
      required final int limit,
      required final int offset}) = _$MeasurementBookInboxBlocEvent;

  String get tenantId;
  String get businessService;
  String get moduleName;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$MeasurementBookInboxBlocEventCopyWith<_$MeasurementBookInboxBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeasurementBookInboxSearchBlocEventCopyWith<$Res> {
  factory _$$MeasurementBookInboxSearchBlocEventCopyWith(
          _$MeasurementBookInboxSearchBlocEvent value,
          $Res Function(_$MeasurementBookInboxSearchBlocEvent) then) =
      __$$MeasurementBookInboxSearchBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? ward,
      List<String>? status,
      String? projectId,
      String? mbNumber,
      String? projectName,
      int limit,
      int offset,
      Map<String, Map<String, dynamic>> data});
}

/// @nodoc
class __$$MeasurementBookInboxSearchBlocEventCopyWithImpl<$Res>
    extends _$MeasurementInboxBlocEventCopyWithImpl<$Res,
        _$MeasurementBookInboxSearchBlocEvent>
    implements _$$MeasurementBookInboxSearchBlocEventCopyWith<$Res> {
  __$$MeasurementBookInboxSearchBlocEventCopyWithImpl(
      _$MeasurementBookInboxSearchBlocEvent _value,
      $Res Function(_$MeasurementBookInboxSearchBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ward = freezed,
    Object? status = freezed,
    Object? projectId = freezed,
    Object? mbNumber = freezed,
    Object? projectName = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? data = null,
  }) {
    return _then(_$MeasurementBookInboxSearchBlocEvent(
      ward: freezed == ward
          ? _value._ward
          : ward // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      mbNumber: freezed == mbNumber
          ? _value.mbNumber
          : mbNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$MeasurementBookInboxSearchBlocEvent
    implements MeasurementBookInboxSearchBlocEvent {
  const _$MeasurementBookInboxSearchBlocEvent(
      {final List<String>? ward,
      final List<String>? status,
      this.projectId,
      this.mbNumber,
      this.projectName,
      required this.limit,
      required this.offset,
      required final Map<String, Map<String, dynamic>> data})
      : _ward = ward,
        _status = status,
        _data = data;

  final List<String>? _ward;
  @override
  List<String>? get ward {
    final value = _ward;
    if (value == null) return null;
    if (_ward is EqualUnmodifiableListView) return _ward;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _status;
  @override
  List<String>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? projectId;
  @override
  final String? mbNumber;
  @override
  final String? projectName;
  @override
  final int limit;
  @override
  final int offset;
  final Map<String, Map<String, dynamic>> _data;
  @override
  Map<String, Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'MeasurementInboxBlocEvent.search(ward: $ward, status: $status, projectId: $projectId, mbNumber: $mbNumber, projectName: $projectName, limit: $limit, offset: $offset, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementBookInboxSearchBlocEvent &&
            const DeepCollectionEquality().equals(other._ward, _ward) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.mbNumber, mbNumber) ||
                other.mbNumber == mbNumber) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ward),
      const DeepCollectionEquality().hash(_status),
      projectId,
      mbNumber,
      projectName,
      limit,
      offset,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementBookInboxSearchBlocEventCopyWith<
          _$MeasurementBookInboxSearchBlocEvent>
      get copyWith => __$$MeasurementBookInboxSearchBlocEventCopyWithImpl<
          _$MeasurementBookInboxSearchBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return search(
        ward, status, projectId, mbNumber, projectName, limit, offset, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return search?.call(
        ward, status, projectId, mbNumber, projectName, limit, offset, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(
          ward, status, projectId, mbNumber, projectName, limit, offset, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementBookInboxBlocEvent value) create,
    required TResult Function(MeasurementBookInboxSearchBlocEvent value) search,
    required TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(MeasurementBookInboxBlocClearEvent value) clear,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementBookInboxBlocEvent value)? create,
    TResult? Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult? Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult? Function(MeasurementBookInboxBlocClearEvent value)? clear,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementBookInboxBlocEvent value)? create,
    TResult Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult Function(MeasurementBookInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class MeasurementBookInboxSearchBlocEvent
    implements MeasurementInboxBlocEvent {
  const factory MeasurementBookInboxSearchBlocEvent(
          {final List<String>? ward,
          final List<String>? status,
          final String? projectId,
          final String? mbNumber,
          final String? projectName,
          required final int limit,
          required final int offset,
          required final Map<String, Map<String, dynamic>> data}) =
      _$MeasurementBookInboxSearchBlocEvent;

  List<String>? get ward;
  List<String>? get status;
  String? get projectId;
  String? get mbNumber;
  String? get projectName;
  int get limit;
  int get offset;
  Map<String, Map<String, dynamic>> get data;
  @JsonKey(ignore: true)
  _$$MeasurementBookInboxSearchBlocEventCopyWith<
          _$MeasurementBookInboxSearchBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeasurementBookInboxSearchRepeatBlocEventCopyWith<$Res> {
  factory _$$MeasurementBookInboxSearchRepeatBlocEventCopyWith(
          _$MeasurementBookInboxSearchRepeatBlocEvent value,
          $Res Function(_$MeasurementBookInboxSearchRepeatBlocEvent) then) =
      __$$MeasurementBookInboxSearchRepeatBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String tenantId,
      String businessService,
      String moduleName,
      int limit,
      int offset});
}

/// @nodoc
class __$$MeasurementBookInboxSearchRepeatBlocEventCopyWithImpl<$Res>
    extends _$MeasurementInboxBlocEventCopyWithImpl<$Res,
        _$MeasurementBookInboxSearchRepeatBlocEvent>
    implements _$$MeasurementBookInboxSearchRepeatBlocEventCopyWith<$Res> {
  __$$MeasurementBookInboxSearchRepeatBlocEventCopyWithImpl(
      _$MeasurementBookInboxSearchRepeatBlocEvent _value,
      $Res Function(_$MeasurementBookInboxSearchRepeatBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? businessService = null,
    Object? moduleName = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$MeasurementBookInboxSearchRepeatBlocEvent(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      businessService: null == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MeasurementBookInboxSearchRepeatBlocEvent
    implements MeasurementBookInboxSearchRepeatBlocEvent {
  const _$MeasurementBookInboxSearchRepeatBlocEvent(
      {required this.tenantId,
      required this.businessService,
      required this.moduleName,
      required this.limit,
      required this.offset});

  @override
  final String tenantId;
  @override
  final String businessService;
  @override
  final String moduleName;
  @override
  final int limit;
  @override
  final int offset;

  @override
  String toString() {
    return 'MeasurementInboxBlocEvent.searchRepeat(tenantId: $tenantId, businessService: $businessService, moduleName: $moduleName, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementBookInboxSearchRepeatBlocEvent &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, tenantId, businessService, moduleName, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementBookInboxSearchRepeatBlocEventCopyWith<
          _$MeasurementBookInboxSearchRepeatBlocEvent>
      get copyWith => __$$MeasurementBookInboxSearchRepeatBlocEventCopyWithImpl<
          _$MeasurementBookInboxSearchRepeatBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return searchRepeat(tenantId, businessService, moduleName, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return searchRepeat?.call(
        tenantId, businessService, moduleName, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (searchRepeat != null) {
      return searchRepeat(tenantId, businessService, moduleName, limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MeasurementBookInboxBlocEvent value) create,
    required TResult Function(MeasurementBookInboxSearchBlocEvent value) search,
    required TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(MeasurementBookInboxBlocClearEvent value) clear,
  }) {
    return searchRepeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementBookInboxBlocEvent value)? create,
    TResult? Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult? Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult? Function(MeasurementBookInboxBlocClearEvent value)? clear,
  }) {
    return searchRepeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementBookInboxBlocEvent value)? create,
    TResult Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult Function(MeasurementBookInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchRepeat != null) {
      return searchRepeat(this);
    }
    return orElse();
  }
}

abstract class MeasurementBookInboxSearchRepeatBlocEvent
    implements MeasurementInboxBlocEvent {
  const factory MeasurementBookInboxSearchRepeatBlocEvent(
      {required final String tenantId,
      required final String businessService,
      required final String moduleName,
      required final int limit,
      required final int offset}) = _$MeasurementBookInboxSearchRepeatBlocEvent;

  String get tenantId;
  String get businessService;
  String get moduleName;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$MeasurementBookInboxSearchRepeatBlocEventCopyWith<
          _$MeasurementBookInboxSearchRepeatBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeasurementBookInboxBlocClearEventCopyWith<$Res> {
  factory _$$MeasurementBookInboxBlocClearEventCopyWith(
          _$MeasurementBookInboxBlocClearEvent value,
          $Res Function(_$MeasurementBookInboxBlocClearEvent) then) =
      __$$MeasurementBookInboxBlocClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MeasurementBookInboxBlocClearEventCopyWithImpl<$Res>
    extends _$MeasurementInboxBlocEventCopyWithImpl<$Res,
        _$MeasurementBookInboxBlocClearEvent>
    implements _$$MeasurementBookInboxBlocClearEventCopyWith<$Res> {
  __$$MeasurementBookInboxBlocClearEventCopyWithImpl(
      _$MeasurementBookInboxBlocClearEvent _value,
      $Res Function(_$MeasurementBookInboxBlocClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MeasurementBookInboxBlocClearEvent
    implements MeasurementBookInboxBlocClearEvent {
  const _$MeasurementBookInboxBlocClearEvent();

  @override
  String toString() {
    return 'MeasurementInboxBlocEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementBookInboxBlocClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, Map<String, dynamic>> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
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
    required TResult Function(MeasurementBookInboxBlocEvent value) create,
    required TResult Function(MeasurementBookInboxSearchBlocEvent value) search,
    required TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(MeasurementBookInboxBlocClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MeasurementBookInboxBlocEvent value)? create,
    TResult? Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult? Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult? Function(MeasurementBookInboxBlocClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MeasurementBookInboxBlocEvent value)? create,
    TResult Function(MeasurementBookInboxSearchBlocEvent value)? search,
    TResult Function(MeasurementBookInboxSearchRepeatBlocEvent value)?
        searchRepeat,
    TResult Function(MeasurementBookInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class MeasurementBookInboxBlocClearEvent
    implements MeasurementInboxBlocEvent {
  const factory MeasurementBookInboxBlocClearEvent() =
      _$MeasurementBookInboxBlocClearEvent;
}

/// @nodoc
mixin _$MeasurementInboxState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)
        loaded,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
        loaded,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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
abstract class $MeasurementInboxStateCopyWith<$Res> {
  factory $MeasurementInboxStateCopyWith(MeasurementInboxState value,
          $Res Function(MeasurementInboxState) then) =
      _$MeasurementInboxStateCopyWithImpl<$Res, MeasurementInboxState>;
}

/// @nodoc
class _$MeasurementInboxStateCopyWithImpl<$Res,
        $Val extends MeasurementInboxState>
    implements $MeasurementInboxStateCopyWith<$Res> {
  _$MeasurementInboxStateCopyWithImpl(this._value, this._then);

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
    extends _$MeasurementInboxStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'MeasurementInboxState.initial()';
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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

abstract class _Initial extends MeasurementInboxState {
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
    extends _$MeasurementInboxStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'MeasurementInboxState.loading()';
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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

abstract class _Loading extends MeasurementInboxState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MBInboxResponse mbInboxResponse,
      bool isLoading,
      List<String>? ward,
      List<String>? status,
      String? projectId,
      String? mbNumber,
      String? projectName,
      bool search,
      Map<String, Map<String, dynamic>> data});

  $MBInboxResponseCopyWith<$Res> get mbInboxResponse;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$MeasurementInboxStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbInboxResponse = null,
    Object? isLoading = null,
    Object? ward = freezed,
    Object? status = freezed,
    Object? projectId = freezed,
    Object? mbNumber = freezed,
    Object? projectName = freezed,
    Object? search = null,
    Object? data = null,
  }) {
    return _then(_$_Loaded(
      null == mbInboxResponse
          ? _value.mbInboxResponse
          : mbInboxResponse // ignore: cast_nullable_to_non_nullable
              as MBInboxResponse,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == ward
          ? _value._ward
          : ward // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == mbNumber
          ? _value.mbNumber
          : mbNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as bool,
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MBInboxResponseCopyWith<$Res> get mbInboxResponse {
    return $MBInboxResponseCopyWith<$Res>(_value.mbInboxResponse, (value) {
      return _then(_value.copyWith(mbInboxResponse: value));
    });
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(
      this.mbInboxResponse,
      this.isLoading,
      final List<String>? ward,
      final List<String>? status,
      this.projectId,
      this.mbNumber,
      this.projectName,
      this.search,
      final Map<String, Map<String, dynamic>> data)
      : _ward = ward,
        _status = status,
        _data = data,
        super._();

  @override
  final MBInboxResponse mbInboxResponse;
  @override
  final bool isLoading;
  final List<String>? _ward;
  @override
  List<String>? get ward {
    final value = _ward;
    if (value == null) return null;
    if (_ward is EqualUnmodifiableListView) return _ward;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _status;
  @override
  List<String>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? projectId;
  @override
  final String? mbNumber;
  @override
  final String? projectName;
  @override
  final bool search;
  final Map<String, Map<String, dynamic>> _data;
  @override
  Map<String, Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'MeasurementInboxState.loaded(mbInboxResponse: $mbInboxResponse, isLoading: $isLoading, ward: $ward, status: $status, projectId: $projectId, mbNumber: $mbNumber, projectName: $projectName, search: $search, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.mbInboxResponse, mbInboxResponse) ||
                other.mbInboxResponse == mbInboxResponse) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._ward, _ward) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.mbNumber, mbNumber) ||
                other.mbNumber == mbNumber) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mbInboxResponse,
      isLoading,
      const DeepCollectionEquality().hash(_ward),
      const DeepCollectionEquality().hash(_status),
      projectId,
      mbNumber,
      projectName,
      search,
      const DeepCollectionEquality().hash(_data));

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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loaded(mbInboxResponse, isLoading, ward, status, projectId, mbNumber,
        projectName, search, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loaded?.call(mbInboxResponse, isLoading, ward, status, projectId,
        mbNumber, projectName, search, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(mbInboxResponse, isLoading, ward, status, projectId,
          mbNumber, projectName, search, data);
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

abstract class _Loaded extends MeasurementInboxState {
  const factory _Loaded(
      final MBInboxResponse mbInboxResponse,
      final bool isLoading,
      final List<String>? ward,
      final List<String>? status,
      final String? projectId,
      final String? mbNumber,
      final String? projectName,
      final bool search,
      final Map<String, Map<String, dynamic>> data) = _$_Loaded;
  const _Loaded._() : super._();

  MBInboxResponse get mbInboxResponse;
  bool get isLoading;
  List<String>? get ward;
  List<String>? get status;
  String? get projectId;
  String? get mbNumber;
  String? get projectName;
  bool get search;
  Map<String, Map<String, dynamic>> get data;
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
    extends _$MeasurementInboxStateCopyWithImpl<$Res, _$_Error>
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
    return 'MeasurementInboxState.error(error: $error)';
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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
            MBInboxResponse mbInboxResponse,
            bool isLoading,
            List<String>? ward,
            List<String>? status,
            String? projectId,
            String? mbNumber,
            String? projectName,
            bool search,
            Map<String, Map<String, dynamic>> data)?
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

abstract class _Error extends MeasurementInboxState {
  const factory _Error(final String? error) = _$_Error;
  const _Error._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

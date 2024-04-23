// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workorder_book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkOrderInboxBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
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
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderInboxBlocEventCopyWith<$Res> {
  factory $WorkOrderInboxBlocEventCopyWith(WorkOrderInboxBlocEvent value,
          $Res Function(WorkOrderInboxBlocEvent) then) =
      _$WorkOrderInboxBlocEventCopyWithImpl<$Res, WorkOrderInboxBlocEvent>;
}

/// @nodoc
class _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        $Val extends WorkOrderInboxBlocEvent>
    implements $WorkOrderInboxBlocEventCopyWith<$Res> {
  _$WorkOrderInboxBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WorkOrderInboxBlocCreateEventCopyWith<$Res> {
  factory _$$WorkOrderInboxBlocCreateEventCopyWith(
          _$WorkOrderInboxBlocCreateEvent value,
          $Res Function(_$WorkOrderInboxBlocCreateEvent) then) =
      __$$WorkOrderInboxBlocCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String tenantId,
      String businessService,
      String moduleName,
      int limit,
      int offset});
}

/// @nodoc
class __$$WorkOrderInboxBlocCreateEventCopyWithImpl<$Res>
    extends _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        _$WorkOrderInboxBlocCreateEvent>
    implements _$$WorkOrderInboxBlocCreateEventCopyWith<$Res> {
  __$$WorkOrderInboxBlocCreateEventCopyWithImpl(
      _$WorkOrderInboxBlocCreateEvent _value,
      $Res Function(_$WorkOrderInboxBlocCreateEvent) _then)
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
    return _then(_$WorkOrderInboxBlocCreateEvent(
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

class _$WorkOrderInboxBlocCreateEvent implements WorkOrderInboxBlocCreateEvent {
  const _$WorkOrderInboxBlocCreateEvent(
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
    return 'WorkOrderInboxBlocEvent.create(tenantId: $tenantId, businessService: $businessService, moduleName: $moduleName, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderInboxBlocCreateEvent &&
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
  _$$WorkOrderInboxBlocCreateEventCopyWith<_$WorkOrderInboxBlocCreateEvent>
      get copyWith => __$$WorkOrderInboxBlocCreateEventCopyWithImpl<
          _$WorkOrderInboxBlocCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
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
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class WorkOrderInboxBlocCreateEvent
    implements WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxBlocCreateEvent(
      {required final String tenantId,
      required final String businessService,
      required final String moduleName,
      required final int limit,
      required final int offset}) = _$WorkOrderInboxBlocCreateEvent;

  String get tenantId;
  String get businessService;
  String get moduleName;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$WorkOrderInboxBlocCreateEventCopyWith<_$WorkOrderInboxBlocCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkOrderInboxSortBlocEventCopyWith<$Res> {
  factory _$$WorkOrderInboxSortBlocEventCopyWith(
          _$WorkOrderInboxSortBlocEvent value,
          $Res Function(_$WorkOrderInboxSortBlocEvent) then) =
      __$$WorkOrderInboxSortBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int sortCode});
}

/// @nodoc
class __$$WorkOrderInboxSortBlocEventCopyWithImpl<$Res>
    extends _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        _$WorkOrderInboxSortBlocEvent>
    implements _$$WorkOrderInboxSortBlocEventCopyWith<$Res> {
  __$$WorkOrderInboxSortBlocEventCopyWithImpl(
      _$WorkOrderInboxSortBlocEvent _value,
      $Res Function(_$WorkOrderInboxSortBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortCode = null,
  }) {
    return _then(_$WorkOrderInboxSortBlocEvent(
      sortCode: null == sortCode
          ? _value.sortCode
          : sortCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WorkOrderInboxSortBlocEvent implements WorkOrderInboxSortBlocEvent {
  const _$WorkOrderInboxSortBlocEvent({required this.sortCode});

  @override
  final int sortCode;

  @override
  String toString() {
    return 'WorkOrderInboxBlocEvent.sort(sortCode: $sortCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderInboxSortBlocEvent &&
            (identical(other.sortCode, sortCode) ||
                other.sortCode == sortCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderInboxSortBlocEventCopyWith<_$WorkOrderInboxSortBlocEvent>
      get copyWith => __$$WorkOrderInboxSortBlocEventCopyWithImpl<
          _$WorkOrderInboxSortBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return sort(sortCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return sort?.call(sortCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(sortCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) {
    return sort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }
}

abstract class WorkOrderInboxSortBlocEvent implements WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxSortBlocEvent({required final int sortCode}) =
      _$WorkOrderInboxSortBlocEvent;

  int get sortCode;
  @JsonKey(ignore: true)
  _$$WorkOrderInboxSortBlocEventCopyWith<_$WorkOrderInboxSortBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkOrderInboxSearchBlocEventCopyWith<$Res> {
  factory _$$WorkOrderInboxSearchBlocEventCopyWith(
          _$WorkOrderInboxSearchBlocEvent value,
          $Res Function(_$WorkOrderInboxSearchBlocEvent) then) =
      __$$WorkOrderInboxSearchBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? ward,
      String? projectId,
      String? contractNumber,
      String? projectName,
      int limit,
      int offset,
      Map<String, dynamic> data});
}

/// @nodoc
class __$$WorkOrderInboxSearchBlocEventCopyWithImpl<$Res>
    extends _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        _$WorkOrderInboxSearchBlocEvent>
    implements _$$WorkOrderInboxSearchBlocEventCopyWith<$Res> {
  __$$WorkOrderInboxSearchBlocEventCopyWithImpl(
      _$WorkOrderInboxSearchBlocEvent _value,
      $Res Function(_$WorkOrderInboxSearchBlocEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ward = freezed,
    Object? projectId = freezed,
    Object? contractNumber = freezed,
    Object? projectName = freezed,
    Object? limit = null,
    Object? offset = null,
    Object? data = null,
  }) {
    return _then(_$WorkOrderInboxSearchBlocEvent(
      ward: freezed == ward
          ? _value._ward
          : ward // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
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
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$WorkOrderInboxSearchBlocEvent implements WorkOrderInboxSearchBlocEvent {
  const _$WorkOrderInboxSearchBlocEvent(
      {final List<String>? ward,
      this.projectId,
      this.contractNumber,
      this.projectName,
      required this.limit,
      required this.offset,
      required final Map<String, dynamic> data})
      : _ward = ward,
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

  @override
  final String? projectId;
  @override
  final String? contractNumber;
  @override
  final String? projectName;
  @override
  final int limit;
  @override
  final int offset;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'WorkOrderInboxBlocEvent.search(ward: $ward, projectId: $projectId, contractNumber: $contractNumber, projectName: $projectName, limit: $limit, offset: $offset, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderInboxSearchBlocEvent &&
            const DeepCollectionEquality().equals(other._ward, _ward) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
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
      projectId,
      contractNumber,
      projectName,
      limit,
      offset,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderInboxSearchBlocEventCopyWith<_$WorkOrderInboxSearchBlocEvent>
      get copyWith => __$$WorkOrderInboxSearchBlocEventCopyWithImpl<
          _$WorkOrderInboxSearchBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
        search,
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        searchRepeat,
    required TResult Function() clear,
  }) {
    return search(
        ward, projectId, contractNumber, projectName, limit, offset, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        create,
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
        search,
    TResult? Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)?
        searchRepeat,
    TResult? Function()? clear,
  }) {
    return search?.call(
        ward, projectId, contractNumber, projectName, limit, offset, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        create,
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
        search,
    TResult Function(String tenantId, String businessService, String moduleName,
            int limit, int offset)?
        searchRepeat,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(
          ward, projectId, contractNumber, projectName, limit, offset, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class WorkOrderInboxSearchBlocEvent
    implements WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxSearchBlocEvent(
          {final List<String>? ward,
          final String? projectId,
          final String? contractNumber,
          final String? projectName,
          required final int limit,
          required final int offset,
          required final Map<String, dynamic> data}) =
      _$WorkOrderInboxSearchBlocEvent;

  List<String>? get ward;
  String? get projectId;
  String? get contractNumber;
  String? get projectName;
  int get limit;
  int get offset;
  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$WorkOrderInboxSearchBlocEventCopyWith<_$WorkOrderInboxSearchBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkOrderInboxSearchRepeatBlocEventCopyWith<$Res> {
  factory _$$WorkOrderInboxSearchRepeatBlocEventCopyWith(
          _$WorkOrderInboxSearchRepeatBlocEvent value,
          $Res Function(_$WorkOrderInboxSearchRepeatBlocEvent) then) =
      __$$WorkOrderInboxSearchRepeatBlocEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String tenantId,
      String businessService,
      String moduleName,
      int limit,
      int offset});
}

/// @nodoc
class __$$WorkOrderInboxSearchRepeatBlocEventCopyWithImpl<$Res>
    extends _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        _$WorkOrderInboxSearchRepeatBlocEvent>
    implements _$$WorkOrderInboxSearchRepeatBlocEventCopyWith<$Res> {
  __$$WorkOrderInboxSearchRepeatBlocEventCopyWithImpl(
      _$WorkOrderInboxSearchRepeatBlocEvent _value,
      $Res Function(_$WorkOrderInboxSearchRepeatBlocEvent) _then)
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
    return _then(_$WorkOrderInboxSearchRepeatBlocEvent(
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

class _$WorkOrderInboxSearchRepeatBlocEvent
    implements WorkOrderInboxSearchRepeatBlocEvent {
  const _$WorkOrderInboxSearchRepeatBlocEvent(
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
    return 'WorkOrderInboxBlocEvent.searchRepeat(tenantId: $tenantId, businessService: $businessService, moduleName: $moduleName, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderInboxSearchRepeatBlocEvent &&
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
  _$$WorkOrderInboxSearchRepeatBlocEventCopyWith<
          _$WorkOrderInboxSearchRepeatBlocEvent>
      get copyWith => __$$WorkOrderInboxSearchRepeatBlocEventCopyWithImpl<
          _$WorkOrderInboxSearchRepeatBlocEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
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
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) {
    return searchRepeat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) {
    return searchRepeat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (searchRepeat != null) {
      return searchRepeat(this);
    }
    return orElse();
  }
}

abstract class WorkOrderInboxSearchRepeatBlocEvent
    implements WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxSearchRepeatBlocEvent(
      {required final String tenantId,
      required final String businessService,
      required final String moduleName,
      required final int limit,
      required final int offset}) = _$WorkOrderInboxSearchRepeatBlocEvent;

  String get tenantId;
  String get businessService;
  String get moduleName;
  int get limit;
  int get offset;
  @JsonKey(ignore: true)
  _$$WorkOrderInboxSearchRepeatBlocEventCopyWith<
          _$WorkOrderInboxSearchRepeatBlocEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WorkOrderInboxBlocClearEventCopyWith<$Res> {
  factory _$$WorkOrderInboxBlocClearEventCopyWith(
          _$WorkOrderInboxBlocClearEvent value,
          $Res Function(_$WorkOrderInboxBlocClearEvent) then) =
      __$$WorkOrderInboxBlocClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WorkOrderInboxBlocClearEventCopyWithImpl<$Res>
    extends _$WorkOrderInboxBlocEventCopyWithImpl<$Res,
        _$WorkOrderInboxBlocClearEvent>
    implements _$$WorkOrderInboxBlocClearEventCopyWith<$Res> {
  __$$WorkOrderInboxBlocClearEventCopyWithImpl(
      _$WorkOrderInboxBlocClearEvent _value,
      $Res Function(_$WorkOrderInboxBlocClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WorkOrderInboxBlocClearEvent implements WorkOrderInboxBlocClearEvent {
  const _$WorkOrderInboxBlocClearEvent();

  @override
  String toString() {
    return 'WorkOrderInboxBlocEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderInboxBlocClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tenantId, String businessService,
            String moduleName, int limit, int offset)
        create,
    required TResult Function(int sortCode) sort,
    required TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)
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
    TResult? Function(int sortCode)? sort,
    TResult? Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    TResult Function(int sortCode)? sort,
    TResult Function(
            List<String>? ward,
            String? projectId,
            String? contractNumber,
            String? projectName,
            int limit,
            int offset,
            Map<String, dynamic> data)?
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
    required TResult Function(WorkOrderInboxBlocCreateEvent value) create,
    required TResult Function(WorkOrderInboxSortBlocEvent value) sort,
    required TResult Function(WorkOrderInboxSearchBlocEvent value) search,
    required TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)
        searchRepeat,
    required TResult Function(WorkOrderInboxBlocClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult? Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult? Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult? Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult? Function(WorkOrderInboxBlocClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorkOrderInboxBlocCreateEvent value)? create,
    TResult Function(WorkOrderInboxSortBlocEvent value)? sort,
    TResult Function(WorkOrderInboxSearchBlocEvent value)? search,
    TResult Function(WorkOrderInboxSearchRepeatBlocEvent value)? searchRepeat,
    TResult Function(WorkOrderInboxBlocClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class WorkOrderInboxBlocClearEvent implements WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxBlocClearEvent() = _$WorkOrderInboxBlocClearEvent;
}

/// @nodoc
mixin _$WorkOrderInboxState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)
        loaded,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
        loaded,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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
abstract class $WorkOrderInboxStateCopyWith<$Res> {
  factory $WorkOrderInboxStateCopyWith(
          WorkOrderInboxState value, $Res Function(WorkOrderInboxState) then) =
      _$WorkOrderInboxStateCopyWithImpl<$Res, WorkOrderInboxState>;
}

/// @nodoc
class _$WorkOrderInboxStateCopyWithImpl<$Res, $Val extends WorkOrderInboxState>
    implements $WorkOrderInboxStateCopyWith<$Res> {
  _$WorkOrderInboxStateCopyWithImpl(this._value, this._then);

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
    extends _$WorkOrderInboxStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'WorkOrderInboxState.initial()';
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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

abstract class _Initial extends WorkOrderInboxState {
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
    extends _$WorkOrderInboxStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading() : super._();

  @override
  String toString() {
    return 'WorkOrderInboxState.loading()';
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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

abstract class _Loading extends WorkOrderInboxState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {WOInboxResponse? mbInboxResponse,
      bool isLoading,
      List<Contracts>? contracts,
      bool search,
      Map<String, dynamic> searchData});

  $WOInboxResponseCopyWith<$Res>? get mbInboxResponse;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$WorkOrderInboxStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mbInboxResponse = freezed,
    Object? isLoading = null,
    Object? contracts = freezed,
    Object? search = null,
    Object? searchData = null,
  }) {
    return _then(_$_Loaded(
      freezed == mbInboxResponse
          ? _value.mbInboxResponse
          : mbInboxResponse // ignore: cast_nullable_to_non_nullable
              as WOInboxResponse?,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      freezed == contracts
          ? _value._contracts
          : contracts // ignore: cast_nullable_to_non_nullable
              as List<Contracts>?,
      null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as bool,
      null == searchData
          ? _value._searchData
          : searchData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WOInboxResponseCopyWith<$Res>? get mbInboxResponse {
    if (_value.mbInboxResponse == null) {
      return null;
    }

    return $WOInboxResponseCopyWith<$Res>(_value.mbInboxResponse!, (value) {
      return _then(_value.copyWith(mbInboxResponse: value));
    });
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(
      this.mbInboxResponse,
      this.isLoading,
      final List<Contracts>? contracts,
      this.search,
      final Map<String, dynamic> searchData)
      : _contracts = contracts,
        _searchData = searchData,
        super._();

  @override
  final WOInboxResponse? mbInboxResponse;
  @override
  final bool isLoading;
  final List<Contracts>? _contracts;
  @override
  List<Contracts>? get contracts {
    final value = _contracts;
    if (value == null) return null;
    if (_contracts is EqualUnmodifiableListView) return _contracts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool search;
  final Map<String, dynamic> _searchData;
  @override
  Map<String, dynamic> get searchData {
    if (_searchData is EqualUnmodifiableMapView) return _searchData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchData);
  }

  @override
  String toString() {
    return 'WorkOrderInboxState.loaded(mbInboxResponse: $mbInboxResponse, isLoading: $isLoading, contracts: $contracts, search: $search, searchData: $searchData)';
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
            const DeepCollectionEquality()
                .equals(other._contracts, _contracts) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality()
                .equals(other._searchData, _searchData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mbInboxResponse,
      isLoading,
      const DeepCollectionEquality().hash(_contracts),
      search,
      const DeepCollectionEquality().hash(_searchData));

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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loaded(mbInboxResponse, isLoading, contracts, search, searchData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loaded?.call(
        mbInboxResponse, isLoading, contracts, search, searchData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(mbInboxResponse, isLoading, contracts, search, searchData);
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

abstract class _Loaded extends WorkOrderInboxState {
  const factory _Loaded(
      final WOInboxResponse? mbInboxResponse,
      final bool isLoading,
      final List<Contracts>? contracts,
      final bool search,
      final Map<String, dynamic> searchData) = _$_Loaded;
  const _Loaded._() : super._();

  WOInboxResponse? get mbInboxResponse;
  bool get isLoading;
  List<Contracts>? get contracts;
  bool get search;
  Map<String, dynamic> get searchData;
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
    extends _$WorkOrderInboxStateCopyWithImpl<$Res, _$_Error>
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
    return 'WorkOrderInboxState.error(error: $error)';
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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
            WOInboxResponse? mbInboxResponse,
            bool isLoading,
            List<Contracts>? contracts,
            bool search,
            Map<String, dynamic> searchData)?
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

abstract class _Error extends WorkOrderInboxState {
  const factory _Error(final String? error) = _$_Error;
  const _Error._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

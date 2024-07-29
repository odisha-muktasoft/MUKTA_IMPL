// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mb_inbox_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MBInboxResponse _$MBInboxResponseFromJson(Map<String, dynamic> json) {
  return _MBInboxResponse.fromJson(json);
}

/// @nodoc
mixin _$MBInboxResponse {
  @JsonKey(name: 'totalCount')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'nearingSlaCount')
  int? get nearingSlaCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusMap')
  List<StatusMap>? get statusMap => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<ItemData>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MBInboxResponseCopyWith<MBInboxResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MBInboxResponseCopyWith<$Res> {
  factory $MBInboxResponseCopyWith(
          MBInboxResponse value, $Res Function(MBInboxResponse) then) =
      _$MBInboxResponseCopyWithImpl<$Res, MBInboxResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'nearingSlaCount') int? nearingSlaCount,
      @JsonKey(name: 'statusMap') List<StatusMap>? statusMap,
      @JsonKey(name: 'items') List<ItemData>? items});
}

/// @nodoc
class _$MBInboxResponseCopyWithImpl<$Res, $Val extends MBInboxResponse>
    implements $MBInboxResponseCopyWith<$Res> {
  _$MBInboxResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? nearingSlaCount = freezed,
    Object? statusMap = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nearingSlaCount: freezed == nearingSlaCount
          ? _value.nearingSlaCount
          : nearingSlaCount // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMap: freezed == statusMap
          ? _value.statusMap
          : statusMap // ignore: cast_nullable_to_non_nullable
              as List<StatusMap>?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MBInboxResponseCopyWith<$Res>
    implements $MBInboxResponseCopyWith<$Res> {
  factory _$$_MBInboxResponseCopyWith(
          _$_MBInboxResponse value, $Res Function(_$_MBInboxResponse) then) =
      __$$_MBInboxResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalCount') int? totalCount,
      @JsonKey(name: 'nearingSlaCount') int? nearingSlaCount,
      @JsonKey(name: 'statusMap') List<StatusMap>? statusMap,
      @JsonKey(name: 'items') List<ItemData>? items});
}

/// @nodoc
class __$$_MBInboxResponseCopyWithImpl<$Res>
    extends _$MBInboxResponseCopyWithImpl<$Res, _$_MBInboxResponse>
    implements _$$_MBInboxResponseCopyWith<$Res> {
  __$$_MBInboxResponseCopyWithImpl(
      _$_MBInboxResponse _value, $Res Function(_$_MBInboxResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? nearingSlaCount = freezed,
    Object? statusMap = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_MBInboxResponse(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nearingSlaCount: freezed == nearingSlaCount
          ? _value.nearingSlaCount
          : nearingSlaCount // ignore: cast_nullable_to_non_nullable
              as int?,
      statusMap: freezed == statusMap
          ? _value._statusMap
          : statusMap // ignore: cast_nullable_to_non_nullable
              as List<StatusMap>?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MBInboxResponse implements _MBInboxResponse {
  const _$_MBInboxResponse(
      {@JsonKey(name: 'totalCount') this.totalCount,
      @JsonKey(name: 'nearingSlaCount') this.nearingSlaCount,
      @JsonKey(name: 'statusMap') final List<StatusMap>? statusMap,
      @JsonKey(name: 'items') final List<ItemData>? items})
      : _statusMap = statusMap,
        _items = items;

  factory _$_MBInboxResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MBInboxResponseFromJson(json);

  @override
  @JsonKey(name: 'totalCount')
  final int? totalCount;
  @override
  @JsonKey(name: 'nearingSlaCount')
  final int? nearingSlaCount;
  final List<StatusMap>? _statusMap;
  @override
  @JsonKey(name: 'statusMap')
  List<StatusMap>? get statusMap {
    final value = _statusMap;
    if (value == null) return null;
    if (_statusMap is EqualUnmodifiableListView) return _statusMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ItemData>? _items;
  @override
  @JsonKey(name: 'items')
  List<ItemData>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MBInboxResponse(totalCount: $totalCount, nearingSlaCount: $nearingSlaCount, statusMap: $statusMap, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MBInboxResponse &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.nearingSlaCount, nearingSlaCount) ||
                other.nearingSlaCount == nearingSlaCount) &&
            const DeepCollectionEquality()
                .equals(other._statusMap, _statusMap) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCount,
      nearingSlaCount,
      const DeepCollectionEquality().hash(_statusMap),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MBInboxResponseCopyWith<_$_MBInboxResponse> get copyWith =>
      __$$_MBInboxResponseCopyWithImpl<_$_MBInboxResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MBInboxResponseToJson(
      this,
    );
  }
}

abstract class _MBInboxResponse implements MBInboxResponse {
  const factory _MBInboxResponse(
          {@JsonKey(name: 'totalCount') final int? totalCount,
          @JsonKey(name: 'nearingSlaCount') final int? nearingSlaCount,
          @JsonKey(name: 'statusMap') final List<StatusMap>? statusMap,
          @JsonKey(name: 'items') final List<ItemData>? items}) =
      _$_MBInboxResponse;

  factory _MBInboxResponse.fromJson(Map<String, dynamic> json) =
      _$_MBInboxResponse.fromJson;

  @override
  @JsonKey(name: 'totalCount')
  int? get totalCount;
  @override
  @JsonKey(name: 'nearingSlaCount')
  int? get nearingSlaCount;
  @override
  @JsonKey(name: 'statusMap')
  List<StatusMap>? get statusMap;
  @override
  @JsonKey(name: 'items')
  List<ItemData>? get items;
  @override
  @JsonKey(ignore: true)
  _$$_MBInboxResponseCopyWith<_$_MBInboxResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusMap _$StatusMapFromJson(Map<String, dynamic> json) {
  return _StatusMap.fromJson(json);
}

/// @nodoc
mixin _$StatusMap {
  @JsonKey(name: 'statusid')
  String? get statusid => throw _privateConstructorUsedError;
  @JsonKey(name: 'count')
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'applicationstatus')
  String? get applicationstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessservice')
  String? get businessservice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusMapCopyWith<StatusMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusMapCopyWith<$Res> {
  factory $StatusMapCopyWith(StatusMap value, $Res Function(StatusMap) then) =
      _$StatusMapCopyWithImpl<$Res, StatusMap>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statusid') String? statusid,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'applicationstatus') String? applicationstatus,
      @JsonKey(name: 'businessservice') String? businessservice});
}

/// @nodoc
class _$StatusMapCopyWithImpl<$Res, $Val extends StatusMap>
    implements $StatusMapCopyWith<$Res> {
  _$StatusMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusid = freezed,
    Object? count = freezed,
    Object? state = freezed,
    Object? applicationstatus = freezed,
    Object? businessservice = freezed,
  }) {
    return _then(_value.copyWith(
      statusid: freezed == statusid
          ? _value.statusid
          : statusid // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationstatus: freezed == applicationstatus
          ? _value.applicationstatus
          : applicationstatus // ignore: cast_nullable_to_non_nullable
              as String?,
      businessservice: freezed == businessservice
          ? _value.businessservice
          : businessservice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatusMapCopyWith<$Res> implements $StatusMapCopyWith<$Res> {
  factory _$$_StatusMapCopyWith(
          _$_StatusMap value, $Res Function(_$_StatusMap) then) =
      __$$_StatusMapCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statusid') String? statusid,
      @JsonKey(name: 'count') int? count,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'applicationstatus') String? applicationstatus,
      @JsonKey(name: 'businessservice') String? businessservice});
}

/// @nodoc
class __$$_StatusMapCopyWithImpl<$Res>
    extends _$StatusMapCopyWithImpl<$Res, _$_StatusMap>
    implements _$$_StatusMapCopyWith<$Res> {
  __$$_StatusMapCopyWithImpl(
      _$_StatusMap _value, $Res Function(_$_StatusMap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusid = freezed,
    Object? count = freezed,
    Object? state = freezed,
    Object? applicationstatus = freezed,
    Object? businessservice = freezed,
  }) {
    return _then(_$_StatusMap(
      statusid: freezed == statusid
          ? _value.statusid
          : statusid // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationstatus: freezed == applicationstatus
          ? _value.applicationstatus
          : applicationstatus // ignore: cast_nullable_to_non_nullable
              as String?,
      businessservice: freezed == businessservice
          ? _value.businessservice
          : businessservice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusMap implements _StatusMap {
  const _$_StatusMap(
      {@JsonKey(name: 'statusid') this.statusid,
      @JsonKey(name: 'count') this.count,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'applicationstatus') this.applicationstatus,
      @JsonKey(name: 'businessservice') this.businessservice});

  factory _$_StatusMap.fromJson(Map<String, dynamic> json) =>
      _$$_StatusMapFromJson(json);

  @override
  @JsonKey(name: 'statusid')
  final String? statusid;
  @override
  @JsonKey(name: 'count')
  final int? count;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'applicationstatus')
  final String? applicationstatus;
  @override
  @JsonKey(name: 'businessservice')
  final String? businessservice;

  @override
  String toString() {
    return 'StatusMap(statusid: $statusid, count: $count, state: $state, applicationstatus: $applicationstatus, businessservice: $businessservice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusMap &&
            (identical(other.statusid, statusid) ||
                other.statusid == statusid) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.applicationstatus, applicationstatus) ||
                other.applicationstatus == applicationstatus) &&
            (identical(other.businessservice, businessservice) ||
                other.businessservice == businessservice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusid, count, state, applicationstatus, businessservice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusMapCopyWith<_$_StatusMap> get copyWith =>
      __$$_StatusMapCopyWithImpl<_$_StatusMap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusMapToJson(
      this,
    );
  }
}

abstract class _StatusMap implements StatusMap {
  const factory _StatusMap(
          {@JsonKey(name: 'statusid') final String? statusid,
          @JsonKey(name: 'count') final int? count,
          @JsonKey(name: 'state') final String? state,
          @JsonKey(name: 'applicationstatus') final String? applicationstatus,
          @JsonKey(name: 'businessservice') final String? businessservice}) =
      _$_StatusMap;

  factory _StatusMap.fromJson(Map<String, dynamic> json) =
      _$_StatusMap.fromJson;

  @override
  @JsonKey(name: 'statusid')
  String? get statusid;
  @override
  @JsonKey(name: 'count')
  int? get count;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'applicationstatus')
  String? get applicationstatus;
  @override
  @JsonKey(name: 'businessservice')
  String? get businessservice;
  @override
  @JsonKey(ignore: true)
  _$$_StatusMapCopyWith<_$_StatusMap> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return _ItemData.fromJson(json);
}

/// @nodoc
mixin _$ItemData {
  @JsonKey(name: 'ProcessInstance')
  ProcessInstance? get processInstance => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessObject')
  BusinessObject? get businessObject => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDataCopyWith<ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDataCopyWith<$Res> {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) then) =
      _$ItemDataCopyWithImpl<$Res, ItemData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProcessInstance') ProcessInstance? processInstance,
      @JsonKey(name: 'businessObject') BusinessObject? businessObject});

  $ProcessInstanceCopyWith<$Res>? get processInstance;
  $BusinessObjectCopyWith<$Res>? get businessObject;
}

/// @nodoc
class _$ItemDataCopyWithImpl<$Res, $Val extends ItemData>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processInstance = freezed,
    Object? businessObject = freezed,
  }) {
    return _then(_value.copyWith(
      processInstance: freezed == processInstance
          ? _value.processInstance
          : processInstance // ignore: cast_nullable_to_non_nullable
              as ProcessInstance?,
      businessObject: freezed == businessObject
          ? _value.businessObject
          : businessObject // ignore: cast_nullable_to_non_nullable
              as BusinessObject?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessInstanceCopyWith<$Res>? get processInstance {
    if (_value.processInstance == null) {
      return null;
    }

    return $ProcessInstanceCopyWith<$Res>(_value.processInstance!, (value) {
      return _then(_value.copyWith(processInstance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BusinessObjectCopyWith<$Res>? get businessObject {
    if (_value.businessObject == null) {
      return null;
    }

    return $BusinessObjectCopyWith<$Res>(_value.businessObject!, (value) {
      return _then(_value.copyWith(businessObject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemDataCopyWith<$Res> implements $ItemDataCopyWith<$Res> {
  factory _$$_ItemDataCopyWith(
          _$_ItemData value, $Res Function(_$_ItemData) then) =
      __$$_ItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProcessInstance') ProcessInstance? processInstance,
      @JsonKey(name: 'businessObject') BusinessObject? businessObject});

  @override
  $ProcessInstanceCopyWith<$Res>? get processInstance;
  @override
  $BusinessObjectCopyWith<$Res>? get businessObject;
}

/// @nodoc
class __$$_ItemDataCopyWithImpl<$Res>
    extends _$ItemDataCopyWithImpl<$Res, _$_ItemData>
    implements _$$_ItemDataCopyWith<$Res> {
  __$$_ItemDataCopyWithImpl(
      _$_ItemData _value, $Res Function(_$_ItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processInstance = freezed,
    Object? businessObject = freezed,
  }) {
    return _then(_$_ItemData(
      processInstance: freezed == processInstance
          ? _value.processInstance
          : processInstance // ignore: cast_nullable_to_non_nullable
              as ProcessInstance?,
      businessObject: freezed == businessObject
          ? _value.businessObject
          : businessObject // ignore: cast_nullable_to_non_nullable
              as BusinessObject?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemData implements _ItemData {
  const _$_ItemData(
      {@JsonKey(name: 'ProcessInstance') this.processInstance,
      @JsonKey(name: 'businessObject') this.businessObject});

  factory _$_ItemData.fromJson(Map<String, dynamic> json) =>
      _$$_ItemDataFromJson(json);

  @override
  @JsonKey(name: 'ProcessInstance')
  final ProcessInstance? processInstance;
  @override
  @JsonKey(name: 'businessObject')
  final BusinessObject? businessObject;

  @override
  String toString() {
    return 'ItemData(processInstance: $processInstance, businessObject: $businessObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemData &&
            (identical(other.processInstance, processInstance) ||
                other.processInstance == processInstance) &&
            (identical(other.businessObject, businessObject) ||
                other.businessObject == businessObject));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, processInstance, businessObject);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemDataCopyWith<_$_ItemData> get copyWith =>
      __$$_ItemDataCopyWithImpl<_$_ItemData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemDataToJson(
      this,
    );
  }
}

abstract class _ItemData implements ItemData {
  const factory _ItemData(
      {@JsonKey(name: 'ProcessInstance')
          final ProcessInstance? processInstance,
      @JsonKey(name: 'businessObject')
          final BusinessObject? businessObject}) = _$_ItemData;

  factory _ItemData.fromJson(Map<String, dynamic> json) = _$_ItemData.fromJson;

  @override
  @JsonKey(name: 'ProcessInstance')
  ProcessInstance? get processInstance;
  @override
  @JsonKey(name: 'businessObject')
  BusinessObject? get businessObject;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDataCopyWith<_$_ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

ProcessInstance _$ProcessInstanceFromJson(Map<String, dynamic> json) {
  return _ProcessInstance.fromJson(json);
}

/// @nodoc
mixin _$ProcessInstance {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessService')
  String? get businessService => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessId')
  String? get businessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'action')
  String? get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'moduleName')
  String? get moduleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'businesssServiceSla')
  int? get businesssServiceSla => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  State? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigner')
  Assigner? get assigner => throw _privateConstructorUsedError;
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignes')
  List<Assigne>? get assignes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessInstanceCopyWith<ProcessInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessInstanceCopyWith<$Res> {
  factory $ProcessInstanceCopyWith(
          ProcessInstance value, $Res Function(ProcessInstance) then) =
      _$ProcessInstanceCopyWithImpl<$Res, ProcessInstance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'businessService') String? businessService,
      @JsonKey(name: 'businessId') String? businessId,
      @JsonKey(name: 'action') String? action,
      @JsonKey(name: 'moduleName') String? moduleName,
      @JsonKey(name: 'businesssServiceSla') int? businesssServiceSla,
      @JsonKey(name: 'rating') int? rating,
      @JsonKey(name: 'state') State? state,
      @JsonKey(name: 'assigner') Assigner? assigner,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails,
      @JsonKey(name: 'assignes') List<Assigne>? assignes});

  $StateCopyWith<$Res>? get state;
  $AssignerCopyWith<$Res>? get assigner;
  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class _$ProcessInstanceCopyWithImpl<$Res, $Val extends ProcessInstance>
    implements $ProcessInstanceCopyWith<$Res> {
  _$ProcessInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? businessService = freezed,
    Object? businessId = freezed,
    Object? action = freezed,
    Object? moduleName = freezed,
    Object? businesssServiceSla = freezed,
    Object? rating = freezed,
    Object? state = freezed,
    Object? assigner = freezed,
    Object? auditDetails = freezed,
    Object? assignes = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleName: freezed == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String?,
      businesssServiceSla: freezed == businesssServiceSla
          ? _value.businesssServiceSla
          : businesssServiceSla // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assigner?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      assignes: freezed == assignes
          ? _value.assignes
          : assignes // ignore: cast_nullable_to_non_nullable
              as List<Assigne>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<$Res>? get state {
    if (_value.state == null) {
      return null;
    }

    return $StateCopyWith<$Res>(_value.state!, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssignerCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $AssignerCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuditDetailsCopyWith<$Res>? get auditDetails {
    if (_value.auditDetails == null) {
      return null;
    }

    return $AuditDetailsCopyWith<$Res>(_value.auditDetails!, (value) {
      return _then(_value.copyWith(auditDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProcessInstanceCopyWith<$Res>
    implements $ProcessInstanceCopyWith<$Res> {
  factory _$$_ProcessInstanceCopyWith(
          _$_ProcessInstance value, $Res Function(_$_ProcessInstance) then) =
      __$$_ProcessInstanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'businessService') String? businessService,
      @JsonKey(name: 'businessId') String? businessId,
      @JsonKey(name: 'action') String? action,
      @JsonKey(name: 'moduleName') String? moduleName,
      @JsonKey(name: 'businesssServiceSla') int? businesssServiceSla,
      @JsonKey(name: 'rating') int? rating,
      @JsonKey(name: 'state') State? state,
      @JsonKey(name: 'assigner') Assigner? assigner,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails,
      @JsonKey(name: 'assignes') List<Assigne>? assignes});

  @override
  $StateCopyWith<$Res>? get state;
  @override
  $AssignerCopyWith<$Res>? get assigner;
  @override
  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class __$$_ProcessInstanceCopyWithImpl<$Res>
    extends _$ProcessInstanceCopyWithImpl<$Res, _$_ProcessInstance>
    implements _$$_ProcessInstanceCopyWith<$Res> {
  __$$_ProcessInstanceCopyWithImpl(
      _$_ProcessInstance _value, $Res Function(_$_ProcessInstance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? businessService = freezed,
    Object? businessId = freezed,
    Object? action = freezed,
    Object? moduleName = freezed,
    Object? businesssServiceSla = freezed,
    Object? rating = freezed,
    Object? state = freezed,
    Object? assigner = freezed,
    Object? auditDetails = freezed,
    Object? assignes = freezed,
  }) {
    return _then(_$_ProcessInstance(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      businessId: freezed == businessId
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleName: freezed == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String?,
      businesssServiceSla: freezed == businesssServiceSla
          ? _value.businesssServiceSla
          : businesssServiceSla // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as State?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assigner?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      assignes: freezed == assignes
          ? _value._assignes
          : assignes // ignore: cast_nullable_to_non_nullable
              as List<Assigne>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessInstance implements _ProcessInstance {
  const _$_ProcessInstance(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'businessService') this.businessService,
      @JsonKey(name: 'businessId') this.businessId,
      @JsonKey(name: 'action') this.action,
      @JsonKey(name: 'moduleName') this.moduleName,
      @JsonKey(name: 'businesssServiceSla') this.businesssServiceSla,
      @JsonKey(name: 'rating') this.rating,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'assigner') this.assigner,
      @JsonKey(name: 'auditDetails') this.auditDetails,
      @JsonKey(name: 'assignes') final List<Assigne>? assignes})
      : _assignes = assignes;

  factory _$_ProcessInstance.fromJson(Map<String, dynamic> json) =>
      _$$_ProcessInstanceFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'businessService')
  final String? businessService;
  @override
  @JsonKey(name: 'businessId')
  final String? businessId;
  @override
  @JsonKey(name: 'action')
  final String? action;
  @override
  @JsonKey(name: 'moduleName')
  final String? moduleName;
  @override
  @JsonKey(name: 'businesssServiceSla')
  final int? businesssServiceSla;
  @override
  @JsonKey(name: 'rating')
  final int? rating;
  @override
  @JsonKey(name: 'state')
  final State? state;
  @override
  @JsonKey(name: 'assigner')
  final Assigner? assigner;
  @override
  @JsonKey(name: 'auditDetails')
  final AuditDetails? auditDetails;
  final List<Assigne>? _assignes;
  @override
  @JsonKey(name: 'assignes')
  List<Assigne>? get assignes {
    final value = _assignes;
    if (value == null) return null;
    if (_assignes is EqualUnmodifiableListView) return _assignes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProcessInstance(id: $id, tenantId: $tenantId, businessService: $businessService, businessId: $businessId, action: $action, moduleName: $moduleName, businesssServiceSla: $businesssServiceSla, rating: $rating, state: $state, assigner: $assigner, auditDetails: $auditDetails, assignes: $assignes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcessInstance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService) &&
            (identical(other.businessId, businessId) ||
                other.businessId == businessId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.businesssServiceSla, businesssServiceSla) ||
                other.businesssServiceSla == businesssServiceSla) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.assigner, assigner) ||
                other.assigner == assigner) &&
            (identical(other.auditDetails, auditDetails) ||
                other.auditDetails == auditDetails) &&
            const DeepCollectionEquality().equals(other._assignes, _assignes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tenantId,
      businessService,
      businessId,
      action,
      moduleName,
      businesssServiceSla,
      rating,
      state,
      assigner,
      auditDetails,
      const DeepCollectionEquality().hash(_assignes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessInstanceCopyWith<_$_ProcessInstance> get copyWith =>
      __$$_ProcessInstanceCopyWithImpl<_$_ProcessInstance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcessInstanceToJson(
      this,
    );
  }
}

abstract class _ProcessInstance implements ProcessInstance {
  const factory _ProcessInstance(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'tenantId') final String? tenantId,
          @JsonKey(name: 'businessService') final String? businessService,
          @JsonKey(name: 'businessId') final String? businessId,
          @JsonKey(name: 'action') final String? action,
          @JsonKey(name: 'moduleName') final String? moduleName,
          @JsonKey(name: 'businesssServiceSla') final int? businesssServiceSla,
          @JsonKey(name: 'rating') final int? rating,
          @JsonKey(name: 'state') final State? state,
          @JsonKey(name: 'assigner') final Assigner? assigner,
          @JsonKey(name: 'auditDetails') final AuditDetails? auditDetails,
          @JsonKey(name: 'assignes') final List<Assigne>? assignes}) =
      _$_ProcessInstance;

  factory _ProcessInstance.fromJson(Map<String, dynamic> json) =
      _$_ProcessInstance.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'businessService')
  String? get businessService;
  @override
  @JsonKey(name: 'businessId')
  String? get businessId;
  @override
  @JsonKey(name: 'action')
  String? get action;
  @override
  @JsonKey(name: 'moduleName')
  String? get moduleName;
  @override
  @JsonKey(name: 'businesssServiceSla')
  int? get businesssServiceSla;
  @override
  @JsonKey(name: 'rating')
  int? get rating;
  @override
  @JsonKey(name: 'state')
  State? get state;
  @override
  @JsonKey(name: 'assigner')
  Assigner? get assigner;
  @override
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails;
  @override
  @JsonKey(name: 'assignes')
  List<Assigne>? get assignes;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessInstanceCopyWith<_$_ProcessInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

AuditDetails _$AuditDetailsFromJson(Map<String, dynamic> json) {
  return _AuditDetails.fromJson(json);
}

/// @nodoc
mixin _$AuditDetails {
  String? get createdBy => throw _privateConstructorUsedError;
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  int? get createdTime => throw _privateConstructorUsedError;
  int? get lastModifiedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuditDetailsCopyWith<AuditDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditDetailsCopyWith<$Res> {
  factory $AuditDetailsCopyWith(
          AuditDetails value, $Res Function(AuditDetails) then) =
      _$AuditDetailsCopyWithImpl<$Res, AuditDetails>;
  @useResult
  $Res call(
      {String? createdBy,
      String? lastModifiedBy,
      int? createdTime,
      int? lastModifiedTime});
}

/// @nodoc
class _$AuditDetailsCopyWithImpl<$Res, $Val extends AuditDetails>
    implements $AuditDetailsCopyWith<$Res> {
  _$AuditDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? lastModifiedBy = freezed,
    Object? createdTime = freezed,
    Object? lastModifiedTime = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuditDetailsCopyWith<$Res>
    implements $AuditDetailsCopyWith<$Res> {
  factory _$$_AuditDetailsCopyWith(
          _$_AuditDetails value, $Res Function(_$_AuditDetails) then) =
      __$$_AuditDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? createdBy,
      String? lastModifiedBy,
      int? createdTime,
      int? lastModifiedTime});
}

/// @nodoc
class __$$_AuditDetailsCopyWithImpl<$Res>
    extends _$AuditDetailsCopyWithImpl<$Res, _$_AuditDetails>
    implements _$$_AuditDetailsCopyWith<$Res> {
  __$$_AuditDetailsCopyWithImpl(
      _$_AuditDetails _value, $Res Function(_$_AuditDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? lastModifiedBy = freezed,
    Object? createdTime = freezed,
    Object? lastModifiedTime = freezed,
  }) {
    return _then(_$_AuditDetails(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as int?,
      lastModifiedTime: freezed == lastModifiedTime
          ? _value.lastModifiedTime
          : lastModifiedTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuditDetails implements _AuditDetails {
  const _$_AuditDetails(
      {this.createdBy,
      this.lastModifiedBy,
      this.createdTime,
      this.lastModifiedTime});

  factory _$_AuditDetails.fromJson(Map<String, dynamic> json) =>
      _$$_AuditDetailsFromJson(json);

  @override
  final String? createdBy;
  @override
  final String? lastModifiedBy;
  @override
  final int? createdTime;
  @override
  final int? lastModifiedTime;

  @override
  String toString() {
    return 'AuditDetails(createdBy: $createdBy, lastModifiedBy: $lastModifiedBy, createdTime: $createdTime, lastModifiedTime: $lastModifiedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuditDetails &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.lastModifiedTime, lastModifiedTime) ||
                other.lastModifiedTime == lastModifiedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, createdBy, lastModifiedBy, createdTime, lastModifiedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuditDetailsCopyWith<_$_AuditDetails> get copyWith =>
      __$$_AuditDetailsCopyWithImpl<_$_AuditDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuditDetailsToJson(
      this,
    );
  }
}

abstract class _AuditDetails implements AuditDetails {
  const factory _AuditDetails(
      {final String? createdBy,
      final String? lastModifiedBy,
      final int? createdTime,
      final int? lastModifiedTime}) = _$_AuditDetails;

  factory _AuditDetails.fromJson(Map<String, dynamic> json) =
      _$_AuditDetails.fromJson;

  @override
  String? get createdBy;
  @override
  String? get lastModifiedBy;
  @override
  int? get createdTime;
  @override
  int? get lastModifiedTime;
  @override
  @JsonKey(ignore: true)
  _$$_AuditDetailsCopyWith<_$_AuditDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

State _$StateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
mixin _$State {
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessServiceId')
  String? get businessServiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sla')
  int? get sla => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'applicationStatus')
  String? get applicationStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'docUploadRequired')
  bool? get docUploadRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'isStartState')
  bool? get isStartState => throw _privateConstructorUsedError;
  @JsonKey(name: 'isTerminateState')
  bool? get isTerminateState => throw _privateConstructorUsedError;
  @JsonKey(name: 'isStateUpdatable')
  bool? get isStateUpdatable => throw _privateConstructorUsedError;
  @JsonKey(name: 'actions')
  List<Action>? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCopyWith<State> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<$Res> {
  factory $StateCopyWith(State value, $Res Function(State) then) =
      _$StateCopyWithImpl<$Res, State>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'businessServiceId') String? businessServiceId,
      @JsonKey(name: 'sla') int? sla,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'applicationStatus') String? applicationStatus,
      @JsonKey(name: 'docUploadRequired') bool? docUploadRequired,
      @JsonKey(name: 'isStartState') bool? isStartState,
      @JsonKey(name: 'isTerminateState') bool? isTerminateState,
      @JsonKey(name: 'isStateUpdatable') bool? isStateUpdatable,
      @JsonKey(name: 'actions') List<Action>? actions});
}

/// @nodoc
class _$StateCopyWithImpl<$Res, $Val extends State>
    implements $StateCopyWith<$Res> {
  _$StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? tenantId = freezed,
    Object? businessServiceId = freezed,
    Object? sla = freezed,
    Object? state = freezed,
    Object? applicationStatus = freezed,
    Object? docUploadRequired = freezed,
    Object? isStartState = freezed,
    Object? isTerminateState = freezed,
    Object? isStateUpdatable = freezed,
    Object? actions = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServiceId: freezed == businessServiceId
          ? _value.businessServiceId
          : businessServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sla: freezed == sla
          ? _value.sla
          : sla // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationStatus: freezed == applicationStatus
          ? _value.applicationStatus
          : applicationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      docUploadRequired: freezed == docUploadRequired
          ? _value.docUploadRequired
          : docUploadRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStartState: freezed == isStartState
          ? _value.isStartState
          : isStartState // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTerminateState: freezed == isTerminateState
          ? _value.isTerminateState
          : isTerminateState // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStateUpdatable: freezed == isStateUpdatable
          ? _value.isStateUpdatable
          : isStateUpdatable // ignore: cast_nullable_to_non_nullable
              as bool?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateCopyWith<$Res> implements $StateCopyWith<$Res> {
  factory _$$_StateCopyWith(_$_State value, $Res Function(_$_State) then) =
      __$$_StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'businessServiceId') String? businessServiceId,
      @JsonKey(name: 'sla') int? sla,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'applicationStatus') String? applicationStatus,
      @JsonKey(name: 'docUploadRequired') bool? docUploadRequired,
      @JsonKey(name: 'isStartState') bool? isStartState,
      @JsonKey(name: 'isTerminateState') bool? isTerminateState,
      @JsonKey(name: 'isStateUpdatable') bool? isStateUpdatable,
      @JsonKey(name: 'actions') List<Action>? actions});
}

/// @nodoc
class __$$_StateCopyWithImpl<$Res> extends _$StateCopyWithImpl<$Res, _$_State>
    implements _$$_StateCopyWith<$Res> {
  __$$_StateCopyWithImpl(_$_State _value, $Res Function(_$_State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? tenantId = freezed,
    Object? businessServiceId = freezed,
    Object? sla = freezed,
    Object? state = freezed,
    Object? applicationStatus = freezed,
    Object? docUploadRequired = freezed,
    Object? isStartState = freezed,
    Object? isTerminateState = freezed,
    Object? isStateUpdatable = freezed,
    Object? actions = freezed,
  }) {
    return _then(_$_State(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessServiceId: freezed == businessServiceId
          ? _value.businessServiceId
          : businessServiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      sla: freezed == sla
          ? _value.sla
          : sla // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationStatus: freezed == applicationStatus
          ? _value.applicationStatus
          : applicationStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      docUploadRequired: freezed == docUploadRequired
          ? _value.docUploadRequired
          : docUploadRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStartState: freezed == isStartState
          ? _value.isStartState
          : isStartState // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTerminateState: freezed == isTerminateState
          ? _value.isTerminateState
          : isTerminateState // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStateUpdatable: freezed == isStateUpdatable
          ? _value.isStateUpdatable
          : isStateUpdatable // ignore: cast_nullable_to_non_nullable
              as bool?,
      actions: freezed == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_State implements _State {
  const _$_State(
      {@JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'businessServiceId') this.businessServiceId,
      @JsonKey(name: 'sla') this.sla,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'applicationStatus') this.applicationStatus,
      @JsonKey(name: 'docUploadRequired') this.docUploadRequired,
      @JsonKey(name: 'isStartState') this.isStartState,
      @JsonKey(name: 'isTerminateState') this.isTerminateState,
      @JsonKey(name: 'isStateUpdatable') this.isStateUpdatable,
      @JsonKey(name: 'actions') final List<Action>? actions})
      : _actions = actions;

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$$_StateFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'businessServiceId')
  final String? businessServiceId;
  @override
  @JsonKey(name: 'sla')
  final int? sla;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'applicationStatus')
  final String? applicationStatus;
  @override
  @JsonKey(name: 'docUploadRequired')
  final bool? docUploadRequired;
  @override
  @JsonKey(name: 'isStartState')
  final bool? isStartState;
  @override
  @JsonKey(name: 'isTerminateState')
  final bool? isTerminateState;
  @override
  @JsonKey(name: 'isStateUpdatable')
  final bool? isStateUpdatable;
  final List<Action>? _actions;
  @override
  @JsonKey(name: 'actions')
  List<Action>? get actions {
    final value = _actions;
    if (value == null) return null;
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'State(uuid: $uuid, tenantId: $tenantId, businessServiceId: $businessServiceId, sla: $sla, state: $state, applicationStatus: $applicationStatus, docUploadRequired: $docUploadRequired, isStartState: $isStartState, isTerminateState: $isTerminateState, isStateUpdatable: $isStateUpdatable, actions: $actions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_State &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.businessServiceId, businessServiceId) ||
                other.businessServiceId == businessServiceId) &&
            (identical(other.sla, sla) || other.sla == sla) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.applicationStatus, applicationStatus) ||
                other.applicationStatus == applicationStatus) &&
            (identical(other.docUploadRequired, docUploadRequired) ||
                other.docUploadRequired == docUploadRequired) &&
            (identical(other.isStartState, isStartState) ||
                other.isStartState == isStartState) &&
            (identical(other.isTerminateState, isTerminateState) ||
                other.isTerminateState == isTerminateState) &&
            (identical(other.isStateUpdatable, isStateUpdatable) ||
                other.isStateUpdatable == isStateUpdatable) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      tenantId,
      businessServiceId,
      sla,
      state,
      applicationStatus,
      docUploadRequired,
      isStartState,
      isTerminateState,
      isStateUpdatable,
      const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateCopyWith<_$_State> get copyWith =>
      __$$_StateCopyWithImpl<_$_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateToJson(
      this,
    );
  }
}

abstract class _State implements State {
  const factory _State(
      {@JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'businessServiceId') final String? businessServiceId,
      @JsonKey(name: 'sla') final int? sla,
      @JsonKey(name: 'state') final String? state,
      @JsonKey(name: 'applicationStatus') final String? applicationStatus,
      @JsonKey(name: 'docUploadRequired') final bool? docUploadRequired,
      @JsonKey(name: 'isStartState') final bool? isStartState,
      @JsonKey(name: 'isTerminateState') final bool? isTerminateState,
      @JsonKey(name: 'isStateUpdatable') final bool? isStateUpdatable,
      @JsonKey(name: 'actions') final List<Action>? actions}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'businessServiceId')
  String? get businessServiceId;
  @override
  @JsonKey(name: 'sla')
  int? get sla;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'applicationStatus')
  String? get applicationStatus;
  @override
  @JsonKey(name: 'docUploadRequired')
  bool? get docUploadRequired;
  @override
  @JsonKey(name: 'isStartState')
  bool? get isStartState;
  @override
  @JsonKey(name: 'isTerminateState')
  bool? get isTerminateState;
  @override
  @JsonKey(name: 'isStateUpdatable')
  bool? get isStateUpdatable;
  @override
  @JsonKey(name: 'actions')
  List<Action>? get actions;
  @override
  @JsonKey(ignore: true)
  _$$_StateCopyWith<_$_State> get copyWith =>
      throw _privateConstructorUsedError;
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return _Action.fromJson(json);
}

/// @nodoc
mixin _$Action {
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentState')
  String? get currentState => throw _privateConstructorUsedError;
  @JsonKey(name: 'action')
  String? get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextState')
  String? get nextState => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<String>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionCopyWith<Action> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCopyWith<$Res> {
  factory $ActionCopyWith(Action value, $Res Function(Action) then) =
      _$ActionCopyWithImpl<$Res, Action>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'currentState') String? currentState,
      @JsonKey(name: 'action') String? action,
      @JsonKey(name: 'nextState') String? nextState,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'roles') List<String>? roles});
}

/// @nodoc
class _$ActionCopyWithImpl<$Res, $Val extends Action>
    implements $ActionCopyWith<$Res> {
  _$ActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? tenantId = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
    Object? nextState = freezed,
    Object? active = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      nextState: freezed == nextState
          ? _value.nextState
          : nextState // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionCopyWith<$Res> implements $ActionCopyWith<$Res> {
  factory _$$_ActionCopyWith(_$_Action value, $Res Function(_$_Action) then) =
      __$$_ActionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'currentState') String? currentState,
      @JsonKey(name: 'action') String? action,
      @JsonKey(name: 'nextState') String? nextState,
      @JsonKey(name: 'active') bool? active,
      @JsonKey(name: 'roles') List<String>? roles});
}

/// @nodoc
class __$$_ActionCopyWithImpl<$Res>
    extends _$ActionCopyWithImpl<$Res, _$_Action>
    implements _$$_ActionCopyWith<$Res> {
  __$$_ActionCopyWithImpl(_$_Action _value, $Res Function(_$_Action) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? tenantId = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
    Object? nextState = freezed,
    Object? active = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$_Action(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentState: freezed == currentState
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      nextState: freezed == nextState
          ? _value.nextState
          : nextState // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Action implements _Action {
  const _$_Action(
      {@JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'currentState') this.currentState,
      @JsonKey(name: 'action') this.action,
      @JsonKey(name: 'nextState') this.nextState,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'roles') final List<String>? roles})
      : _roles = roles;

  factory _$_Action.fromJson(Map<String, dynamic> json) =>
      _$$_ActionFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'currentState')
  final String? currentState;
  @override
  @JsonKey(name: 'action')
  final String? action;
  @override
  @JsonKey(name: 'nextState')
  final String? nextState;
  @override
  @JsonKey(name: 'active')
  final bool? active;
  final List<String>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Action(uuid: $uuid, tenantId: $tenantId, currentState: $currentState, action: $action, nextState: $nextState, active: $active, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Action &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.currentState, currentState) ||
                other.currentState == currentState) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.nextState, nextState) ||
                other.nextState == nextState) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, tenantId, currentState,
      action, nextState, active, const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionCopyWith<_$_Action> get copyWith =>
      __$$_ActionCopyWithImpl<_$_Action>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActionToJson(
      this,
    );
  }
}

abstract class _Action implements Action {
  const factory _Action(
      {@JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'currentState') final String? currentState,
      @JsonKey(name: 'action') final String? action,
      @JsonKey(name: 'nextState') final String? nextState,
      @JsonKey(name: 'active') final bool? active,
      @JsonKey(name: 'roles') final List<String>? roles}) = _$_Action;

  factory _Action.fromJson(Map<String, dynamic> json) = _$_Action.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'currentState')
  String? get currentState;
  @override
  @JsonKey(name: 'action')
  String? get action;
  @override
  @JsonKey(name: 'nextState')
  String? get nextState;
  @override
  @JsonKey(name: 'active')
  bool? get active;
  @override
  @JsonKey(name: 'roles')
  List<String>? get roles;
  @override
  @JsonKey(ignore: true)
  _$$_ActionCopyWith<_$_Action> get copyWith =>
      throw _privateConstructorUsedError;
}

Assigner _$AssignerFromJson(Map<String, dynamic> json) {
  return _Assigner.fromJson(json);
}

/// @nodoc
mixin _$Assigner {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'emailId')
  String? get emailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignerCopyWith<Assigner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignerCopyWith<$Res> {
  factory $AssignerCopyWith(Assigner value, $Res Function(Assigner) then) =
      _$AssignerCopyWithImpl<$Res, Assigner>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? userName,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'emailId') String? emailId,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'roles') List<Role>? roles});
}

/// @nodoc
class _$AssignerCopyWithImpl<$Res, $Val extends Assigner>
    implements $AssignerCopyWith<$Res> {
  _$AssignerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? tenantId = freezed,
    Object? uuid = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignerCopyWith<$Res> implements $AssignerCopyWith<$Res> {
  factory _$$_AssignerCopyWith(
          _$_Assigner value, $Res Function(_$_Assigner) then) =
      __$$_AssignerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? userName,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'emailId') String? emailId,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'roles') List<Role>? roles});
}

/// @nodoc
class __$$_AssignerCopyWithImpl<$Res>
    extends _$AssignerCopyWithImpl<$Res, _$_Assigner>
    implements _$$_AssignerCopyWith<$Res> {
  __$$_AssignerCopyWithImpl(
      _$_Assigner _value, $Res Function(_$_Assigner) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? tenantId = freezed,
    Object? uuid = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$_Assigner(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assigner implements _Assigner {
  const _$_Assigner(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'userName') this.userName,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mobileNumber') this.mobileNumber,
      @JsonKey(name: 'emailId') this.emailId,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'roles') final List<Role>? roles})
      : _roles = roles;

  factory _$_Assigner.fromJson(Map<String, dynamic> json) =>
      _$$_AssignerFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'userName')
  final String? userName;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'mobileNumber')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'emailId')
  final String? emailId;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  final List<Role>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Assigner(id: $id, userName: $userName, name: $name, type: $type, mobileNumber: $mobileNumber, emailId: $emailId, tenantId: $tenantId, uuid: $uuid, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assigner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      name,
      type,
      mobileNumber,
      emailId,
      tenantId,
      uuid,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssignerCopyWith<_$_Assigner> get copyWith =>
      __$$_AssignerCopyWithImpl<_$_Assigner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignerToJson(
      this,
    );
  }
}

abstract class _Assigner implements Assigner {
  const factory _Assigner(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'userName') final String? userName,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'mobileNumber') final String? mobileNumber,
      @JsonKey(name: 'emailId') final String? emailId,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'roles') final List<Role>? roles}) = _$_Assigner;

  factory _Assigner.fromJson(Map<String, dynamic> json) = _$_Assigner.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'userName')
  String? get userName;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'emailId')
  String? get emailId;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles;
  @override
  @JsonKey(ignore: true)
  _$$_AssignerCopyWith<_$_Assigner> get copyWith =>
      throw _privateConstructorUsedError;
}

Assigne _$AssigneFromJson(Map<String, dynamic> json) {
  return _Assigne.fromJson(json);
}

/// @nodoc
mixin _$Assigne {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'emailId')
  String? get emailId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid')
  String? get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssigneCopyWith<Assigne> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssigneCopyWith<$Res> {
  factory $AssigneCopyWith(Assigne value, $Res Function(Assigne) then) =
      _$AssigneCopyWithImpl<$Res, Assigne>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? userName,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'emailId') String? emailId,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'roles') List<Role>? roles});
}

/// @nodoc
class _$AssigneCopyWithImpl<$Res, $Val extends Assigne>
    implements $AssigneCopyWith<$Res> {
  _$AssigneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? tenantId = freezed,
    Object? uuid = freezed,
    Object? roles = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssigneCopyWith<$Res> implements $AssigneCopyWith<$Res> {
  factory _$$_AssigneCopyWith(
          _$_Assigne value, $Res Function(_$_Assigne) then) =
      __$$_AssigneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'userName') String? userName,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'mobileNumber') String? mobileNumber,
      @JsonKey(name: 'emailId') String? emailId,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'uuid') String? uuid,
      @JsonKey(name: 'roles') List<Role>? roles});
}

/// @nodoc
class __$$_AssigneCopyWithImpl<$Res>
    extends _$AssigneCopyWithImpl<$Res, _$_Assigne>
    implements _$$_AssigneCopyWith<$Res> {
  __$$_AssigneCopyWithImpl(_$_Assigne _value, $Res Function(_$_Assigne) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userName = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? tenantId = freezed,
    Object? uuid = freezed,
    Object? roles = freezed,
  }) {
    return _then(_$_Assigne(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assigne implements _Assigne {
  const _$_Assigne(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'userName') this.userName,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mobileNumber') this.mobileNumber,
      @JsonKey(name: 'emailId') this.emailId,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'uuid') this.uuid,
      @JsonKey(name: 'roles') final List<Role>? roles})
      : _roles = roles;

  factory _$_Assigne.fromJson(Map<String, dynamic> json) =>
      _$$_AssigneFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'userName')
  final String? userName;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'mobileNumber')
  final String? mobileNumber;
  @override
  @JsonKey(name: 'emailId')
  final String? emailId;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'uuid')
  final String? uuid;
  final List<Role>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Assigne(id: $id, userName: $userName, name: $name, type: $type, mobileNumber: $mobileNumber, emailId: $emailId, tenantId: $tenantId, uuid: $uuid, roles: $roles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assigne &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userName,
      name,
      type,
      mobileNumber,
      emailId,
      tenantId,
      uuid,
      const DeepCollectionEquality().hash(_roles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssigneCopyWith<_$_Assigne> get copyWith =>
      __$$_AssigneCopyWithImpl<_$_Assigne>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssigneToJson(
      this,
    );
  }
}

abstract class _Assigne implements Assigne {
  const factory _Assigne(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'userName') final String? userName,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'mobileNumber') final String? mobileNumber,
      @JsonKey(name: 'emailId') final String? emailId,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'uuid') final String? uuid,
      @JsonKey(name: 'roles') final List<Role>? roles}) = _$_Assigne;

  factory _Assigne.fromJson(Map<String, dynamic> json) = _$_Assigne.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'userName')
  String? get userName;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'mobileNumber')
  String? get mobileNumber;
  @override
  @JsonKey(name: 'emailId')
  String? get emailId;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'uuid')
  String? get uuid;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles;
  @override
  @JsonKey(ignore: true)
  _$$_AssigneCopyWith<_$_Assigne> get copyWith =>
      throw _privateConstructorUsedError;
}

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'tenantId') String? tenantId});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$_RoleCopyWith(_$_Role value, $Res Function(_$_Role) then) =
      __$$_RoleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'code') String? code,
      @JsonKey(name: 'tenantId') String? tenantId});
}

/// @nodoc
class __$$_RoleCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res, _$_Role>
    implements _$$_RoleCopyWith<$Res> {
  __$$_RoleCopyWithImpl(_$_Role _value, $Res Function(_$_Role) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
    Object? code = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_$_Role(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
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
class _$_Role implements _Role {
  const _$_Role(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'code') this.code,
      @JsonKey(name: 'tenantId') this.tenantId});

  factory _$_Role.fromJson(Map<String, dynamic> json) => _$$_RoleFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'code')
  final String? code;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;

  @override
  String toString() {
    return 'Role(name: $name, id: $id, code: $code, tenantId: $tenantId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Role &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, code, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RoleCopyWith<_$_Role> get copyWith =>
      __$$_RoleCopyWithImpl<_$_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'code') final String? code,
      @JsonKey(name: 'tenantId') final String? tenantId}) = _$_Role;

  factory _Role.fromJson(Map<String, dynamic> json) = _$_Role.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'code')
  String? get code;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$_RoleCopyWith<_$_Role> get copyWith => throw _privateConstructorUsedError;
}

BusinessObject _$BusinessObjectFromJson(Map<String, dynamic> json) {
  return _BusinessObject.fromJson(json);
}

/// @nodoc
mixin _$BusinessObject {
  @JsonKey(name: 'measurementNumber')
  String? get measurementNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceId')
  String? get referenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'measures')
  List<Measure>? get measures => throw _privateConstructorUsedError;
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'contract')
  Contract? get contract => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceSla')
  int? get serviceSla => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalDetails')
  MeasurementAdditionalDetail? get measurementAdditionalDetail =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessObjectCopyWith<BusinessObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessObjectCopyWith<$Res> {
  factory $BusinessObjectCopyWith(
          BusinessObject value, $Res Function(BusinessObject) then) =
      _$BusinessObjectCopyWithImpl<$Res, BusinessObject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'measurementNumber')
          String? measurementNumber,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'measures')
          List<Measure>? measures,
      @JsonKey(name: 'auditDetails')
          AuditDetails? auditDetails,
      @JsonKey(name: 'contract')
          Contract? contract,
      @JsonKey(name: 'serviceSla')
          int? serviceSla,
      @JsonKey(name: 'additionalDetails')
          MeasurementAdditionalDetail? measurementAdditionalDetail});

  $AuditDetailsCopyWith<$Res>? get auditDetails;
  $ContractCopyWith<$Res>? get contract;
  $MeasurementAdditionalDetailCopyWith<$Res>? get measurementAdditionalDetail;
}

/// @nodoc
class _$BusinessObjectCopyWithImpl<$Res, $Val extends BusinessObject>
    implements $BusinessObjectCopyWith<$Res> {
  _$BusinessObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurementNumber = freezed,
    Object? id = freezed,
    Object? referenceId = freezed,
    Object? measures = freezed,
    Object? auditDetails = freezed,
    Object? contract = freezed,
    Object? serviceSla = freezed,
    Object? measurementAdditionalDetail = freezed,
  }) {
    return _then(_value.copyWith(
      measurementNumber: freezed == measurementNumber
          ? _value.measurementNumber
          : measurementNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      measures: freezed == measures
          ? _value.measures
          : measures // ignore: cast_nullable_to_non_nullable
              as List<Measure>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      serviceSla: freezed == serviceSla
          ? _value.serviceSla
          : serviceSla // ignore: cast_nullable_to_non_nullable
              as int?,
      measurementAdditionalDetail: freezed == measurementAdditionalDetail
          ? _value.measurementAdditionalDetail
          : measurementAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as MeasurementAdditionalDetail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuditDetailsCopyWith<$Res>? get auditDetails {
    if (_value.auditDetails == null) {
      return null;
    }

    return $AuditDetailsCopyWith<$Res>(_value.auditDetails!, (value) {
      return _then(_value.copyWith(auditDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContractCopyWith<$Res>? get contract {
    if (_value.contract == null) {
      return null;
    }

    return $ContractCopyWith<$Res>(_value.contract!, (value) {
      return _then(_value.copyWith(contract: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementAdditionalDetailCopyWith<$Res>? get measurementAdditionalDetail {
    if (_value.measurementAdditionalDetail == null) {
      return null;
    }

    return $MeasurementAdditionalDetailCopyWith<$Res>(
        _value.measurementAdditionalDetail!, (value) {
      return _then(_value.copyWith(measurementAdditionalDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BusinessObjectCopyWith<$Res>
    implements $BusinessObjectCopyWith<$Res> {
  factory _$$_BusinessObjectCopyWith(
          _$_BusinessObject value, $Res Function(_$_BusinessObject) then) =
      __$$_BusinessObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'measurementNumber')
          String? measurementNumber,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'measures')
          List<Measure>? measures,
      @JsonKey(name: 'auditDetails')
          AuditDetails? auditDetails,
      @JsonKey(name: 'contract')
          Contract? contract,
      @JsonKey(name: 'serviceSla')
          int? serviceSla,
      @JsonKey(name: 'additionalDetails')
          MeasurementAdditionalDetail? measurementAdditionalDetail});

  @override
  $AuditDetailsCopyWith<$Res>? get auditDetails;
  @override
  $ContractCopyWith<$Res>? get contract;
  @override
  $MeasurementAdditionalDetailCopyWith<$Res>? get measurementAdditionalDetail;
}

/// @nodoc
class __$$_BusinessObjectCopyWithImpl<$Res>
    extends _$BusinessObjectCopyWithImpl<$Res, _$_BusinessObject>
    implements _$$_BusinessObjectCopyWith<$Res> {
  __$$_BusinessObjectCopyWithImpl(
      _$_BusinessObject _value, $Res Function(_$_BusinessObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurementNumber = freezed,
    Object? id = freezed,
    Object? referenceId = freezed,
    Object? measures = freezed,
    Object? auditDetails = freezed,
    Object? contract = freezed,
    Object? serviceSla = freezed,
    Object? measurementAdditionalDetail = freezed,
  }) {
    return _then(_$_BusinessObject(
      measurementNumber: freezed == measurementNumber
          ? _value.measurementNumber
          : measurementNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      measures: freezed == measures
          ? _value._measures
          : measures // ignore: cast_nullable_to_non_nullable
              as List<Measure>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      serviceSla: freezed == serviceSla
          ? _value.serviceSla
          : serviceSla // ignore: cast_nullable_to_non_nullable
              as int?,
      measurementAdditionalDetail: freezed == measurementAdditionalDetail
          ? _value.measurementAdditionalDetail
          : measurementAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as MeasurementAdditionalDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessObject implements _BusinessObject {
  const _$_BusinessObject(
      {@JsonKey(name: 'measurementNumber') this.measurementNumber,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'referenceId') this.referenceId,
      @JsonKey(name: 'measures') final List<Measure>? measures,
      @JsonKey(name: 'auditDetails') this.auditDetails,
      @JsonKey(name: 'contract') this.contract,
      @JsonKey(name: 'serviceSla') this.serviceSla,
      @JsonKey(name: 'additionalDetails') this.measurementAdditionalDetail})
      : _measures = measures;

  factory _$_BusinessObject.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessObjectFromJson(json);

  @override
  @JsonKey(name: 'measurementNumber')
  final String? measurementNumber;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'referenceId')
  final String? referenceId;
  final List<Measure>? _measures;
  @override
  @JsonKey(name: 'measures')
  List<Measure>? get measures {
    final value = _measures;
    if (value == null) return null;
    if (_measures is EqualUnmodifiableListView) return _measures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'auditDetails')
  final AuditDetails? auditDetails;
  @override
  @JsonKey(name: 'contract')
  final Contract? contract;
  @override
  @JsonKey(name: 'serviceSla')
  final int? serviceSla;
  @override
  @JsonKey(name: 'additionalDetails')
  final MeasurementAdditionalDetail? measurementAdditionalDetail;

  @override
  String toString() {
    return 'BusinessObject(measurementNumber: $measurementNumber, id: $id, referenceId: $referenceId, measures: $measures, auditDetails: $auditDetails, contract: $contract, serviceSla: $serviceSla, measurementAdditionalDetail: $measurementAdditionalDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessObject &&
            (identical(other.measurementNumber, measurementNumber) ||
                other.measurementNumber == measurementNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            const DeepCollectionEquality().equals(other._measures, _measures) &&
            (identical(other.auditDetails, auditDetails) ||
                other.auditDetails == auditDetails) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.serviceSla, serviceSla) ||
                other.serviceSla == serviceSla) &&
            (identical(other.measurementAdditionalDetail,
                    measurementAdditionalDetail) ||
                other.measurementAdditionalDetail ==
                    measurementAdditionalDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      measurementNumber,
      id,
      referenceId,
      const DeepCollectionEquality().hash(_measures),
      auditDetails,
      contract,
      serviceSla,
      measurementAdditionalDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusinessObjectCopyWith<_$_BusinessObject> get copyWith =>
      __$$_BusinessObjectCopyWithImpl<_$_BusinessObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessObjectToJson(
      this,
    );
  }
}

abstract class _BusinessObject implements BusinessObject {
  const factory _BusinessObject(
          {@JsonKey(name: 'measurementNumber')
              final String? measurementNumber,
          @JsonKey(name: 'id')
              final String? id,
          @JsonKey(name: 'referenceId')
              final String? referenceId,
          @JsonKey(name: 'measures')
              final List<Measure>? measures,
          @JsonKey(name: 'auditDetails')
              final AuditDetails? auditDetails,
          @JsonKey(name: 'contract')
              final Contract? contract,
          @JsonKey(name: 'serviceSla')
              final int? serviceSla,
          @JsonKey(name: 'additionalDetails')
              final MeasurementAdditionalDetail? measurementAdditionalDetail}) =
      _$_BusinessObject;

  factory _BusinessObject.fromJson(Map<String, dynamic> json) =
      _$_BusinessObject.fromJson;

  @override
  @JsonKey(name: 'measurementNumber')
  String? get measurementNumber;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'referenceId')
  String? get referenceId;
  @override
  @JsonKey(name: 'measures')
  List<Measure>? get measures;
  @override
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails;
  @override
  @JsonKey(name: 'contract')
  Contract? get contract;
  @override
  @JsonKey(name: 'serviceSla')
  int? get serviceSla;
  @override
  @JsonKey(name: 'additionalDetails')
  MeasurementAdditionalDetail? get measurementAdditionalDetail;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessObjectCopyWith<_$_BusinessObject> get copyWith =>
      throw _privateConstructorUsedError;
}

Measure _$MeasureFromJson(Map<String, dynamic> json) {
  return _Measure.fromJson(json);
}

/// @nodoc
mixin _$Measure {
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments')
  String? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'targetId')
  String? get targetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'breadth')
  double? get breadth => throw _privateConstructorUsedError;
  @JsonKey(name: 'length')
  double? get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceId')
  String? get referenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'numItems')
  double? get numItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentValue')
  double? get currentValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'cumulativeValue')
  double? get cumulativeValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  double? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalDetails')
  MeasureAdditionalDetails? get measureAdditionalDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasureCopyWith<Measure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasureCopyWith<$Res> {
  factory $MeasureCopyWith(Measure value, $Res Function(Measure) then) =
      _$MeasureCopyWithImpl<$Res, Measure>;
  @useResult
  $Res call(
      {@JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'comments')
          String? comments,
      @JsonKey(name: 'targetId')
          String? targetId,
      @JsonKey(name: 'breadth')
          double? breadth,
      @JsonKey(name: 'length')
          double? length,
      @JsonKey(name: 'isActive')
          bool? isActive,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'numItems')
          double? numItems,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'currentValue')
          double? currentValue,
      @JsonKey(name: 'cumulativeValue')
          double? cumulativeValue,
      @JsonKey(name: 'height')
          double? height,
      @JsonKey(name: 'additionalDetails')
          MeasureAdditionalDetails? measureAdditionalDetails});

  $MeasureAdditionalDetailsCopyWith<$Res>? get measureAdditionalDetails;
}

/// @nodoc
class _$MeasureCopyWithImpl<$Res, $Val extends Measure>
    implements $MeasureCopyWith<$Res> {
  _$MeasureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? comments = freezed,
    Object? targetId = freezed,
    Object? breadth = freezed,
    Object? length = freezed,
    Object? isActive = freezed,
    Object? referenceId = freezed,
    Object? numItems = freezed,
    Object? id = freezed,
    Object? currentValue = freezed,
    Object? cumulativeValue = freezed,
    Object? height = freezed,
    Object? measureAdditionalDetails = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: freezed == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String?,
      breadth: freezed == breadth
          ? _value.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      numItems: freezed == numItems
          ? _value.numItems
          : numItems // ignore: cast_nullable_to_non_nullable
              as double?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      cumulativeValue: freezed == cumulativeValue
          ? _value.cumulativeValue
          : cumulativeValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      measureAdditionalDetails: freezed == measureAdditionalDetails
          ? _value.measureAdditionalDetails
          : measureAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as MeasureAdditionalDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasureAdditionalDetailsCopyWith<$Res>? get measureAdditionalDetails {
    if (_value.measureAdditionalDetails == null) {
      return null;
    }

    return $MeasureAdditionalDetailsCopyWith<$Res>(
        _value.measureAdditionalDetails!, (value) {
      return _then(_value.copyWith(measureAdditionalDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MeasureCopyWith<$Res> implements $MeasureCopyWith<$Res> {
  factory _$$_MeasureCopyWith(
          _$_Measure value, $Res Function(_$_Measure) then) =
      __$$_MeasureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'description')
          String? description,
      @JsonKey(name: 'comments')
          String? comments,
      @JsonKey(name: 'targetId')
          String? targetId,
      @JsonKey(name: 'breadth')
          double? breadth,
      @JsonKey(name: 'length')
          double? length,
      @JsonKey(name: 'isActive')
          bool? isActive,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'numItems')
          double? numItems,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'currentValue')
          double? currentValue,
      @JsonKey(name: 'cumulativeValue')
          double? cumulativeValue,
      @JsonKey(name: 'height')
          double? height,
      @JsonKey(name: 'additionalDetails')
          MeasureAdditionalDetails? measureAdditionalDetails});

  @override
  $MeasureAdditionalDetailsCopyWith<$Res>? get measureAdditionalDetails;
}

/// @nodoc
class __$$_MeasureCopyWithImpl<$Res>
    extends _$MeasureCopyWithImpl<$Res, _$_Measure>
    implements _$$_MeasureCopyWith<$Res> {
  __$$_MeasureCopyWithImpl(_$_Measure _value, $Res Function(_$_Measure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? comments = freezed,
    Object? targetId = freezed,
    Object? breadth = freezed,
    Object? length = freezed,
    Object? isActive = freezed,
    Object? referenceId = freezed,
    Object? numItems = freezed,
    Object? id = freezed,
    Object? currentValue = freezed,
    Object? cumulativeValue = freezed,
    Object? height = freezed,
    Object? measureAdditionalDetails = freezed,
  }) {
    return _then(_$_Measure(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: freezed == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String?,
      breadth: freezed == breadth
          ? _value.breadth
          : breadth // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      numItems: freezed == numItems
          ? _value.numItems
          : numItems // ignore: cast_nullable_to_non_nullable
              as double?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      cumulativeValue: freezed == cumulativeValue
          ? _value.cumulativeValue
          : cumulativeValue // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      measureAdditionalDetails: freezed == measureAdditionalDetails
          ? _value.measureAdditionalDetails
          : measureAdditionalDetails // ignore: cast_nullable_to_non_nullable
              as MeasureAdditionalDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Measure implements _Measure {
  const _$_Measure(
      {@JsonKey(name: 'description') this.description,
      @JsonKey(name: 'comments') this.comments,
      @JsonKey(name: 'targetId') this.targetId,
      @JsonKey(name: 'breadth') this.breadth,
      @JsonKey(name: 'length') this.length,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'referenceId') this.referenceId,
      @JsonKey(name: 'numItems') this.numItems,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'currentValue') this.currentValue,
      @JsonKey(name: 'cumulativeValue') this.cumulativeValue,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'additionalDetails') this.measureAdditionalDetails});

  factory _$_Measure.fromJson(Map<String, dynamic> json) =>
      _$$_MeasureFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'comments')
  final String? comments;
  @override
  @JsonKey(name: 'targetId')
  final String? targetId;
  @override
  @JsonKey(name: 'breadth')
  final double? breadth;
  @override
  @JsonKey(name: 'length')
  final double? length;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'referenceId')
  final String? referenceId;
  @override
  @JsonKey(name: 'numItems')
  final double? numItems;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'currentValue')
  final double? currentValue;
  @override
  @JsonKey(name: 'cumulativeValue')
  final double? cumulativeValue;
  @override
  @JsonKey(name: 'height')
  final double? height;
  @override
  @JsonKey(name: 'additionalDetails')
  final MeasureAdditionalDetails? measureAdditionalDetails;

  @override
  String toString() {
    return 'Measure(description: $description, comments: $comments, targetId: $targetId, breadth: $breadth, length: $length, isActive: $isActive, referenceId: $referenceId, numItems: $numItems, id: $id, currentValue: $currentValue, cumulativeValue: $cumulativeValue, height: $height, measureAdditionalDetails: $measureAdditionalDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Measure &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.breadth, breadth) || other.breadth == breadth) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.numItems, numItems) ||
                other.numItems == numItems) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.cumulativeValue, cumulativeValue) ||
                other.cumulativeValue == cumulativeValue) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(
                    other.measureAdditionalDetails, measureAdditionalDetails) ||
                other.measureAdditionalDetails == measureAdditionalDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      comments,
      targetId,
      breadth,
      length,
      isActive,
      referenceId,
      numItems,
      id,
      currentValue,
      cumulativeValue,
      height,
      measureAdditionalDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasureCopyWith<_$_Measure> get copyWith =>
      __$$_MeasureCopyWithImpl<_$_Measure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasureToJson(
      this,
    );
  }
}

abstract class _Measure implements Measure {
  const factory _Measure(
          {@JsonKey(name: 'description')
              final String? description,
          @JsonKey(name: 'comments')
              final String? comments,
          @JsonKey(name: 'targetId')
              final String? targetId,
          @JsonKey(name: 'breadth')
              final double? breadth,
          @JsonKey(name: 'length')
              final double? length,
          @JsonKey(name: 'isActive')
              final bool? isActive,
          @JsonKey(name: 'referenceId')
              final String? referenceId,
          @JsonKey(name: 'numItems')
              final double? numItems,
          @JsonKey(name: 'id')
              final String? id,
          @JsonKey(name: 'currentValue')
              final double? currentValue,
          @JsonKey(name: 'cumulativeValue')
              final double? cumulativeValue,
          @JsonKey(name: 'height')
              final double? height,
          @JsonKey(name: 'additionalDetails')
              final MeasureAdditionalDetails? measureAdditionalDetails}) =
      _$_Measure;

  factory _Measure.fromJson(Map<String, dynamic> json) = _$_Measure.fromJson;

  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'comments')
  String? get comments;
  @override
  @JsonKey(name: 'targetId')
  String? get targetId;
  @override
  @JsonKey(name: 'breadth')
  double? get breadth;
  @override
  @JsonKey(name: 'length')
  double? get length;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'referenceId')
  String? get referenceId;
  @override
  @JsonKey(name: 'numItems')
  double? get numItems;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'currentValue')
  double? get currentValue;
  @override
  @JsonKey(name: 'cumulativeValue')
  double? get cumulativeValue;
  @override
  @JsonKey(name: 'height')
  double? get height;
  @override
  @JsonKey(name: 'additionalDetails')
  MeasureAdditionalDetails? get measureAdditionalDetails;
  @override
  @JsonKey(ignore: true)
  _$$_MeasureCopyWith<_$_Measure> get copyWith =>
      throw _privateConstructorUsedError;
}

MeasureAdditionalDetails _$MeasureAdditionalDetailsFromJson(
    Map<String, dynamic> json) {
  return _MeasureAdditionalDetails.fromJson(json);
}

/// @nodoc
mixin _$MeasureAdditionalDetails {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mbAmount')
  double? get mbAmount => throw _privateConstructorUsedError;
  @JsonKey(name: "measureLineItems")
  List<MeasureLineItem>? get measureLineItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasureAdditionalDetailsCopyWith<MeasureAdditionalDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasureAdditionalDetailsCopyWith<$Res> {
  factory $MeasureAdditionalDetailsCopyWith(MeasureAdditionalDetails value,
          $Res Function(MeasureAdditionalDetails) then) =
      _$MeasureAdditionalDetailsCopyWithImpl<$Res, MeasureAdditionalDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
          String? type,
      @JsonKey(name: 'mbAmount')
          double? mbAmount,
      @JsonKey(name: "measureLineItems")
          List<MeasureLineItem>? measureLineItems});
}

/// @nodoc
class _$MeasureAdditionalDetailsCopyWithImpl<$Res,
        $Val extends MeasureAdditionalDetails>
    implements $MeasureAdditionalDetailsCopyWith<$Res> {
  _$MeasureAdditionalDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? mbAmount = freezed,
    Object? measureLineItems = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mbAmount: freezed == mbAmount
          ? _value.mbAmount
          : mbAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      measureLineItems: freezed == measureLineItems
          ? _value.measureLineItems
          : measureLineItems // ignore: cast_nullable_to_non_nullable
              as List<MeasureLineItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasureAdditionalDetailsCopyWith<$Res>
    implements $MeasureAdditionalDetailsCopyWith<$Res> {
  factory _$$_MeasureAdditionalDetailsCopyWith(
          _$_MeasureAdditionalDetails value,
          $Res Function(_$_MeasureAdditionalDetails) then) =
      __$$_MeasureAdditionalDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
          String? type,
      @JsonKey(name: 'mbAmount')
          double? mbAmount,
      @JsonKey(name: "measureLineItems")
          List<MeasureLineItem>? measureLineItems});
}

/// @nodoc
class __$$_MeasureAdditionalDetailsCopyWithImpl<$Res>
    extends _$MeasureAdditionalDetailsCopyWithImpl<$Res,
        _$_MeasureAdditionalDetails>
    implements _$$_MeasureAdditionalDetailsCopyWith<$Res> {
  __$$_MeasureAdditionalDetailsCopyWithImpl(_$_MeasureAdditionalDetails _value,
      $Res Function(_$_MeasureAdditionalDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? mbAmount = freezed,
    Object? measureLineItems = freezed,
  }) {
    return _then(_$_MeasureAdditionalDetails(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      mbAmount: freezed == mbAmount
          ? _value.mbAmount
          : mbAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      measureLineItems: freezed == measureLineItems
          ? _value._measureLineItems
          : measureLineItems // ignore: cast_nullable_to_non_nullable
              as List<MeasureLineItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasureAdditionalDetails implements _MeasureAdditionalDetails {
  const _$_MeasureAdditionalDetails(
      {@JsonKey(name: 'type')
          this.type,
      @JsonKey(name: 'mbAmount')
          this.mbAmount,
      @JsonKey(name: "measureLineItems")
          final List<MeasureLineItem>? measureLineItems})
      : _measureLineItems = measureLineItems;

  factory _$_MeasureAdditionalDetails.fromJson(Map<String, dynamic> json) =>
      _$$_MeasureAdditionalDetailsFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'mbAmount')
  final double? mbAmount;
  final List<MeasureLineItem>? _measureLineItems;
  @override
  @JsonKey(name: "measureLineItems")
  List<MeasureLineItem>? get measureLineItems {
    final value = _measureLineItems;
    if (value == null) return null;
    if (_measureLineItems is EqualUnmodifiableListView)
      return _measureLineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MeasureAdditionalDetails(type: $type, mbAmount: $mbAmount, measureLineItems: $measureLineItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasureAdditionalDetails &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mbAmount, mbAmount) ||
                other.mbAmount == mbAmount) &&
            const DeepCollectionEquality()
                .equals(other._measureLineItems, _measureLineItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, mbAmount,
      const DeepCollectionEquality().hash(_measureLineItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasureAdditionalDetailsCopyWith<_$_MeasureAdditionalDetails>
      get copyWith => __$$_MeasureAdditionalDetailsCopyWithImpl<
          _$_MeasureAdditionalDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasureAdditionalDetailsToJson(
      this,
    );
  }
}

abstract class _MeasureAdditionalDetails implements MeasureAdditionalDetails {
  const factory _MeasureAdditionalDetails(
          {@JsonKey(name: 'type')
              final String? type,
          @JsonKey(name: 'mbAmount')
              final double? mbAmount,
          @JsonKey(name: "measureLineItems")
              final List<MeasureLineItem>? measureLineItems}) =
      _$_MeasureAdditionalDetails;

  factory _MeasureAdditionalDetails.fromJson(Map<String, dynamic> json) =
      _$_MeasureAdditionalDetails.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'mbAmount')
  double? get mbAmount;
  @override
  @JsonKey(name: "measureLineItems")
  List<MeasureLineItem>? get measureLineItems;
  @override
  @JsonKey(ignore: true)
  _$$_MeasureAdditionalDetailsCopyWith<_$_MeasureAdditionalDetails>
      get copyWith => throw _privateConstructorUsedError;
}

MeasureLineItem _$MeasureLineItemFromJson(Map<String, dynamic> json) {
  return _MeasureLineItem.fromJson(json);
}

/// @nodoc
mixin _$MeasureLineItem {
  @JsonKey(name: 'width')
  dynamic get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  dynamic get height => throw _privateConstructorUsedError;
  @JsonKey(name: "length")
  dynamic get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  dynamic get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  dynamic get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'measurelineitemNo')
  dynamic get measurelineitemNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasureLineItemCopyWith<MeasureLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasureLineItemCopyWith<$Res> {
  factory $MeasureLineItemCopyWith(
          MeasureLineItem value, $Res Function(MeasureLineItem) then) =
      _$MeasureLineItemCopyWithImpl<$Res, MeasureLineItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'width') dynamic width,
      @JsonKey(name: 'height') dynamic height,
      @JsonKey(name: "length") dynamic length,
      @JsonKey(name: 'number') dynamic number,
      @JsonKey(name: 'quantity') dynamic quantity,
      @JsonKey(name: 'measurelineitemNo') dynamic measurelineitemNo});
}

/// @nodoc
class _$MeasureLineItemCopyWithImpl<$Res, $Val extends MeasureLineItem>
    implements $MeasureLineItemCopyWith<$Res> {
  _$MeasureLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? length = freezed,
    Object? number = freezed,
    Object? quantity = freezed,
    Object? measurelineitemNo = freezed,
  }) {
    return _then(_value.copyWith(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
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
      measurelineitemNo: freezed == measurelineitemNo
          ? _value.measurelineitemNo
          : measurelineitemNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasureLineItemCopyWith<$Res>
    implements $MeasureLineItemCopyWith<$Res> {
  factory _$$_MeasureLineItemCopyWith(
          _$_MeasureLineItem value, $Res Function(_$_MeasureLineItem) then) =
      __$$_MeasureLineItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'width') dynamic width,
      @JsonKey(name: 'height') dynamic height,
      @JsonKey(name: "length") dynamic length,
      @JsonKey(name: 'number') dynamic number,
      @JsonKey(name: 'quantity') dynamic quantity,
      @JsonKey(name: 'measurelineitemNo') dynamic measurelineitemNo});
}

/// @nodoc
class __$$_MeasureLineItemCopyWithImpl<$Res>
    extends _$MeasureLineItemCopyWithImpl<$Res, _$_MeasureLineItem>
    implements _$$_MeasureLineItemCopyWith<$Res> {
  __$$_MeasureLineItemCopyWithImpl(
      _$_MeasureLineItem _value, $Res Function(_$_MeasureLineItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = freezed,
    Object? height = freezed,
    Object? length = freezed,
    Object? number = freezed,
    Object? quantity = freezed,
    Object? measurelineitemNo = freezed,
  }) {
    return _then(_$_MeasureLineItem(
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
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
      measurelineitemNo: freezed == measurelineitemNo
          ? _value.measurelineitemNo
          : measurelineitemNo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasureLineItem implements _MeasureLineItem {
  const _$_MeasureLineItem(
      {@JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: "length") this.length,
      @JsonKey(name: 'number') this.number,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'measurelineitemNo') this.measurelineitemNo});

  factory _$_MeasureLineItem.fromJson(Map<String, dynamic> json) =>
      _$$_MeasureLineItemFromJson(json);

  @override
  @JsonKey(name: 'width')
  final dynamic width;
  @override
  @JsonKey(name: 'height')
  final dynamic height;
  @override
  @JsonKey(name: "length")
  final dynamic length;
  @override
  @JsonKey(name: 'number')
  final dynamic number;
  @override
  @JsonKey(name: 'quantity')
  final dynamic quantity;
  @override
  @JsonKey(name: 'measurelineitemNo')
  final dynamic measurelineitemNo;

  @override
  String toString() {
    return 'MeasureLineItem(width: $width, height: $height, length: $length, number: $number, quantity: $quantity, measurelineitemNo: $measurelineitemNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasureLineItem &&
            const DeepCollectionEquality().equals(other.width, width) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.length, length) &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality()
                .equals(other.measurelineitemNo, measurelineitemNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(width),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(length),
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(measurelineitemNo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasureLineItemCopyWith<_$_MeasureLineItem> get copyWith =>
      __$$_MeasureLineItemCopyWithImpl<_$_MeasureLineItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasureLineItemToJson(
      this,
    );
  }
}

abstract class _MeasureLineItem implements MeasureLineItem {
  const factory _MeasureLineItem(
      {@JsonKey(name: 'width')
          final dynamic width,
      @JsonKey(name: 'height')
          final dynamic height,
      @JsonKey(name: "length")
          final dynamic length,
      @JsonKey(name: 'number')
          final dynamic number,
      @JsonKey(name: 'quantity')
          final dynamic quantity,
      @JsonKey(name: 'measurelineitemNo')
          final dynamic measurelineitemNo}) = _$_MeasureLineItem;

  factory _MeasureLineItem.fromJson(Map<String, dynamic> json) =
      _$_MeasureLineItem.fromJson;

  @override
  @JsonKey(name: 'width')
  dynamic get width;
  @override
  @JsonKey(name: 'height')
  dynamic get height;
  @override
  @JsonKey(name: "length")
  dynamic get length;
  @override
  @JsonKey(name: 'number')
  dynamic get number;
  @override
  @JsonKey(name: 'quantity')
  dynamic get quantity;
  @override
  @JsonKey(name: 'measurelineitemNo')
  dynamic get measurelineitemNo;
  @override
  @JsonKey(ignore: true)
  _$$_MeasureLineItemCopyWith<_$_MeasureLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return _Contract.fromJson(json);
}

/// @nodoc
mixin _$Contract {
  @JsonKey(name: 'contractNumber')
  String? get contractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'versionNumber')
  int? get versionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldUuid')
  String? get oldUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessService')
  String? get businessService => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'wfStatus')
  String? get wfStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'executingAuthority')
  String? get executingAuthority => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractType')
  String? get contractType => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalContractedAmount')
  double? get totalContractedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'securityDeposit')
  double? get securityDeposit => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreementDate')
  int? get agreementDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'issueDate')
  int? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'defectLiabilityPeriod')
  int? get defectLiabilityPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'orgId')
  String? get orgId => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  int? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  int? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completionPeriod')
  int? get completionPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineItems')
  List<LineItem>? get lineItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalDetails')
  ContractAdditionalDetails? get additionalDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractCopyWith<Contract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractCopyWith<$Res> {
  factory $ContractCopyWith(Contract value, $Res Function(Contract) then) =
      _$ContractCopyWithImpl<$Res, Contract>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber')
          String? contractNumber,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'versionNumber')
          int? versionNumber,
      @JsonKey(name: 'oldUuid')
          String? oldUuid,
      @JsonKey(name: 'businessService')
          String? businessService,
      @JsonKey(name: 'tenantId')
          String? tenantId,
      @JsonKey(name: 'wfStatus')
          String? wfStatus,
      @JsonKey(name: 'executingAuthority')
          String? executingAuthority,
      @JsonKey(name: 'contractType')
          String? contractType,
      @JsonKey(name: 'totalContractedAmount')
          double? totalContractedAmount,
      @JsonKey(name: 'securityDeposit')
          double? securityDeposit,
      @JsonKey(name: 'agreementDate')
          int? agreementDate,
      @JsonKey(name: 'issueDate')
          int? issueDate,
      @JsonKey(name: 'defectLiabilityPeriod')
          int? defectLiabilityPeriod,
      @JsonKey(name: 'orgId')
          String? orgId,
      @JsonKey(name: 'startDate')
          int? startDate,
      @JsonKey(name: 'endDate')
          int? endDate,
      @JsonKey(name: 'completionPeriod')
          int? completionPeriod,
      @JsonKey(name: 'status')
          String? status,
      @JsonKey(name: 'lineItems')
          List<LineItem>? lineItems,
      @JsonKey(name: 'additionalDetails')
          ContractAdditionalDetails? additionalDetails});

  $ContractAdditionalDetailsCopyWith<$Res>? get additionalDetails;
}

/// @nodoc
class _$ContractCopyWithImpl<$Res, $Val extends Contract>
    implements $ContractCopyWith<$Res> {
  _$ContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? id = freezed,
    Object? versionNumber = freezed,
    Object? oldUuid = freezed,
    Object? businessService = freezed,
    Object? tenantId = freezed,
    Object? wfStatus = freezed,
    Object? executingAuthority = freezed,
    Object? contractType = freezed,
    Object? totalContractedAmount = freezed,
    Object? securityDeposit = freezed,
    Object? agreementDate = freezed,
    Object? issueDate = freezed,
    Object? defectLiabilityPeriod = freezed,
    Object? orgId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? completionPeriod = freezed,
    Object? status = freezed,
    Object? lineItems = freezed,
    Object? additionalDetails = freezed,
  }) {
    return _then(_value.copyWith(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      versionNumber: freezed == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      oldUuid: freezed == oldUuid
          ? _value.oldUuid
          : oldUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      executingAuthority: freezed == executingAuthority
          ? _value.executingAuthority
          : executingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      totalContractedAmount: freezed == totalContractedAmount
          ? _value.totalContractedAmount
          : totalContractedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      securityDeposit: freezed == securityDeposit
          ? _value.securityDeposit
          : securityDeposit // ignore: cast_nullable_to_non_nullable
              as double?,
      agreementDate: freezed == agreementDate
          ? _value.agreementDate
          : agreementDate // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as int?,
      defectLiabilityPeriod: freezed == defectLiabilityPeriod
          ? _value.defectLiabilityPeriod
          : defectLiabilityPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      completionPeriod: freezed == completionPeriod
          ? _value.completionPeriod
          : completionPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lineItems: freezed == lineItems
          ? _value.lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItem>?,
      additionalDetails: freezed == additionalDetails
          ? _value.additionalDetails
          : additionalDetails // ignore: cast_nullable_to_non_nullable
              as ContractAdditionalDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContractAdditionalDetailsCopyWith<$Res>? get additionalDetails {
    if (_value.additionalDetails == null) {
      return null;
    }

    return $ContractAdditionalDetailsCopyWith<$Res>(_value.additionalDetails!,
        (value) {
      return _then(_value.copyWith(additionalDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContractCopyWith<$Res> implements $ContractCopyWith<$Res> {
  factory _$$_ContractCopyWith(
          _$_Contract value, $Res Function(_$_Contract) then) =
      __$$_ContractCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber')
          String? contractNumber,
      @JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'versionNumber')
          int? versionNumber,
      @JsonKey(name: 'oldUuid')
          String? oldUuid,
      @JsonKey(name: 'businessService')
          String? businessService,
      @JsonKey(name: 'tenantId')
          String? tenantId,
      @JsonKey(name: 'wfStatus')
          String? wfStatus,
      @JsonKey(name: 'executingAuthority')
          String? executingAuthority,
      @JsonKey(name: 'contractType')
          String? contractType,
      @JsonKey(name: 'totalContractedAmount')
          double? totalContractedAmount,
      @JsonKey(name: 'securityDeposit')
          double? securityDeposit,
      @JsonKey(name: 'agreementDate')
          int? agreementDate,
      @JsonKey(name: 'issueDate')
          int? issueDate,
      @JsonKey(name: 'defectLiabilityPeriod')
          int? defectLiabilityPeriod,
      @JsonKey(name: 'orgId')
          String? orgId,
      @JsonKey(name: 'startDate')
          int? startDate,
      @JsonKey(name: 'endDate')
          int? endDate,
      @JsonKey(name: 'completionPeriod')
          int? completionPeriod,
      @JsonKey(name: 'status')
          String? status,
      @JsonKey(name: 'lineItems')
          List<LineItem>? lineItems,
      @JsonKey(name: 'additionalDetails')
          ContractAdditionalDetails? additionalDetails});

  @override
  $ContractAdditionalDetailsCopyWith<$Res>? get additionalDetails;
}

/// @nodoc
class __$$_ContractCopyWithImpl<$Res>
    extends _$ContractCopyWithImpl<$Res, _$_Contract>
    implements _$$_ContractCopyWith<$Res> {
  __$$_ContractCopyWithImpl(
      _$_Contract _value, $Res Function(_$_Contract) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = freezed,
    Object? id = freezed,
    Object? versionNumber = freezed,
    Object? oldUuid = freezed,
    Object? businessService = freezed,
    Object? tenantId = freezed,
    Object? wfStatus = freezed,
    Object? executingAuthority = freezed,
    Object? contractType = freezed,
    Object? totalContractedAmount = freezed,
    Object? securityDeposit = freezed,
    Object? agreementDate = freezed,
    Object? issueDate = freezed,
    Object? defectLiabilityPeriod = freezed,
    Object? orgId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? completionPeriod = freezed,
    Object? status = freezed,
    Object? lineItems = freezed,
    Object? additionalDetails = freezed,
  }) {
    return _then(_$_Contract(
      contractNumber: freezed == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      versionNumber: freezed == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      oldUuid: freezed == oldUuid
          ? _value.oldUuid
          : oldUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      executingAuthority: freezed == executingAuthority
          ? _value.executingAuthority
          : executingAuthority // ignore: cast_nullable_to_non_nullable
              as String?,
      contractType: freezed == contractType
          ? _value.contractType
          : contractType // ignore: cast_nullable_to_non_nullable
              as String?,
      totalContractedAmount: freezed == totalContractedAmount
          ? _value.totalContractedAmount
          : totalContractedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      securityDeposit: freezed == securityDeposit
          ? _value.securityDeposit
          : securityDeposit // ignore: cast_nullable_to_non_nullable
              as double?,
      agreementDate: freezed == agreementDate
          ? _value.agreementDate
          : agreementDate // ignore: cast_nullable_to_non_nullable
              as int?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as int?,
      defectLiabilityPeriod: freezed == defectLiabilityPeriod
          ? _value.defectLiabilityPeriod
          : defectLiabilityPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      orgId: freezed == orgId
          ? _value.orgId
          : orgId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      completionPeriod: freezed == completionPeriod
          ? _value.completionPeriod
          : completionPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      lineItems: freezed == lineItems
          ? _value._lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<LineItem>?,
      additionalDetails: freezed == additionalDetails
          ? _value.additionalDetails
          : additionalDetails // ignore: cast_nullable_to_non_nullable
              as ContractAdditionalDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contract implements _Contract {
  const _$_Contract(
      {@JsonKey(name: 'contractNumber') this.contractNumber,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'versionNumber') this.versionNumber,
      @JsonKey(name: 'oldUuid') this.oldUuid,
      @JsonKey(name: 'businessService') this.businessService,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'wfStatus') this.wfStatus,
      @JsonKey(name: 'executingAuthority') this.executingAuthority,
      @JsonKey(name: 'contractType') this.contractType,
      @JsonKey(name: 'totalContractedAmount') this.totalContractedAmount,
      @JsonKey(name: 'securityDeposit') this.securityDeposit,
      @JsonKey(name: 'agreementDate') this.agreementDate,
      @JsonKey(name: 'issueDate') this.issueDate,
      @JsonKey(name: 'defectLiabilityPeriod') this.defectLiabilityPeriod,
      @JsonKey(name: 'orgId') this.orgId,
      @JsonKey(name: 'startDate') this.startDate,
      @JsonKey(name: 'endDate') this.endDate,
      @JsonKey(name: 'completionPeriod') this.completionPeriod,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'lineItems') final List<LineItem>? lineItems,
      @JsonKey(name: 'additionalDetails') this.additionalDetails})
      : _lineItems = lineItems;

  factory _$_Contract.fromJson(Map<String, dynamic> json) =>
      _$$_ContractFromJson(json);

  @override
  @JsonKey(name: 'contractNumber')
  final String? contractNumber;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'versionNumber')
  final int? versionNumber;
  @override
  @JsonKey(name: 'oldUuid')
  final String? oldUuid;
  @override
  @JsonKey(name: 'businessService')
  final String? businessService;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'wfStatus')
  final String? wfStatus;
  @override
  @JsonKey(name: 'executingAuthority')
  final String? executingAuthority;
  @override
  @JsonKey(name: 'contractType')
  final String? contractType;
  @override
  @JsonKey(name: 'totalContractedAmount')
  final double? totalContractedAmount;
  @override
  @JsonKey(name: 'securityDeposit')
  final double? securityDeposit;
  @override
  @JsonKey(name: 'agreementDate')
  final int? agreementDate;
  @override
  @JsonKey(name: 'issueDate')
  final int? issueDate;
  @override
  @JsonKey(name: 'defectLiabilityPeriod')
  final int? defectLiabilityPeriod;
  @override
  @JsonKey(name: 'orgId')
  final String? orgId;
  @override
  @JsonKey(name: 'startDate')
  final int? startDate;
  @override
  @JsonKey(name: 'endDate')
  final int? endDate;
  @override
  @JsonKey(name: 'completionPeriod')
  final int? completionPeriod;
  @override
  @JsonKey(name: 'status')
  final String? status;
  final List<LineItem>? _lineItems;
  @override
  @JsonKey(name: 'lineItems')
  List<LineItem>? get lineItems {
    final value = _lineItems;
    if (value == null) return null;
    if (_lineItems is EqualUnmodifiableListView) return _lineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'additionalDetails')
  final ContractAdditionalDetails? additionalDetails;

  @override
  String toString() {
    return 'Contract(contractNumber: $contractNumber, id: $id, versionNumber: $versionNumber, oldUuid: $oldUuid, businessService: $businessService, tenantId: $tenantId, wfStatus: $wfStatus, executingAuthority: $executingAuthority, contractType: $contractType, totalContractedAmount: $totalContractedAmount, securityDeposit: $securityDeposit, agreementDate: $agreementDate, issueDate: $issueDate, defectLiabilityPeriod: $defectLiabilityPeriod, orgId: $orgId, startDate: $startDate, endDate: $endDate, completionPeriod: $completionPeriod, status: $status, lineItems: $lineItems, additionalDetails: $additionalDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contract &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.oldUuid, oldUuid) || other.oldUuid == oldUuid) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.wfStatus, wfStatus) ||
                other.wfStatus == wfStatus) &&
            (identical(other.executingAuthority, executingAuthority) ||
                other.executingAuthority == executingAuthority) &&
            (identical(other.contractType, contractType) ||
                other.contractType == contractType) &&
            (identical(other.totalContractedAmount, totalContractedAmount) ||
                other.totalContractedAmount == totalContractedAmount) &&
            (identical(other.securityDeposit, securityDeposit) ||
                other.securityDeposit == securityDeposit) &&
            (identical(other.agreementDate, agreementDate) ||
                other.agreementDate == agreementDate) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.defectLiabilityPeriod, defectLiabilityPeriod) ||
                other.defectLiabilityPeriod == defectLiabilityPeriod) &&
            (identical(other.orgId, orgId) || other.orgId == orgId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.completionPeriod, completionPeriod) ||
                other.completionPeriod == completionPeriod) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._lineItems, _lineItems) &&
            (identical(other.additionalDetails, additionalDetails) ||
                other.additionalDetails == additionalDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        contractNumber,
        id,
        versionNumber,
        oldUuid,
        businessService,
        tenantId,
        wfStatus,
        executingAuthority,
        contractType,
        totalContractedAmount,
        securityDeposit,
        agreementDate,
        issueDate,
        defectLiabilityPeriod,
        orgId,
        startDate,
        endDate,
        completionPeriod,
        status,
        const DeepCollectionEquality().hash(_lineItems),
        additionalDetails
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractCopyWith<_$_Contract> get copyWith =>
      __$$_ContractCopyWithImpl<_$_Contract>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractToJson(
      this,
    );
  }
}

abstract class _Contract implements Contract {
  const factory _Contract(
      {@JsonKey(name: 'contractNumber')
          final String? contractNumber,
      @JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'versionNumber')
          final int? versionNumber,
      @JsonKey(name: 'oldUuid')
          final String? oldUuid,
      @JsonKey(name: 'businessService')
          final String? businessService,
      @JsonKey(name: 'tenantId')
          final String? tenantId,
      @JsonKey(name: 'wfStatus')
          final String? wfStatus,
      @JsonKey(name: 'executingAuthority')
          final String? executingAuthority,
      @JsonKey(name: 'contractType')
          final String? contractType,
      @JsonKey(name: 'totalContractedAmount')
          final double? totalContractedAmount,
      @JsonKey(name: 'securityDeposit')
          final double? securityDeposit,
      @JsonKey(name: 'agreementDate')
          final int? agreementDate,
      @JsonKey(name: 'issueDate')
          final int? issueDate,
      @JsonKey(name: 'defectLiabilityPeriod')
          final int? defectLiabilityPeriod,
      @JsonKey(name: 'orgId')
          final String? orgId,
      @JsonKey(name: 'startDate')
          final int? startDate,
      @JsonKey(name: 'endDate')
          final int? endDate,
      @JsonKey(name: 'completionPeriod')
          final int? completionPeriod,
      @JsonKey(name: 'status')
          final String? status,
      @JsonKey(name: 'lineItems')
          final List<LineItem>? lineItems,
      @JsonKey(name: 'additionalDetails')
          final ContractAdditionalDetails? additionalDetails}) = _$_Contract;

  factory _Contract.fromJson(Map<String, dynamic> json) = _$_Contract.fromJson;

  @override
  @JsonKey(name: 'contractNumber')
  String? get contractNumber;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'versionNumber')
  int? get versionNumber;
  @override
  @JsonKey(name: 'oldUuid')
  String? get oldUuid;
  @override
  @JsonKey(name: 'businessService')
  String? get businessService;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'wfStatus')
  String? get wfStatus;
  @override
  @JsonKey(name: 'executingAuthority')
  String? get executingAuthority;
  @override
  @JsonKey(name: 'contractType')
  String? get contractType;
  @override
  @JsonKey(name: 'totalContractedAmount')
  double? get totalContractedAmount;
  @override
  @JsonKey(name: 'securityDeposit')
  double? get securityDeposit;
  @override
  @JsonKey(name: 'agreementDate')
  int? get agreementDate;
  @override
  @JsonKey(name: 'issueDate')
  int? get issueDate;
  @override
  @JsonKey(name: 'defectLiabilityPeriod')
  int? get defectLiabilityPeriod;
  @override
  @JsonKey(name: 'orgId')
  String? get orgId;
  @override
  @JsonKey(name: 'startDate')
  int? get startDate;
  @override
  @JsonKey(name: 'endDate')
  int? get endDate;
  @override
  @JsonKey(name: 'completionPeriod')
  int? get completionPeriod;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'lineItems')
  List<LineItem>? get lineItems;
  @override
  @JsonKey(name: 'additionalDetails')
  ContractAdditionalDetails? get additionalDetails;
  @override
  @JsonKey(ignore: true)
  _$$_ContractCopyWith<_$_Contract> get copyWith =>
      throw _privateConstructorUsedError;
}

ContractAdditionalDetails _$ContractAdditionalDetailsFromJson(
    Map<String, dynamic> json) {
  return _ContractAdditionalDetails.fromJson(json);
}

/// @nodoc
mixin _$ContractAdditionalDetails {
  @JsonKey(name: 'orgName')
  String? get orgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalEstimatedAmount')
  double? get totalEstimatedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendanceRegisterNumber')
  String? get attendanceRegisterNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'officerInChargeId')
  String? get officerInChargeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cboOrgNumber')
  String? get cboOrgNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateNumber')
  String? get estimateNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'locality')
  String? get locality => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectType')
  String? get projectType => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeExtReason')
  String? get timeExtReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'ward')
  String? get ward => throw _privateConstructorUsedError;
  @JsonKey(name: 'officerInChargeDesgn')
  String? get officerInChargeDesgn => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectDesc')
  String? get projectDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectName')
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cboCode')
  String? get cboCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectId')
  String? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cboName')
  String? get cboName => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeExt')
  dynamic get timeExt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completionPeriod')
  int? get completionPeriod => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateDocs')
  List<EstmateDoc>? get estmateDocs => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAndConditions')
  List<TermsAndConditions>? get termsAndConditions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractAdditionalDetailsCopyWith<ContractAdditionalDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractAdditionalDetailsCopyWith<$Res> {
  factory $ContractAdditionalDetailsCopyWith(ContractAdditionalDetails value,
          $Res Function(ContractAdditionalDetails) then) =
      _$ContractAdditionalDetailsCopyWithImpl<$Res, ContractAdditionalDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orgName')
          String? orgName,
      @JsonKey(name: 'totalEstimatedAmount')
          double? totalEstimatedAmount,
      @JsonKey(name: 'attendanceRegisterNumber')
          String? attendanceRegisterNumber,
      @JsonKey(name: 'officerInChargeId')
          String? officerInChargeId,
      @JsonKey(name: 'cboOrgNumber')
          String? cboOrgNumber,
      @JsonKey(name: 'estimateNumber')
          String? estimateNumber,
      @JsonKey(name: 'locality')
          String? locality,
      @JsonKey(name: 'projectType')
          String? projectType,
      @JsonKey(name: 'timeExtReason')
          String? timeExtReason,
      @JsonKey(name: 'ward')
          String? ward,
      @JsonKey(name: 'officerInChargeDesgn')
          String? officerInChargeDesgn,
      @JsonKey(name: 'projectDesc')
          String? projectDesc,
      @JsonKey(name: 'projectName')
          String? projectName,
      @JsonKey(name: 'cboCode')
          String? cboCode,
      @JsonKey(name: 'projectId')
          String? projectId,
      @JsonKey(name: 'cboName')
          String? cboName,
      @JsonKey(name: 'timeExt')
          dynamic timeExt,
      @JsonKey(name: 'completionPeriod')
          int? completionPeriod,
      @JsonKey(name: 'estimateDocs')
          List<EstmateDoc>? estmateDocs,
      @JsonKey(name: 'termsAndConditions')
          List<TermsAndConditions>? termsAndConditions});
}

/// @nodoc
class _$ContractAdditionalDetailsCopyWithImpl<$Res,
        $Val extends ContractAdditionalDetails>
    implements $ContractAdditionalDetailsCopyWith<$Res> {
  _$ContractAdditionalDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgName = freezed,
    Object? totalEstimatedAmount = freezed,
    Object? attendanceRegisterNumber = freezed,
    Object? officerInChargeId = freezed,
    Object? cboOrgNumber = freezed,
    Object? estimateNumber = freezed,
    Object? locality = freezed,
    Object? projectType = freezed,
    Object? timeExtReason = freezed,
    Object? ward = freezed,
    Object? officerInChargeDesgn = freezed,
    Object? projectDesc = freezed,
    Object? projectName = freezed,
    Object? cboCode = freezed,
    Object? projectId = freezed,
    Object? cboName = freezed,
    Object? timeExt = freezed,
    Object? completionPeriod = freezed,
    Object? estmateDocs = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_value.copyWith(
      orgName: freezed == orgName
          ? _value.orgName
          : orgName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalEstimatedAmount: freezed == totalEstimatedAmount
          ? _value.totalEstimatedAmount
          : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceRegisterNumber: freezed == attendanceRegisterNumber
          ? _value.attendanceRegisterNumber
          : attendanceRegisterNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      officerInChargeId: freezed == officerInChargeId
          ? _value.officerInChargeId
          : officerInChargeId // ignore: cast_nullable_to_non_nullable
              as String?,
      cboOrgNumber: freezed == cboOrgNumber
          ? _value.cboOrgNumber
          : cboOrgNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateNumber: freezed == estimateNumber
          ? _value.estimateNumber
          : estimateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as String?,
      timeExtReason: freezed == timeExtReason
          ? _value.timeExtReason
          : timeExtReason // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String?,
      officerInChargeDesgn: freezed == officerInChargeDesgn
          ? _value.officerInChargeDesgn
          : officerInChargeDesgn // ignore: cast_nullable_to_non_nullable
              as String?,
      projectDesc: freezed == projectDesc
          ? _value.projectDesc
          : projectDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      cboCode: freezed == cboCode
          ? _value.cboCode
          : cboCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      cboName: freezed == cboName
          ? _value.cboName
          : cboName // ignore: cast_nullable_to_non_nullable
              as String?,
      timeExt: freezed == timeExt
          ? _value.timeExt
          : timeExt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      completionPeriod: freezed == completionPeriod
          ? _value.completionPeriod
          : completionPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      estmateDocs: freezed == estmateDocs
          ? _value.estmateDocs
          : estmateDocs // ignore: cast_nullable_to_non_nullable
              as List<EstmateDoc>?,
      termsAndConditions: freezed == termsAndConditions
          ? _value.termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as List<TermsAndConditions>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContractAdditionalDetailsCopyWith<$Res>
    implements $ContractAdditionalDetailsCopyWith<$Res> {
  factory _$$_ContractAdditionalDetailsCopyWith(
          _$_ContractAdditionalDetails value,
          $Res Function(_$_ContractAdditionalDetails) then) =
      __$$_ContractAdditionalDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orgName')
          String? orgName,
      @JsonKey(name: 'totalEstimatedAmount')
          double? totalEstimatedAmount,
      @JsonKey(name: 'attendanceRegisterNumber')
          String? attendanceRegisterNumber,
      @JsonKey(name: 'officerInChargeId')
          String? officerInChargeId,
      @JsonKey(name: 'cboOrgNumber')
          String? cboOrgNumber,
      @JsonKey(name: 'estimateNumber')
          String? estimateNumber,
      @JsonKey(name: 'locality')
          String? locality,
      @JsonKey(name: 'projectType')
          String? projectType,
      @JsonKey(name: 'timeExtReason')
          String? timeExtReason,
      @JsonKey(name: 'ward')
          String? ward,
      @JsonKey(name: 'officerInChargeDesgn')
          String? officerInChargeDesgn,
      @JsonKey(name: 'projectDesc')
          String? projectDesc,
      @JsonKey(name: 'projectName')
          String? projectName,
      @JsonKey(name: 'cboCode')
          String? cboCode,
      @JsonKey(name: 'projectId')
          String? projectId,
      @JsonKey(name: 'cboName')
          String? cboName,
      @JsonKey(name: 'timeExt')
          dynamic timeExt,
      @JsonKey(name: 'completionPeriod')
          int? completionPeriod,
      @JsonKey(name: 'estimateDocs')
          List<EstmateDoc>? estmateDocs,
      @JsonKey(name: 'termsAndConditions')
          List<TermsAndConditions>? termsAndConditions});
}

/// @nodoc
class __$$_ContractAdditionalDetailsCopyWithImpl<$Res>
    extends _$ContractAdditionalDetailsCopyWithImpl<$Res,
        _$_ContractAdditionalDetails>
    implements _$$_ContractAdditionalDetailsCopyWith<$Res> {
  __$$_ContractAdditionalDetailsCopyWithImpl(
      _$_ContractAdditionalDetails _value,
      $Res Function(_$_ContractAdditionalDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orgName = freezed,
    Object? totalEstimatedAmount = freezed,
    Object? attendanceRegisterNumber = freezed,
    Object? officerInChargeId = freezed,
    Object? cboOrgNumber = freezed,
    Object? estimateNumber = freezed,
    Object? locality = freezed,
    Object? projectType = freezed,
    Object? timeExtReason = freezed,
    Object? ward = freezed,
    Object? officerInChargeDesgn = freezed,
    Object? projectDesc = freezed,
    Object? projectName = freezed,
    Object? cboCode = freezed,
    Object? projectId = freezed,
    Object? cboName = freezed,
    Object? timeExt = freezed,
    Object? completionPeriod = freezed,
    Object? estmateDocs = freezed,
    Object? termsAndConditions = freezed,
  }) {
    return _then(_$_ContractAdditionalDetails(
      orgName: freezed == orgName
          ? _value.orgName
          : orgName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalEstimatedAmount: freezed == totalEstimatedAmount
          ? _value.totalEstimatedAmount
          : totalEstimatedAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      attendanceRegisterNumber: freezed == attendanceRegisterNumber
          ? _value.attendanceRegisterNumber
          : attendanceRegisterNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      officerInChargeId: freezed == officerInChargeId
          ? _value.officerInChargeId
          : officerInChargeId // ignore: cast_nullable_to_non_nullable
              as String?,
      cboOrgNumber: freezed == cboOrgNumber
          ? _value.cboOrgNumber
          : cboOrgNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateNumber: freezed == estimateNumber
          ? _value.estimateNumber
          : estimateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      locality: freezed == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String?,
      projectType: freezed == projectType
          ? _value.projectType
          : projectType // ignore: cast_nullable_to_non_nullable
              as String?,
      timeExtReason: freezed == timeExtReason
          ? _value.timeExtReason
          : timeExtReason // ignore: cast_nullable_to_non_nullable
              as String?,
      ward: freezed == ward
          ? _value.ward
          : ward // ignore: cast_nullable_to_non_nullable
              as String?,
      officerInChargeDesgn: freezed == officerInChargeDesgn
          ? _value.officerInChargeDesgn
          : officerInChargeDesgn // ignore: cast_nullable_to_non_nullable
              as String?,
      projectDesc: freezed == projectDesc
          ? _value.projectDesc
          : projectDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      cboCode: freezed == cboCode
          ? _value.cboCode
          : cboCode // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      cboName: freezed == cboName
          ? _value.cboName
          : cboName // ignore: cast_nullable_to_non_nullable
              as String?,
      timeExt: freezed == timeExt
          ? _value.timeExt
          : timeExt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      completionPeriod: freezed == completionPeriod
          ? _value.completionPeriod
          : completionPeriod // ignore: cast_nullable_to_non_nullable
              as int?,
      estmateDocs: freezed == estmateDocs
          ? _value._estmateDocs
          : estmateDocs // ignore: cast_nullable_to_non_nullable
              as List<EstmateDoc>?,
      termsAndConditions: freezed == termsAndConditions
          ? _value._termsAndConditions
          : termsAndConditions // ignore: cast_nullable_to_non_nullable
              as List<TermsAndConditions>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContractAdditionalDetails implements _ContractAdditionalDetails {
  const _$_ContractAdditionalDetails(
      {@JsonKey(name: 'orgName')
          this.orgName,
      @JsonKey(name: 'totalEstimatedAmount')
          this.totalEstimatedAmount,
      @JsonKey(name: 'attendanceRegisterNumber')
          this.attendanceRegisterNumber,
      @JsonKey(name: 'officerInChargeId')
          this.officerInChargeId,
      @JsonKey(name: 'cboOrgNumber')
          this.cboOrgNumber,
      @JsonKey(name: 'estimateNumber')
          this.estimateNumber,
      @JsonKey(name: 'locality')
          this.locality,
      @JsonKey(name: 'projectType')
          this.projectType,
      @JsonKey(name: 'timeExtReason')
          this.timeExtReason,
      @JsonKey(name: 'ward')
          this.ward,
      @JsonKey(name: 'officerInChargeDesgn')
          this.officerInChargeDesgn,
      @JsonKey(name: 'projectDesc')
          this.projectDesc,
      @JsonKey(name: 'projectName')
          this.projectName,
      @JsonKey(name: 'cboCode')
          this.cboCode,
      @JsonKey(name: 'projectId')
          this.projectId,
      @JsonKey(name: 'cboName')
          this.cboName,
      @JsonKey(name: 'timeExt')
          this.timeExt,
      @JsonKey(name: 'completionPeriod')
          this.completionPeriod,
      @JsonKey(name: 'estimateDocs')
          final List<EstmateDoc>? estmateDocs,
      @JsonKey(name: 'termsAndConditions')
          final List<TermsAndConditions>? termsAndConditions})
      : _estmateDocs = estmateDocs,
        _termsAndConditions = termsAndConditions;

  factory _$_ContractAdditionalDetails.fromJson(Map<String, dynamic> json) =>
      _$$_ContractAdditionalDetailsFromJson(json);

  @override
  @JsonKey(name: 'orgName')
  final String? orgName;
  @override
  @JsonKey(name: 'totalEstimatedAmount')
  final double? totalEstimatedAmount;
  @override
  @JsonKey(name: 'attendanceRegisterNumber')
  final String? attendanceRegisterNumber;
  @override
  @JsonKey(name: 'officerInChargeId')
  final String? officerInChargeId;
  @override
  @JsonKey(name: 'cboOrgNumber')
  final String? cboOrgNumber;
  @override
  @JsonKey(name: 'estimateNumber')
  final String? estimateNumber;
  @override
  @JsonKey(name: 'locality')
  final String? locality;
  @override
  @JsonKey(name: 'projectType')
  final String? projectType;
  @override
  @JsonKey(name: 'timeExtReason')
  final String? timeExtReason;
  @override
  @JsonKey(name: 'ward')
  final String? ward;
  @override
  @JsonKey(name: 'officerInChargeDesgn')
  final String? officerInChargeDesgn;
  @override
  @JsonKey(name: 'projectDesc')
  final String? projectDesc;
  @override
  @JsonKey(name: 'projectName')
  final String? projectName;
  @override
  @JsonKey(name: 'cboCode')
  final String? cboCode;
  @override
  @JsonKey(name: 'projectId')
  final String? projectId;
  @override
  @JsonKey(name: 'cboName')
  final String? cboName;
  @override
  @JsonKey(name: 'timeExt')
  final dynamic timeExt;
  @override
  @JsonKey(name: 'completionPeriod')
  final int? completionPeriod;
  final List<EstmateDoc>? _estmateDocs;
  @override
  @JsonKey(name: 'estimateDocs')
  List<EstmateDoc>? get estmateDocs {
    final value = _estmateDocs;
    if (value == null) return null;
    if (_estmateDocs is EqualUnmodifiableListView) return _estmateDocs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TermsAndConditions>? _termsAndConditions;
  @override
  @JsonKey(name: 'termsAndConditions')
  List<TermsAndConditions>? get termsAndConditions {
    final value = _termsAndConditions;
    if (value == null) return null;
    if (_termsAndConditions is EqualUnmodifiableListView)
      return _termsAndConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContractAdditionalDetails(orgName: $orgName, totalEstimatedAmount: $totalEstimatedAmount, attendanceRegisterNumber: $attendanceRegisterNumber, officerInChargeId: $officerInChargeId, cboOrgNumber: $cboOrgNumber, estimateNumber: $estimateNumber, locality: $locality, projectType: $projectType, timeExtReason: $timeExtReason, ward: $ward, officerInChargeDesgn: $officerInChargeDesgn, projectDesc: $projectDesc, projectName: $projectName, cboCode: $cboCode, projectId: $projectId, cboName: $cboName, timeExt: $timeExt, completionPeriod: $completionPeriod, estmateDocs: $estmateDocs, termsAndConditions: $termsAndConditions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContractAdditionalDetails &&
            (identical(other.orgName, orgName) || other.orgName == orgName) &&
            (identical(other.totalEstimatedAmount, totalEstimatedAmount) ||
                other.totalEstimatedAmount == totalEstimatedAmount) &&
            (identical(
                    other.attendanceRegisterNumber, attendanceRegisterNumber) ||
                other.attendanceRegisterNumber == attendanceRegisterNumber) &&
            (identical(other.officerInChargeId, officerInChargeId) ||
                other.officerInChargeId == officerInChargeId) &&
            (identical(other.cboOrgNumber, cboOrgNumber) ||
                other.cboOrgNumber == cboOrgNumber) &&
            (identical(other.estimateNumber, estimateNumber) ||
                other.estimateNumber == estimateNumber) &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.projectType, projectType) ||
                other.projectType == projectType) &&
            (identical(other.timeExtReason, timeExtReason) ||
                other.timeExtReason == timeExtReason) &&
            (identical(other.ward, ward) || other.ward == ward) &&
            (identical(other.officerInChargeDesgn, officerInChargeDesgn) ||
                other.officerInChargeDesgn == officerInChargeDesgn) &&
            (identical(other.projectDesc, projectDesc) ||
                other.projectDesc == projectDesc) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.cboCode, cboCode) || other.cboCode == cboCode) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.cboName, cboName) || other.cboName == cboName) &&
            const DeepCollectionEquality().equals(other.timeExt, timeExt) &&
            (identical(other.completionPeriod, completionPeriod) ||
                other.completionPeriod == completionPeriod) &&
            const DeepCollectionEquality()
                .equals(other._estmateDocs, _estmateDocs) &&
            const DeepCollectionEquality()
                .equals(other._termsAndConditions, _termsAndConditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        orgName,
        totalEstimatedAmount,
        attendanceRegisterNumber,
        officerInChargeId,
        cboOrgNumber,
        estimateNumber,
        locality,
        projectType,
        timeExtReason,
        ward,
        officerInChargeDesgn,
        projectDesc,
        projectName,
        cboCode,
        projectId,
        cboName,
        const DeepCollectionEquality().hash(timeExt),
        completionPeriod,
        const DeepCollectionEquality().hash(_estmateDocs),
        const DeepCollectionEquality().hash(_termsAndConditions)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContractAdditionalDetailsCopyWith<_$_ContractAdditionalDetails>
      get copyWith => __$$_ContractAdditionalDetailsCopyWithImpl<
          _$_ContractAdditionalDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContractAdditionalDetailsToJson(
      this,
    );
  }
}

abstract class _ContractAdditionalDetails implements ContractAdditionalDetails {
  const factory _ContractAdditionalDetails(
          {@JsonKey(name: 'orgName')
              final String? orgName,
          @JsonKey(name: 'totalEstimatedAmount')
              final double? totalEstimatedAmount,
          @JsonKey(name: 'attendanceRegisterNumber')
              final String? attendanceRegisterNumber,
          @JsonKey(name: 'officerInChargeId')
              final String? officerInChargeId,
          @JsonKey(name: 'cboOrgNumber')
              final String? cboOrgNumber,
          @JsonKey(name: 'estimateNumber')
              final String? estimateNumber,
          @JsonKey(name: 'locality')
              final String? locality,
          @JsonKey(name: 'projectType')
              final String? projectType,
          @JsonKey(name: 'timeExtReason')
              final String? timeExtReason,
          @JsonKey(name: 'ward')
              final String? ward,
          @JsonKey(name: 'officerInChargeDesgn')
              final String? officerInChargeDesgn,
          @JsonKey(name: 'projectDesc')
              final String? projectDesc,
          @JsonKey(name: 'projectName')
              final String? projectName,
          @JsonKey(name: 'cboCode')
              final String? cboCode,
          @JsonKey(name: 'projectId')
              final String? projectId,
          @JsonKey(name: 'cboName')
              final String? cboName,
          @JsonKey(name: 'timeExt')
              final dynamic timeExt,
          @JsonKey(name: 'completionPeriod')
              final int? completionPeriod,
          @JsonKey(name: 'estimateDocs')
              final List<EstmateDoc>? estmateDocs,
          @JsonKey(name: 'termsAndConditions')
              final List<TermsAndConditions>? termsAndConditions}) =
      _$_ContractAdditionalDetails;

  factory _ContractAdditionalDetails.fromJson(Map<String, dynamic> json) =
      _$_ContractAdditionalDetails.fromJson;

  @override
  @JsonKey(name: 'orgName')
  String? get orgName;
  @override
  @JsonKey(name: 'totalEstimatedAmount')
  double? get totalEstimatedAmount;
  @override
  @JsonKey(name: 'attendanceRegisterNumber')
  String? get attendanceRegisterNumber;
  @override
  @JsonKey(name: 'officerInChargeId')
  String? get officerInChargeId;
  @override
  @JsonKey(name: 'cboOrgNumber')
  String? get cboOrgNumber;
  @override
  @JsonKey(name: 'estimateNumber')
  String? get estimateNumber;
  @override
  @JsonKey(name: 'locality')
  String? get locality;
  @override
  @JsonKey(name: 'projectType')
  String? get projectType;
  @override
  @JsonKey(name: 'timeExtReason')
  String? get timeExtReason;
  @override
  @JsonKey(name: 'ward')
  String? get ward;
  @override
  @JsonKey(name: 'officerInChargeDesgn')
  String? get officerInChargeDesgn;
  @override
  @JsonKey(name: 'projectDesc')
  String? get projectDesc;
  @override
  @JsonKey(name: 'projectName')
  String? get projectName;
  @override
  @JsonKey(name: 'cboCode')
  String? get cboCode;
  @override
  @JsonKey(name: 'projectId')
  String? get projectId;
  @override
  @JsonKey(name: 'cboName')
  String? get cboName;
  @override
  @JsonKey(name: 'timeExt')
  dynamic get timeExt;
  @override
  @JsonKey(name: 'completionPeriod')
  int? get completionPeriod;
  @override
  @JsonKey(name: 'estimateDocs')
  List<EstmateDoc>? get estmateDocs;
  @override
  @JsonKey(name: 'termsAndConditions')
  List<TermsAndConditions>? get termsAndConditions;
  @override
  @JsonKey(ignore: true)
  _$$_ContractAdditionalDetailsCopyWith<_$_ContractAdditionalDetails>
      get copyWith => throw _privateConstructorUsedError;
}

EstmateDoc _$EstmateDocFromJson(Map<String, dynamic> json) {
  return _EstmateDoc.fromJson(json);
}

/// @nodoc
mixin _$EstmateDoc {
  @JsonKey(name: 'fileName')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileType')
  String? get fileType => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'documentUid')
  String? get documentUid => throw _privateConstructorUsedError;
  @JsonKey(name: 'fileStoreId')
  String? get fileStoreId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstmateDocCopyWith<EstmateDoc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstmateDocCopyWith<$Res> {
  factory $EstmateDocCopyWith(
          EstmateDoc value, $Res Function(EstmateDoc) then) =
      _$EstmateDocCopyWithImpl<$Res, EstmateDoc>;
  @useResult
  $Res call(
      {@JsonKey(name: 'fileName') String? fileName,
      @JsonKey(name: 'fileType') String? fileType,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'documentUid') String? documentUid,
      @JsonKey(name: 'fileStoreId') String? fileStoreId});
}

/// @nodoc
class _$EstmateDocCopyWithImpl<$Res, $Val extends EstmateDoc>
    implements $EstmateDocCopyWith<$Res> {
  _$EstmateDocCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? tenantId = freezed,
    Object? documentUid = freezed,
    Object? fileStoreId = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      documentUid: freezed == documentUid
          ? _value.documentUid
          : documentUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fileStoreId: freezed == fileStoreId
          ? _value.fileStoreId
          : fileStoreId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EstmateDocCopyWith<$Res>
    implements $EstmateDocCopyWith<$Res> {
  factory _$$_EstmateDocCopyWith(
          _$_EstmateDoc value, $Res Function(_$_EstmateDoc) then) =
      __$$_EstmateDocCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'fileName') String? fileName,
      @JsonKey(name: 'fileType') String? fileType,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'documentUid') String? documentUid,
      @JsonKey(name: 'fileStoreId') String? fileStoreId});
}

/// @nodoc
class __$$_EstmateDocCopyWithImpl<$Res>
    extends _$EstmateDocCopyWithImpl<$Res, _$_EstmateDoc>
    implements _$$_EstmateDocCopyWith<$Res> {
  __$$_EstmateDocCopyWithImpl(
      _$_EstmateDoc _value, $Res Function(_$_EstmateDoc) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileType = freezed,
    Object? tenantId = freezed,
    Object? documentUid = freezed,
    Object? fileStoreId = freezed,
  }) {
    return _then(_$_EstmateDoc(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      documentUid: freezed == documentUid
          ? _value.documentUid
          : documentUid // ignore: cast_nullable_to_non_nullable
              as String?,
      fileStoreId: freezed == fileStoreId
          ? _value.fileStoreId
          : fileStoreId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EstmateDoc implements _EstmateDoc {
  const _$_EstmateDoc(
      {@JsonKey(name: 'fileName') this.fileName,
      @JsonKey(name: 'fileType') this.fileType,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'documentUid') this.documentUid,
      @JsonKey(name: 'fileStoreId') this.fileStoreId});

  factory _$_EstmateDoc.fromJson(Map<String, dynamic> json) =>
      _$$_EstmateDocFromJson(json);

  @override
  @JsonKey(name: 'fileName')
  final String? fileName;
  @override
  @JsonKey(name: 'fileType')
  final String? fileType;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'documentUid')
  final String? documentUid;
  @override
  @JsonKey(name: 'fileStoreId')
  final String? fileStoreId;

  @override
  String toString() {
    return 'EstmateDoc(fileName: $fileName, fileType: $fileType, tenantId: $tenantId, documentUid: $documentUid, fileStoreId: $fileStoreId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EstmateDoc &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.documentUid, documentUid) ||
                other.documentUid == documentUid) &&
            (identical(other.fileStoreId, fileStoreId) ||
                other.fileStoreId == fileStoreId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fileName, fileType, tenantId, documentUid, fileStoreId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EstmateDocCopyWith<_$_EstmateDoc> get copyWith =>
      __$$_EstmateDocCopyWithImpl<_$_EstmateDoc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EstmateDocToJson(
      this,
    );
  }
}

abstract class _EstmateDoc implements EstmateDoc {
  const factory _EstmateDoc(
      {@JsonKey(name: 'fileName') final String? fileName,
      @JsonKey(name: 'fileType') final String? fileType,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'documentUid') final String? documentUid,
      @JsonKey(name: 'fileStoreId') final String? fileStoreId}) = _$_EstmateDoc;

  factory _EstmateDoc.fromJson(Map<String, dynamic> json) =
      _$_EstmateDoc.fromJson;

  @override
  @JsonKey(name: 'fileName')
  String? get fileName;
  @override
  @JsonKey(name: 'fileType')
  String? get fileType;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'documentUid')
  String? get documentUid;
  @override
  @JsonKey(name: 'fileStoreId')
  String? get fileStoreId;
  @override
  @JsonKey(ignore: true)
  _$$_EstmateDocCopyWith<_$_EstmateDoc> get copyWith =>
      throw _privateConstructorUsedError;
}

TermsAndConditions _$TermsAndConditionsFromJson(Map<String, dynamic> json) {
  return _TermsAndConditions.fromJson(json);
}

/// @nodoc
mixin _$TermsAndConditions {
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermsAndConditionsCopyWith<TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAndConditionsCopyWith<$Res> {
  factory $TermsAndConditionsCopyWith(
          TermsAndConditions value, $Res Function(TermsAndConditions) then) =
      _$TermsAndConditionsCopyWithImpl<$Res, TermsAndConditions>;
  @useResult
  $Res call({@JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$TermsAndConditionsCopyWithImpl<$Res, $Val extends TermsAndConditions>
    implements $TermsAndConditionsCopyWith<$Res> {
  _$TermsAndConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TermsAndConditionsCopyWith<$Res>
    implements $TermsAndConditionsCopyWith<$Res> {
  factory _$$_TermsAndConditionsCopyWith(_$_TermsAndConditions value,
          $Res Function(_$_TermsAndConditions) then) =
      __$$_TermsAndConditionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$_TermsAndConditionsCopyWithImpl<$Res>
    extends _$TermsAndConditionsCopyWithImpl<$Res, _$_TermsAndConditions>
    implements _$$_TermsAndConditionsCopyWith<$Res> {
  __$$_TermsAndConditionsCopyWithImpl(
      _$_TermsAndConditions _value, $Res Function(_$_TermsAndConditions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_$_TermsAndConditions(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TermsAndConditions implements _TermsAndConditions {
  const _$_TermsAndConditions({@JsonKey(name: 'description') this.description});

  factory _$_TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$$_TermsAndConditionsFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'TermsAndConditions(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TermsAndConditions &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TermsAndConditionsCopyWith<_$_TermsAndConditions> get copyWith =>
      __$$_TermsAndConditionsCopyWithImpl<_$_TermsAndConditions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TermsAndConditionsToJson(
      this,
    );
  }
}

abstract class _TermsAndConditions implements TermsAndConditions {
  const factory _TermsAndConditions(
          {@JsonKey(name: 'description') final String? description}) =
      _$_TermsAndConditions;

  factory _TermsAndConditions.fromJson(Map<String, dynamic> json) =
      _$_TermsAndConditions.fromJson;

  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_TermsAndConditionsCopyWith<_$_TermsAndConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

LineItem _$LineItemFromJson(Map<String, dynamic> json) {
  return _LineItem.fromJson(json);
}

/// @nodoc
mixin _$LineItem {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateId')
  String? get estimateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateLineItemId')
  String? get estimateLineItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractLineItemRef')
  String? get contractLineItemRef => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitRate')
  double? get unitRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'noOfunit')
  num? get noOfunit => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountBreakups')
  List<AmountBreakup>? get amountBreakups => throw _privateConstructorUsedError;
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineItemCopyWith<LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineItemCopyWith<$Res> {
  factory $LineItemCopyWith(LineItem value, $Res Function(LineItem) then) =
      _$LineItemCopyWithImpl<$Res, LineItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'estimateId') String? estimateId,
      @JsonKey(name: 'estimateLineItemId') String? estimateLineItemId,
      @JsonKey(name: 'contractLineItemRef') String? contractLineItemRef,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'unitRate') double? unitRate,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'noOfunit') num? noOfunit,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'amountBreakups') List<AmountBreakup>? amountBreakups,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails});

  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class _$LineItemCopyWithImpl<$Res, $Val extends LineItem>
    implements $LineItemCopyWith<$Res> {
  _$LineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimateId = freezed,
    Object? estimateLineItemId = freezed,
    Object? contractLineItemRef = freezed,
    Object? tenantId = freezed,
    Object? unitRate = freezed,
    Object? category = freezed,
    Object? noOfunit = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? amountBreakups = freezed,
    Object? auditDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateId: freezed == estimateId
          ? _value.estimateId
          : estimateId // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateLineItemId: freezed == estimateLineItemId
          ? _value.estimateLineItemId
          : estimateLineItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      contractLineItemRef: freezed == contractLineItemRef
          ? _value.contractLineItemRef
          : contractLineItemRef // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      unitRate: freezed == unitRate
          ? _value.unitRate
          : unitRate // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfunit: freezed == noOfunit
          ? _value.noOfunit
          : noOfunit // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amountBreakups: freezed == amountBreakups
          ? _value.amountBreakups
          : amountBreakups // ignore: cast_nullable_to_non_nullable
              as List<AmountBreakup>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuditDetailsCopyWith<$Res>? get auditDetails {
    if (_value.auditDetails == null) {
      return null;
    }

    return $AuditDetailsCopyWith<$Res>(_value.auditDetails!, (value) {
      return _then(_value.copyWith(auditDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LineItemCopyWith<$Res> implements $LineItemCopyWith<$Res> {
  factory _$$_LineItemCopyWith(
          _$_LineItem value, $Res Function(_$_LineItem) then) =
      __$$_LineItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'estimateId') String? estimateId,
      @JsonKey(name: 'estimateLineItemId') String? estimateLineItemId,
      @JsonKey(name: 'contractLineItemRef') String? contractLineItemRef,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'unitRate') double? unitRate,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'noOfunit') num? noOfunit,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'amountBreakups') List<AmountBreakup>? amountBreakups,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails});

  @override
  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class __$$_LineItemCopyWithImpl<$Res>
    extends _$LineItemCopyWithImpl<$Res, _$_LineItem>
    implements _$$_LineItemCopyWith<$Res> {
  __$$_LineItemCopyWithImpl(
      _$_LineItem _value, $Res Function(_$_LineItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimateId = freezed,
    Object? estimateLineItemId = freezed,
    Object? contractLineItemRef = freezed,
    Object? tenantId = freezed,
    Object? unitRate = freezed,
    Object? category = freezed,
    Object? noOfunit = freezed,
    Object? name = freezed,
    Object? status = freezed,
    Object? amountBreakups = freezed,
    Object? auditDetails = freezed,
  }) {
    return _then(_$_LineItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateId: freezed == estimateId
          ? _value.estimateId
          : estimateId // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateLineItemId: freezed == estimateLineItemId
          ? _value.estimateLineItemId
          : estimateLineItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      contractLineItemRef: freezed == contractLineItemRef
          ? _value.contractLineItemRef
          : contractLineItemRef // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      unitRate: freezed == unitRate
          ? _value.unitRate
          : unitRate // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfunit: freezed == noOfunit
          ? _value.noOfunit
          : noOfunit // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amountBreakups: freezed == amountBreakups
          ? _value._amountBreakups
          : amountBreakups // ignore: cast_nullable_to_non_nullable
              as List<AmountBreakup>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineItem implements _LineItem {
  const _$_LineItem(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'estimateId')
          this.estimateId,
      @JsonKey(name: 'estimateLineItemId')
          this.estimateLineItemId,
      @JsonKey(name: 'contractLineItemRef')
          this.contractLineItemRef,
      @JsonKey(name: 'tenantId')
          this.tenantId,
      @JsonKey(name: 'unitRate')
          this.unitRate,
      @JsonKey(name: 'category')
          this.category,
      @JsonKey(name: 'noOfunit')
          this.noOfunit,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'status')
          this.status,
      @JsonKey(name: 'amountBreakups')
          final List<AmountBreakup>? amountBreakups,
      @JsonKey(name: 'auditDetails')
          this.auditDetails})
      : _amountBreakups = amountBreakups;

  factory _$_LineItem.fromJson(Map<String, dynamic> json) =>
      _$$_LineItemFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'estimateId')
  final String? estimateId;
  @override
  @JsonKey(name: 'estimateLineItemId')
  final String? estimateLineItemId;
  @override
  @JsonKey(name: 'contractLineItemRef')
  final String? contractLineItemRef;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'unitRate')
  final double? unitRate;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'noOfunit')
  final num? noOfunit;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'status')
  final String? status;
  final List<AmountBreakup>? _amountBreakups;
  @override
  @JsonKey(name: 'amountBreakups')
  List<AmountBreakup>? get amountBreakups {
    final value = _amountBreakups;
    if (value == null) return null;
    if (_amountBreakups is EqualUnmodifiableListView) return _amountBreakups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'auditDetails')
  final AuditDetails? auditDetails;

  @override
  String toString() {
    return 'LineItem(id: $id, estimateId: $estimateId, estimateLineItemId: $estimateLineItemId, contractLineItemRef: $contractLineItemRef, tenantId: $tenantId, unitRate: $unitRate, category: $category, noOfunit: $noOfunit, name: $name, status: $status, amountBreakups: $amountBreakups, auditDetails: $auditDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LineItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estimateId, estimateId) ||
                other.estimateId == estimateId) &&
            (identical(other.estimateLineItemId, estimateLineItemId) ||
                other.estimateLineItemId == estimateLineItemId) &&
            (identical(other.contractLineItemRef, contractLineItemRef) ||
                other.contractLineItemRef == contractLineItemRef) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.unitRate, unitRate) ||
                other.unitRate == unitRate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.noOfunit, noOfunit) ||
                other.noOfunit == noOfunit) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._amountBreakups, _amountBreakups) &&
            (identical(other.auditDetails, auditDetails) ||
                other.auditDetails == auditDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estimateId,
      estimateLineItemId,
      contractLineItemRef,
      tenantId,
      unitRate,
      category,
      noOfunit,
      name,
      status,
      const DeepCollectionEquality().hash(_amountBreakups),
      auditDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineItemCopyWith<_$_LineItem> get copyWith =>
      __$$_LineItemCopyWithImpl<_$_LineItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineItemToJson(
      this,
    );
  }
}

abstract class _LineItem implements LineItem {
  const factory _LineItem(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'estimateId')
          final String? estimateId,
      @JsonKey(name: 'estimateLineItemId')
          final String? estimateLineItemId,
      @JsonKey(name: 'contractLineItemRef')
          final String? contractLineItemRef,
      @JsonKey(name: 'tenantId')
          final String? tenantId,
      @JsonKey(name: 'unitRate')
          final double? unitRate,
      @JsonKey(name: 'category')
          final String? category,
      @JsonKey(name: 'noOfunit')
          final num? noOfunit,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'status')
          final String? status,
      @JsonKey(name: 'amountBreakups')
          final List<AmountBreakup>? amountBreakups,
      @JsonKey(name: 'auditDetails')
          final AuditDetails? auditDetails}) = _$_LineItem;

  factory _LineItem.fromJson(Map<String, dynamic> json) = _$_LineItem.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'estimateId')
  String? get estimateId;
  @override
  @JsonKey(name: 'estimateLineItemId')
  String? get estimateLineItemId;
  @override
  @JsonKey(name: 'contractLineItemRef')
  String? get contractLineItemRef;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'unitRate')
  double? get unitRate;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'noOfunit')
  num? get noOfunit;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'amountBreakups')
  List<AmountBreakup>? get amountBreakups;
  @override
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails;
  @override
  @JsonKey(ignore: true)
  _$$_LineItemCopyWith<_$_LineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

AmountBreakup _$AmountBreakupFromJson(Map<String, dynamic> json) {
  return _AmountBreakup.fromJson(json);
}

/// @nodoc
mixin _$AmountBreakup {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateAmountBreakupId')
  String? get estimateAmountBreakupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmountBreakupCopyWith<AmountBreakup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountBreakupCopyWith<$Res> {
  factory $AmountBreakupCopyWith(
          AmountBreakup value, $Res Function(AmountBreakup) then) =
      _$AmountBreakupCopyWithImpl<$Res, AmountBreakup>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'estimateAmountBreakupId') String? estimateAmountBreakupId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class _$AmountBreakupCopyWithImpl<$Res, $Val extends AmountBreakup>
    implements $AmountBreakupCopyWith<$Res> {
  _$AmountBreakupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimateAmountBreakupId = freezed,
    Object? amount = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateAmountBreakupId: freezed == estimateAmountBreakupId
          ? _value.estimateAmountBreakupId
          : estimateAmountBreakupId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AmountBreakupCopyWith<$Res>
    implements $AmountBreakupCopyWith<$Res> {
  factory _$$_AmountBreakupCopyWith(
          _$_AmountBreakup value, $Res Function(_$_AmountBreakup) then) =
      __$$_AmountBreakupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'estimateAmountBreakupId') String? estimateAmountBreakupId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'status') String? status});
}

/// @nodoc
class __$$_AmountBreakupCopyWithImpl<$Res>
    extends _$AmountBreakupCopyWithImpl<$Res, _$_AmountBreakup>
    implements _$$_AmountBreakupCopyWith<$Res> {
  __$$_AmountBreakupCopyWithImpl(
      _$_AmountBreakup _value, $Res Function(_$_AmountBreakup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estimateAmountBreakupId = freezed,
    Object? amount = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_AmountBreakup(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateAmountBreakupId: freezed == estimateAmountBreakupId
          ? _value.estimateAmountBreakupId
          : estimateAmountBreakupId // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AmountBreakup implements _AmountBreakup {
  const _$_AmountBreakup(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'estimateAmountBreakupId') this.estimateAmountBreakupId,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'status') this.status});

  factory _$_AmountBreakup.fromJson(Map<String, dynamic> json) =>
      _$$_AmountBreakupFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'estimateAmountBreakupId')
  final String? estimateAmountBreakupId;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'status')
  final String? status;

  @override
  String toString() {
    return 'AmountBreakup(id: $id, estimateAmountBreakupId: $estimateAmountBreakupId, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AmountBreakup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.estimateAmountBreakupId, estimateAmountBreakupId) ||
                other.estimateAmountBreakupId == estimateAmountBreakupId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, estimateAmountBreakupId, amount, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AmountBreakupCopyWith<_$_AmountBreakup> get copyWith =>
      __$$_AmountBreakupCopyWithImpl<_$_AmountBreakup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AmountBreakupToJson(
      this,
    );
  }
}

abstract class _AmountBreakup implements AmountBreakup {
  const factory _AmountBreakup(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'estimateAmountBreakupId')
          final String? estimateAmountBreakupId,
      @JsonKey(name: 'amount')
          final double? amount,
      @JsonKey(name: 'status')
          final String? status}) = _$_AmountBreakup;

  factory _AmountBreakup.fromJson(Map<String, dynamic> json) =
      _$_AmountBreakup.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'estimateAmountBreakupId')
  String? get estimateAmountBreakupId;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_AmountBreakupCopyWith<_$_AmountBreakup> get copyWith =>
      throw _privateConstructorUsedError;
}

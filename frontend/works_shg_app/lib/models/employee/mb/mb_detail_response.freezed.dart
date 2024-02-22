// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mb_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MBDetailResponse _$MBDetailResponseFromJson(Map<String, dynamic> json) {
  return _MBDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$MBDetailResponse {
  @JsonKey(name: 'contract')
  Contract? get contract => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimate')
  Estimate? get estimate => throw _privateConstructorUsedError;
  @JsonKey(name: 'period')
  Period? get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'allMeasurements')
  List<Measurement>? get allMeasurements => throw _privateConstructorUsedError;
  @JsonKey(name: 'measurement')
  Measurement? get measurement => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MBDetailResponseCopyWith<MBDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MBDetailResponseCopyWith<$Res> {
  factory $MBDetailResponseCopyWith(
          MBDetailResponse value, $Res Function(MBDetailResponse) then) =
      _$MBDetailResponseCopyWithImpl<$Res, MBDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contract') Contract? contract,
      @JsonKey(name: 'estimate') Estimate? estimate,
      @JsonKey(name: 'period') Period? period,
      @JsonKey(name: 'allMeasurements') List<Measurement>? allMeasurements,
      @JsonKey(name: 'measurement') Measurement? measurement});

  $ContractCopyWith<$Res>? get contract;
  $EstimateCopyWith<$Res>? get estimate;
  $PeriodCopyWith<$Res>? get period;
  $MeasurementCopyWith<$Res>? get measurement;
}

/// @nodoc
class _$MBDetailResponseCopyWithImpl<$Res, $Val extends MBDetailResponse>
    implements $MBDetailResponseCopyWith<$Res> {
  _$MBDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = freezed,
    Object? estimate = freezed,
    Object? period = freezed,
    Object? allMeasurements = freezed,
    Object? measurement = freezed,
  }) {
    return _then(_value.copyWith(
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      estimate: freezed == estimate
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as Estimate?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      allMeasurements: freezed == allMeasurements
          ? _value.allMeasurements
          : allMeasurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>?,
      measurement: freezed == measurement
          ? _value.measurement
          : measurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
    ) as $Val);
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
  $EstimateCopyWith<$Res>? get estimate {
    if (_value.estimate == null) {
      return null;
    }

    return $EstimateCopyWith<$Res>(_value.estimate!, (value) {
      return _then(_value.copyWith(estimate: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $PeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MeasurementCopyWith<$Res>? get measurement {
    if (_value.measurement == null) {
      return null;
    }

    return $MeasurementCopyWith<$Res>(_value.measurement!, (value) {
      return _then(_value.copyWith(measurement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MBDetailResponseCopyWith<$Res>
    implements $MBDetailResponseCopyWith<$Res> {
  factory _$$_MBDetailResponseCopyWith(
          _$_MBDetailResponse value, $Res Function(_$_MBDetailResponse) then) =
      __$$_MBDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contract') Contract? contract,
      @JsonKey(name: 'estimate') Estimate? estimate,
      @JsonKey(name: 'period') Period? period,
      @JsonKey(name: 'allMeasurements') List<Measurement>? allMeasurements,
      @JsonKey(name: 'measurement') Measurement? measurement});

  @override
  $ContractCopyWith<$Res>? get contract;
  @override
  $EstimateCopyWith<$Res>? get estimate;
  @override
  $PeriodCopyWith<$Res>? get period;
  @override
  $MeasurementCopyWith<$Res>? get measurement;
}

/// @nodoc
class __$$_MBDetailResponseCopyWithImpl<$Res>
    extends _$MBDetailResponseCopyWithImpl<$Res, _$_MBDetailResponse>
    implements _$$_MBDetailResponseCopyWith<$Res> {
  __$$_MBDetailResponseCopyWithImpl(
      _$_MBDetailResponse _value, $Res Function(_$_MBDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = freezed,
    Object? estimate = freezed,
    Object? period = freezed,
    Object? allMeasurements = freezed,
    Object? measurement = freezed,
  }) {
    return _then(_$_MBDetailResponse(
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      estimate: freezed == estimate
          ? _value.estimate
          : estimate // ignore: cast_nullable_to_non_nullable
              as Estimate?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period?,
      allMeasurements: freezed == allMeasurements
          ? _value._allMeasurements
          : allMeasurements // ignore: cast_nullable_to_non_nullable
              as List<Measurement>?,
      measurement: freezed == measurement
          ? _value.measurement
          : measurement // ignore: cast_nullable_to_non_nullable
              as Measurement?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MBDetailResponse implements _MBDetailResponse {
  const _$_MBDetailResponse(
      {@JsonKey(name: 'contract')
          this.contract,
      @JsonKey(name: 'estimate')
          this.estimate,
      @JsonKey(name: 'period')
          this.period,
      @JsonKey(name: 'allMeasurements')
          final List<Measurement>? allMeasurements,
      @JsonKey(name: 'measurement')
          this.measurement})
      : _allMeasurements = allMeasurements;

  factory _$_MBDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MBDetailResponseFromJson(json);

  @override
  @JsonKey(name: 'contract')
  final Contract? contract;
  @override
  @JsonKey(name: 'estimate')
  final Estimate? estimate;
  @override
  @JsonKey(name: 'period')
  final Period? period;
  final List<Measurement>? _allMeasurements;
  @override
  @JsonKey(name: 'allMeasurements')
  List<Measurement>? get allMeasurements {
    final value = _allMeasurements;
    if (value == null) return null;
    if (_allMeasurements is EqualUnmodifiableListView) return _allMeasurements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'measurement')
  final Measurement? measurement;

  @override
  String toString() {
    return 'MBDetailResponse(contract: $contract, estimate: $estimate, period: $period, allMeasurements: $allMeasurements, measurement: $measurement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MBDetailResponse &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.estimate, estimate) ||
                other.estimate == estimate) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality()
                .equals(other._allMeasurements, _allMeasurements) &&
            (identical(other.measurement, measurement) ||
                other.measurement == measurement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contract, estimate, period,
      const DeepCollectionEquality().hash(_allMeasurements), measurement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MBDetailResponseCopyWith<_$_MBDetailResponse> get copyWith =>
      __$$_MBDetailResponseCopyWithImpl<_$_MBDetailResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MBDetailResponseToJson(
      this,
    );
  }
}

abstract class _MBDetailResponse implements MBDetailResponse {
  const factory _MBDetailResponse(
      {@JsonKey(name: 'contract')
          final Contract? contract,
      @JsonKey(name: 'estimate')
          final Estimate? estimate,
      @JsonKey(name: 'period')
          final Period? period,
      @JsonKey(name: 'allMeasurements')
          final List<Measurement>? allMeasurements,
      @JsonKey(name: 'measurement')
          final Measurement? measurement}) = _$_MBDetailResponse;

  factory _MBDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_MBDetailResponse.fromJson;

  @override
  @JsonKey(name: 'contract')
  Contract? get contract;
  @override
  @JsonKey(name: 'estimate')
  Estimate? get estimate;
  @override
  @JsonKey(name: 'period')
  Period? get period;
  @override
  @JsonKey(name: 'allMeasurements')
  List<Measurement>? get allMeasurements;
  @override
  @JsonKey(name: 'measurement')
  Measurement? get measurement;
  @override
  @JsonKey(ignore: true)
  _$$_MBDetailResponseCopyWith<_$_MBDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Measurement _$MeasurementFromJson(Map<String, dynamic> json) {
  return _Measurement.fromJson(json);
}

/// @nodoc
mixin _$Measurement {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'measurementNumber')
  String? get measurementNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'physicalRefNumber')
  String? get physicalRefNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceId')
  String? get referenceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entryDate')
  int? get entryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'wfStatus')
  String? get wfStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'workflow')
  String? get workflow => throw _privateConstructorUsedError;
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalDetails')
  MeasurementAdditionalDetail? get additionalDetail =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementCopyWith<Measurement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementCopyWith<$Res> {
  factory $MeasurementCopyWith(
          Measurement value, $Res Function(Measurement) then) =
      _$MeasurementCopyWithImpl<$Res, Measurement>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'tenantId')
          String? tenantId,
      @JsonKey(name: 'measurementNumber')
          String? measurementNumber,
      @JsonKey(name: 'physicalRefNumber')
          String? physicalRefNumber,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'entryDate')
          int? entryDate,
      @JsonKey(name: 'isActive')
          bool? isActive,
      @JsonKey(name: 'wfStatus')
          String? wfStatus,
      @JsonKey(name: 'workflow')
          String? workflow,
      @JsonKey(name: 'auditDetails')
          AuditDetails? auditDetails,
      @JsonKey(name: 'additionalDetails')
          MeasurementAdditionalDetail? additionalDetail});

  $AuditDetailsCopyWith<$Res>? get auditDetails;
  $MeasurementAdditionalDetailCopyWith<$Res>? get additionalDetail;
}

/// @nodoc
class _$MeasurementCopyWithImpl<$Res, $Val extends Measurement>
    implements $MeasurementCopyWith<$Res> {
  _$MeasurementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? measurementNumber = freezed,
    Object? physicalRefNumber = freezed,
    Object? referenceId = freezed,
    Object? entryDate = freezed,
    Object? isActive = freezed,
    Object? wfStatus = freezed,
    Object? workflow = freezed,
    Object? auditDetails = freezed,
    Object? additionalDetail = freezed,
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
      measurementNumber: freezed == measurementNumber
          ? _value.measurementNumber
          : measurementNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalRefNumber: freezed == physicalRefNumber
          ? _value.physicalRefNumber
          : physicalRefNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      workflow: freezed == workflow
          ? _value.workflow
          : workflow // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      additionalDetail: freezed == additionalDetail
          ? _value.additionalDetail
          : additionalDetail // ignore: cast_nullable_to_non_nullable
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
  $MeasurementAdditionalDetailCopyWith<$Res>? get additionalDetail {
    if (_value.additionalDetail == null) {
      return null;
    }

    return $MeasurementAdditionalDetailCopyWith<$Res>(_value.additionalDetail!,
        (value) {
      return _then(_value.copyWith(additionalDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MeasurementCopyWith<$Res>
    implements $MeasurementCopyWith<$Res> {
  factory _$$_MeasurementCopyWith(
          _$_Measurement value, $Res Function(_$_Measurement) then) =
      __$$_MeasurementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'tenantId')
          String? tenantId,
      @JsonKey(name: 'measurementNumber')
          String? measurementNumber,
      @JsonKey(name: 'physicalRefNumber')
          String? physicalRefNumber,
      @JsonKey(name: 'referenceId')
          String? referenceId,
      @JsonKey(name: 'entryDate')
          int? entryDate,
      @JsonKey(name: 'isActive')
          bool? isActive,
      @JsonKey(name: 'wfStatus')
          String? wfStatus,
      @JsonKey(name: 'workflow')
          String? workflow,
      @JsonKey(name: 'auditDetails')
          AuditDetails? auditDetails,
      @JsonKey(name: 'additionalDetails')
          MeasurementAdditionalDetail? additionalDetail});

  @override
  $AuditDetailsCopyWith<$Res>? get auditDetails;
  @override
  $MeasurementAdditionalDetailCopyWith<$Res>? get additionalDetail;
}

/// @nodoc
class __$$_MeasurementCopyWithImpl<$Res>
    extends _$MeasurementCopyWithImpl<$Res, _$_Measurement>
    implements _$$_MeasurementCopyWith<$Res> {
  __$$_MeasurementCopyWithImpl(
      _$_Measurement _value, $Res Function(_$_Measurement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? measurementNumber = freezed,
    Object? physicalRefNumber = freezed,
    Object? referenceId = freezed,
    Object? entryDate = freezed,
    Object? isActive = freezed,
    Object? wfStatus = freezed,
    Object? workflow = freezed,
    Object? auditDetails = freezed,
    Object? additionalDetail = freezed,
  }) {
    return _then(_$_Measurement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      measurementNumber: freezed == measurementNumber
          ? _value.measurementNumber
          : measurementNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      physicalRefNumber: freezed == physicalRefNumber
          ? _value.physicalRefNumber
          : physicalRefNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceId: freezed == referenceId
          ? _value.referenceId
          : referenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      workflow: freezed == workflow
          ? _value.workflow
          : workflow // ignore: cast_nullable_to_non_nullable
              as String?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
      additionalDetail: freezed == additionalDetail
          ? _value.additionalDetail
          : additionalDetail // ignore: cast_nullable_to_non_nullable
              as MeasurementAdditionalDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Measurement implements _Measurement {
  const _$_Measurement(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'measurementNumber') this.measurementNumber,
      @JsonKey(name: 'physicalRefNumber') this.physicalRefNumber,
      @JsonKey(name: 'referenceId') this.referenceId,
      @JsonKey(name: 'entryDate') this.entryDate,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'wfStatus') this.wfStatus,
      @JsonKey(name: 'workflow') this.workflow,
      @JsonKey(name: 'auditDetails') this.auditDetails,
      @JsonKey(name: 'additionalDetails') this.additionalDetail});

  factory _$_Measurement.fromJson(Map<String, dynamic> json) =>
      _$$_MeasurementFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'measurementNumber')
  final String? measurementNumber;
  @override
  @JsonKey(name: 'physicalRefNumber')
  final String? physicalRefNumber;
  @override
  @JsonKey(name: 'referenceId')
  final String? referenceId;
  @override
  @JsonKey(name: 'entryDate')
  final int? entryDate;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'wfStatus')
  final String? wfStatus;
  @override
  @JsonKey(name: 'workflow')
  final String? workflow;
  @override
  @JsonKey(name: 'auditDetails')
  final AuditDetails? auditDetails;
  @override
  @JsonKey(name: 'additionalDetails')
  final MeasurementAdditionalDetail? additionalDetail;

  @override
  String toString() {
    return 'Measurement(id: $id, tenantId: $tenantId, measurementNumber: $measurementNumber, physicalRefNumber: $physicalRefNumber, referenceId: $referenceId, entryDate: $entryDate, isActive: $isActive, wfStatus: $wfStatus, workflow: $workflow, auditDetails: $auditDetails, additionalDetail: $additionalDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Measurement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.measurementNumber, measurementNumber) ||
                other.measurementNumber == measurementNumber) &&
            (identical(other.physicalRefNumber, physicalRefNumber) ||
                other.physicalRefNumber == physicalRefNumber) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.entryDate, entryDate) ||
                other.entryDate == entryDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.wfStatus, wfStatus) ||
                other.wfStatus == wfStatus) &&
            (identical(other.workflow, workflow) ||
                other.workflow == workflow) &&
            (identical(other.auditDetails, auditDetails) ||
                other.auditDetails == auditDetails) &&
            (identical(other.additionalDetail, additionalDetail) ||
                other.additionalDetail == additionalDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tenantId,
      measurementNumber,
      physicalRefNumber,
      referenceId,
      entryDate,
      isActive,
      wfStatus,
      workflow,
      auditDetails,
      additionalDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementCopyWith<_$_Measurement> get copyWith =>
      __$$_MeasurementCopyWithImpl<_$_Measurement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasurementToJson(
      this,
    );
  }
}

abstract class _Measurement implements Measurement {
  const factory _Measurement(
          {@JsonKey(name: 'id')
              final String? id,
          @JsonKey(name: 'tenantId')
              final String? tenantId,
          @JsonKey(name: 'measurementNumber')
              final String? measurementNumber,
          @JsonKey(name: 'physicalRefNumber')
              final String? physicalRefNumber,
          @JsonKey(name: 'referenceId')
              final String? referenceId,
          @JsonKey(name: 'entryDate')
              final int? entryDate,
          @JsonKey(name: 'isActive')
              final bool? isActive,
          @JsonKey(name: 'wfStatus')
              final String? wfStatus,
          @JsonKey(name: 'workflow')
              final String? workflow,
          @JsonKey(name: 'auditDetails')
              final AuditDetails? auditDetails,
          @JsonKey(name: 'additionalDetails')
              final MeasurementAdditionalDetail? additionalDetail}) =
      _$_Measurement;

  factory _Measurement.fromJson(Map<String, dynamic> json) =
      _$_Measurement.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'measurementNumber')
  String? get measurementNumber;
  @override
  @JsonKey(name: 'physicalRefNumber')
  String? get physicalRefNumber;
  @override
  @JsonKey(name: 'referenceId')
  String? get referenceId;
  @override
  @JsonKey(name: 'entryDate')
  int? get entryDate;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'wfStatus')
  String? get wfStatus;
  @override
  @JsonKey(name: 'workflow')
  String? get workflow;
  @override
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails;
  @override
  @JsonKey(name: 'additionalDetails')
  MeasurementAdditionalDetail? get additionalDetail;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementCopyWith<_$_Measurement> get copyWith =>
      throw _privateConstructorUsedError;
}

MeasurementAdditionalDetail _$MeasurementAdditionalDetailFromJson(
    Map<String, dynamic> json) {
  return _MeasurementAdditionalDetail.fromJson(json);
}

/// @nodoc
mixin _$MeasurementAdditionalDetail {
  @JsonKey(name: 'endDate')
  int? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sorAmount')
  double? get sorAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'startDate')
  int? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalAmount')
  double? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'nonSorAmount')
  double? get nonSorAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'musterRollNumber')
  String? get musterRollNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeasurementAdditionalDetailCopyWith<MeasurementAdditionalDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementAdditionalDetailCopyWith<$Res> {
  factory $MeasurementAdditionalDetailCopyWith(
          MeasurementAdditionalDetail value,
          $Res Function(MeasurementAdditionalDetail) then) =
      _$MeasurementAdditionalDetailCopyWithImpl<$Res,
          MeasurementAdditionalDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'endDate') int? endDate,
      @JsonKey(name: 'sorAmount') double? sorAmount,
      @JsonKey(name: 'startDate') int? startDate,
      @JsonKey(name: 'totalAmount') double? totalAmount,
      @JsonKey(name: 'nonSorAmount') double? nonSorAmount,
      @JsonKey(name: 'musterRollNumber') String? musterRollNumber});
}

/// @nodoc
class _$MeasurementAdditionalDetailCopyWithImpl<$Res,
        $Val extends MeasurementAdditionalDetail>
    implements $MeasurementAdditionalDetailCopyWith<$Res> {
  _$MeasurementAdditionalDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endDate = freezed,
    Object? sorAmount = freezed,
    Object? startDate = freezed,
    Object? totalAmount = freezed,
    Object? nonSorAmount = freezed,
    Object? musterRollNumber = freezed,
  }) {
    return _then(_value.copyWith(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      sorAmount: freezed == sorAmount
          ? _value.sorAmount
          : sorAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      nonSorAmount: freezed == nonSorAmount
          ? _value.nonSorAmount
          : nonSorAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      musterRollNumber: freezed == musterRollNumber
          ? _value.musterRollNumber
          : musterRollNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MeasurementAdditionalDetailCopyWith<$Res>
    implements $MeasurementAdditionalDetailCopyWith<$Res> {
  factory _$$_MeasurementAdditionalDetailCopyWith(
          _$_MeasurementAdditionalDetail value,
          $Res Function(_$_MeasurementAdditionalDetail) then) =
      __$$_MeasurementAdditionalDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'endDate') int? endDate,
      @JsonKey(name: 'sorAmount') double? sorAmount,
      @JsonKey(name: 'startDate') int? startDate,
      @JsonKey(name: 'totalAmount') double? totalAmount,
      @JsonKey(name: 'nonSorAmount') double? nonSorAmount,
      @JsonKey(name: 'musterRollNumber') String? musterRollNumber});
}

/// @nodoc
class __$$_MeasurementAdditionalDetailCopyWithImpl<$Res>
    extends _$MeasurementAdditionalDetailCopyWithImpl<$Res,
        _$_MeasurementAdditionalDetail>
    implements _$$_MeasurementAdditionalDetailCopyWith<$Res> {
  __$$_MeasurementAdditionalDetailCopyWithImpl(
      _$_MeasurementAdditionalDetail _value,
      $Res Function(_$_MeasurementAdditionalDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endDate = freezed,
    Object? sorAmount = freezed,
    Object? startDate = freezed,
    Object? totalAmount = freezed,
    Object? nonSorAmount = freezed,
    Object? musterRollNumber = freezed,
  }) {
    return _then(_$_MeasurementAdditionalDetail(
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      sorAmount: freezed == sorAmount
          ? _value.sorAmount
          : sorAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      nonSorAmount: freezed == nonSorAmount
          ? _value.nonSorAmount
          : nonSorAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      musterRollNumber: freezed == musterRollNumber
          ? _value.musterRollNumber
          : musterRollNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeasurementAdditionalDetail implements _MeasurementAdditionalDetail {
  const _$_MeasurementAdditionalDetail(
      {@JsonKey(name: 'endDate') this.endDate,
      @JsonKey(name: 'sorAmount') this.sorAmount,
      @JsonKey(name: 'startDate') this.startDate,
      @JsonKey(name: 'totalAmount') this.totalAmount,
      @JsonKey(name: 'nonSorAmount') this.nonSorAmount,
      @JsonKey(name: 'musterRollNumber') this.musterRollNumber});

  factory _$_MeasurementAdditionalDetail.fromJson(Map<String, dynamic> json) =>
      _$$_MeasurementAdditionalDetailFromJson(json);

  @override
  @JsonKey(name: 'endDate')
  final int? endDate;
  @override
  @JsonKey(name: 'sorAmount')
  final double? sorAmount;
  @override
  @JsonKey(name: 'startDate')
  final int? startDate;
  @override
  @JsonKey(name: 'totalAmount')
  final double? totalAmount;
  @override
  @JsonKey(name: 'nonSorAmount')
  final double? nonSorAmount;
  @override
  @JsonKey(name: 'musterRollNumber')
  final String? musterRollNumber;

  @override
  String toString() {
    return 'MeasurementAdditionalDetail(endDate: $endDate, sorAmount: $sorAmount, startDate: $startDate, totalAmount: $totalAmount, nonSorAmount: $nonSorAmount, musterRollNumber: $musterRollNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeasurementAdditionalDetail &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.sorAmount, sorAmount) ||
                other.sorAmount == sorAmount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.nonSorAmount, nonSorAmount) ||
                other.nonSorAmount == nonSorAmount) &&
            (identical(other.musterRollNumber, musterRollNumber) ||
                other.musterRollNumber == musterRollNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, endDate, sorAmount, startDate,
      totalAmount, nonSorAmount, musterRollNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MeasurementAdditionalDetailCopyWith<_$_MeasurementAdditionalDetail>
      get copyWith => __$$_MeasurementAdditionalDetailCopyWithImpl<
          _$_MeasurementAdditionalDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeasurementAdditionalDetailToJson(
      this,
    );
  }
}

abstract class _MeasurementAdditionalDetail
    implements MeasurementAdditionalDetail {
  const factory _MeasurementAdditionalDetail(
          {@JsonKey(name: 'endDate') final int? endDate,
          @JsonKey(name: 'sorAmount') final double? sorAmount,
          @JsonKey(name: 'startDate') final int? startDate,
          @JsonKey(name: 'totalAmount') final double? totalAmount,
          @JsonKey(name: 'nonSorAmount') final double? nonSorAmount,
          @JsonKey(name: 'musterRollNumber') final String? musterRollNumber}) =
      _$_MeasurementAdditionalDetail;

  factory _MeasurementAdditionalDetail.fromJson(Map<String, dynamic> json) =
      _$_MeasurementAdditionalDetail.fromJson;

  @override
  @JsonKey(name: 'endDate')
  int? get endDate;
  @override
  @JsonKey(name: 'sorAmount')
  double? get sorAmount;
  @override
  @JsonKey(name: 'startDate')
  int? get startDate;
  @override
  @JsonKey(name: 'totalAmount')
  double? get totalAmount;
  @override
  @JsonKey(name: 'nonSorAmount')
  double? get nonSorAmount;
  @override
  @JsonKey(name: 'musterRollNumber')
  String? get musterRollNumber;
  @override
  @JsonKey(ignore: true)
  _$$_MeasurementAdditionalDetailCopyWith<_$_MeasurementAdditionalDetail>
      get copyWith => throw _privateConstructorUsedError;
}

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return _Period.fromJson(json);
}

/// @nodoc
mixin _$Period {
  @JsonKey(name: 'startDate')
  int? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate')
  int? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeriodCopyWith<Period> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodCopyWith<$Res> {
  factory $PeriodCopyWith(Period value, $Res Function(Period) then) =
      _$PeriodCopyWithImpl<$Res, Period>;
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate') int? startDate,
      @JsonKey(name: 'endDate') int? endDate});
}

/// @nodoc
class _$PeriodCopyWithImpl<$Res, $Val extends Period>
    implements $PeriodCopyWith<$Res> {
  _$PeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeriodCopyWith<$Res> implements $PeriodCopyWith<$Res> {
  factory _$$_PeriodCopyWith(_$_Period value, $Res Function(_$_Period) then) =
      __$$_PeriodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate') int? startDate,
      @JsonKey(name: 'endDate') int? endDate});
}

/// @nodoc
class __$$_PeriodCopyWithImpl<$Res>
    extends _$PeriodCopyWithImpl<$Res, _$_Period>
    implements _$$_PeriodCopyWith<$Res> {
  __$$_PeriodCopyWithImpl(_$_Period _value, $Res Function(_$_Period) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_Period(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Period implements _Period {
  const _$_Period(
      {@JsonKey(name: 'startDate') this.startDate,
      @JsonKey(name: 'endDate') this.endDate});

  factory _$_Period.fromJson(Map<String, dynamic> json) =>
      _$$_PeriodFromJson(json);

  @override
  @JsonKey(name: 'startDate')
  final int? startDate;
  @override
  @JsonKey(name: 'endDate')
  final int? endDate;

  @override
  String toString() {
    return 'Period(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Period &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeriodCopyWith<_$_Period> get copyWith =>
      __$$_PeriodCopyWithImpl<_$_Period>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeriodToJson(
      this,
    );
  }
}

abstract class _Period implements Period {
  const factory _Period(
      {@JsonKey(name: 'startDate') final int? startDate,
      @JsonKey(name: 'endDate') final int? endDate}) = _$_Period;

  factory _Period.fromJson(Map<String, dynamic> json) = _$_Period.fromJson;

  @override
  @JsonKey(name: 'startDate')
  int? get startDate;
  @override
  @JsonKey(name: 'endDate')
  int? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_PeriodCopyWith<_$_Period> get copyWith =>
      throw _privateConstructorUsedError;
}

Estimate _$EstimateFromJson(Map<String, dynamic> json) {
  return _Estimate.fromJson(json);
}

/// @nodoc
mixin _$Estimate {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateNumber')
  String? get estimateNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'revisionNumber')
  String? get revisionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'businessService')
  String? get businessService => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldUuid')
  String? get oldUuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'projectId')
  String? get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'versionNumber')
  int? get versionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'proposalDate')
  int? get proposalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'wfStatus')
  String? get wfStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'referenceNumber')
  String? get referenceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'executingDepartment')
  String? get executingDepartment => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  EstimateAddress? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimateDetails')
  List<EstimateDetail>? get estimateDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstimateCopyWith<Estimate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstimateCopyWith<$Res> {
  factory $EstimateCopyWith(Estimate value, $Res Function(Estimate) then) =
      _$EstimateCopyWithImpl<$Res, Estimate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'estimateNumber') String? estimateNumber,
      @JsonKey(name: 'revisionNumber') String? revisionNumber,
      @JsonKey(name: 'businessService') String? businessService,
      @JsonKey(name: 'oldUuid') String? oldUuid,
      @JsonKey(name: 'projectId') String? projectId,
      @JsonKey(name: 'versionNumber') int? versionNumber,
      @JsonKey(name: 'proposalDate') int? proposalDate,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'wfStatus') String? wfStatus,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'referenceNumber') String? referenceNumber,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'executingDepartment') String? executingDepartment,
      @JsonKey(name: 'address') EstimateAddress? address,
      @JsonKey(name: 'estimateDetails') List<EstimateDetail>? estimateDetails,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails});

  $EstimateAddressCopyWith<$Res>? get address;
  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class _$EstimateCopyWithImpl<$Res, $Val extends Estimate>
    implements $EstimateCopyWith<$Res> {
  _$EstimateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? estimateNumber = freezed,
    Object? revisionNumber = freezed,
    Object? businessService = freezed,
    Object? oldUuid = freezed,
    Object? projectId = freezed,
    Object? versionNumber = freezed,
    Object? proposalDate = freezed,
    Object? status = freezed,
    Object? wfStatus = freezed,
    Object? name = freezed,
    Object? referenceNumber = freezed,
    Object? description = freezed,
    Object? executingDepartment = freezed,
    Object? address = freezed,
    Object? estimateDetails = freezed,
    Object? auditDetails = freezed,
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
      estimateNumber: freezed == estimateNumber
          ? _value.estimateNumber
          : estimateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      revisionNumber: freezed == revisionNumber
          ? _value.revisionNumber
          : revisionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      oldUuid: freezed == oldUuid
          ? _value.oldUuid
          : oldUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      versionNumber: freezed == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      proposalDate: freezed == proposalDate
          ? _value.proposalDate
          : proposalDate // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      executingDepartment: freezed == executingDepartment
          ? _value.executingDepartment
          : executingDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as EstimateAddress?,
      estimateDetails: freezed == estimateDetails
          ? _value.estimateDetails
          : estimateDetails // ignore: cast_nullable_to_non_nullable
              as List<EstimateDetail>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EstimateAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $EstimateAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
abstract class _$$_EstimateCopyWith<$Res> implements $EstimateCopyWith<$Res> {
  factory _$$_EstimateCopyWith(
          _$_Estimate value, $Res Function(_$_Estimate) then) =
      __$$_EstimateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'estimateNumber') String? estimateNumber,
      @JsonKey(name: 'revisionNumber') String? revisionNumber,
      @JsonKey(name: 'businessService') String? businessService,
      @JsonKey(name: 'oldUuid') String? oldUuid,
      @JsonKey(name: 'projectId') String? projectId,
      @JsonKey(name: 'versionNumber') int? versionNumber,
      @JsonKey(name: 'proposalDate') int? proposalDate,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'wfStatus') String? wfStatus,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'referenceNumber') String? referenceNumber,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'executingDepartment') String? executingDepartment,
      @JsonKey(name: 'address') EstimateAddress? address,
      @JsonKey(name: 'estimateDetails') List<EstimateDetail>? estimateDetails,
      @JsonKey(name: 'auditDetails') AuditDetails? auditDetails});

  @override
  $EstimateAddressCopyWith<$Res>? get address;
  @override
  $AuditDetailsCopyWith<$Res>? get auditDetails;
}

/// @nodoc
class __$$_EstimateCopyWithImpl<$Res>
    extends _$EstimateCopyWithImpl<$Res, _$_Estimate>
    implements _$$_EstimateCopyWith<$Res> {
  __$$_EstimateCopyWithImpl(
      _$_Estimate _value, $Res Function(_$_Estimate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? estimateNumber = freezed,
    Object? revisionNumber = freezed,
    Object? businessService = freezed,
    Object? oldUuid = freezed,
    Object? projectId = freezed,
    Object? versionNumber = freezed,
    Object? proposalDate = freezed,
    Object? status = freezed,
    Object? wfStatus = freezed,
    Object? name = freezed,
    Object? referenceNumber = freezed,
    Object? description = freezed,
    Object? executingDepartment = freezed,
    Object? address = freezed,
    Object? estimateDetails = freezed,
    Object? auditDetails = freezed,
  }) {
    return _then(_$_Estimate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      estimateNumber: freezed == estimateNumber
          ? _value.estimateNumber
          : estimateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      revisionNumber: freezed == revisionNumber
          ? _value.revisionNumber
          : revisionNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      businessService: freezed == businessService
          ? _value.businessService
          : businessService // ignore: cast_nullable_to_non_nullable
              as String?,
      oldUuid: freezed == oldUuid
          ? _value.oldUuid
          : oldUuid // ignore: cast_nullable_to_non_nullable
              as String?,
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      versionNumber: freezed == versionNumber
          ? _value.versionNumber
          : versionNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      proposalDate: freezed == proposalDate
          ? _value.proposalDate
          : proposalDate // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      wfStatus: freezed == wfStatus
          ? _value.wfStatus
          : wfStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      executingDepartment: freezed == executingDepartment
          ? _value.executingDepartment
          : executingDepartment // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as EstimateAddress?,
      estimateDetails: freezed == estimateDetails
          ? _value._estimateDetails
          : estimateDetails // ignore: cast_nullable_to_non_nullable
              as List<EstimateDetail>?,
      auditDetails: freezed == auditDetails
          ? _value.auditDetails
          : auditDetails // ignore: cast_nullable_to_non_nullable
              as AuditDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Estimate implements _Estimate {
  const _$_Estimate(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'tenantId')
          this.tenantId,
      @JsonKey(name: 'estimateNumber')
          this.estimateNumber,
      @JsonKey(name: 'revisionNumber')
          this.revisionNumber,
      @JsonKey(name: 'businessService')
          this.businessService,
      @JsonKey(name: 'oldUuid')
          this.oldUuid,
      @JsonKey(name: 'projectId')
          this.projectId,
      @JsonKey(name: 'versionNumber')
          this.versionNumber,
      @JsonKey(name: 'proposalDate')
          this.proposalDate,
      @JsonKey(name: 'status')
          this.status,
      @JsonKey(name: 'wfStatus')
          this.wfStatus,
      @JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'referenceNumber')
          this.referenceNumber,
      @JsonKey(name: 'description')
          this.description,
      @JsonKey(name: 'executingDepartment')
          this.executingDepartment,
      @JsonKey(name: 'address')
          this.address,
      @JsonKey(name: 'estimateDetails')
          final List<EstimateDetail>? estimateDetails,
      @JsonKey(name: 'auditDetails')
          this.auditDetails})
      : _estimateDetails = estimateDetails;

  factory _$_Estimate.fromJson(Map<String, dynamic> json) =>
      _$$_EstimateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'estimateNumber')
  final String? estimateNumber;
  @override
  @JsonKey(name: 'revisionNumber')
  final String? revisionNumber;
  @override
  @JsonKey(name: 'businessService')
  final String? businessService;
  @override
  @JsonKey(name: 'oldUuid')
  final String? oldUuid;
  @override
  @JsonKey(name: 'projectId')
  final String? projectId;
  @override
  @JsonKey(name: 'versionNumber')
  final int? versionNumber;
  @override
  @JsonKey(name: 'proposalDate')
  final int? proposalDate;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'wfStatus')
  final String? wfStatus;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'referenceNumber')
  final String? referenceNumber;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'executingDepartment')
  final String? executingDepartment;
  @override
  @JsonKey(name: 'address')
  final EstimateAddress? address;
  final List<EstimateDetail>? _estimateDetails;
  @override
  @JsonKey(name: 'estimateDetails')
  List<EstimateDetail>? get estimateDetails {
    final value = _estimateDetails;
    if (value == null) return null;
    if (_estimateDetails is EqualUnmodifiableListView) return _estimateDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'auditDetails')
  final AuditDetails? auditDetails;

  @override
  String toString() {
    return 'Estimate(id: $id, tenantId: $tenantId, estimateNumber: $estimateNumber, revisionNumber: $revisionNumber, businessService: $businessService, oldUuid: $oldUuid, projectId: $projectId, versionNumber: $versionNumber, proposalDate: $proposalDate, status: $status, wfStatus: $wfStatus, name: $name, referenceNumber: $referenceNumber, description: $description, executingDepartment: $executingDepartment, address: $address, estimateDetails: $estimateDetails, auditDetails: $auditDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Estimate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.estimateNumber, estimateNumber) ||
                other.estimateNumber == estimateNumber) &&
            (identical(other.revisionNumber, revisionNumber) ||
                other.revisionNumber == revisionNumber) &&
            (identical(other.businessService, businessService) ||
                other.businessService == businessService) &&
            (identical(other.oldUuid, oldUuid) || other.oldUuid == oldUuid) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.proposalDate, proposalDate) ||
                other.proposalDate == proposalDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.wfStatus, wfStatus) ||
                other.wfStatus == wfStatus) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.executingDepartment, executingDepartment) ||
                other.executingDepartment == executingDepartment) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._estimateDetails, _estimateDetails) &&
            (identical(other.auditDetails, auditDetails) ||
                other.auditDetails == auditDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tenantId,
      estimateNumber,
      revisionNumber,
      businessService,
      oldUuid,
      projectId,
      versionNumber,
      proposalDate,
      status,
      wfStatus,
      name,
      referenceNumber,
      description,
      executingDepartment,
      address,
      const DeepCollectionEquality().hash(_estimateDetails),
      auditDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EstimateCopyWith<_$_Estimate> get copyWith =>
      __$$_EstimateCopyWithImpl<_$_Estimate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EstimateToJson(
      this,
    );
  }
}

abstract class _Estimate implements Estimate {
  const factory _Estimate(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'tenantId')
          final String? tenantId,
      @JsonKey(name: 'estimateNumber')
          final String? estimateNumber,
      @JsonKey(name: 'revisionNumber')
          final String? revisionNumber,
      @JsonKey(name: 'businessService')
          final String? businessService,
      @JsonKey(name: 'oldUuid')
          final String? oldUuid,
      @JsonKey(name: 'projectId')
          final String? projectId,
      @JsonKey(name: 'versionNumber')
          final int? versionNumber,
      @JsonKey(name: 'proposalDate')
          final int? proposalDate,
      @JsonKey(name: 'status')
          final String? status,
      @JsonKey(name: 'wfStatus')
          final String? wfStatus,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'referenceNumber')
          final String? referenceNumber,
      @JsonKey(name: 'description')
          final String? description,
      @JsonKey(name: 'executingDepartment')
          final String? executingDepartment,
      @JsonKey(name: 'address')
          final EstimateAddress? address,
      @JsonKey(name: 'estimateDetails')
          final List<EstimateDetail>? estimateDetails,
      @JsonKey(name: 'auditDetails')
          final AuditDetails? auditDetails}) = _$_Estimate;

  factory _Estimate.fromJson(Map<String, dynamic> json) = _$_Estimate.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'estimateNumber')
  String? get estimateNumber;
  @override
  @JsonKey(name: 'revisionNumber')
  String? get revisionNumber;
  @override
  @JsonKey(name: 'businessService')
  String? get businessService;
  @override
  @JsonKey(name: 'oldUuid')
  String? get oldUuid;
  @override
  @JsonKey(name: 'projectId')
  String? get projectId;
  @override
  @JsonKey(name: 'versionNumber')
  int? get versionNumber;
  @override
  @JsonKey(name: 'proposalDate')
  int? get proposalDate;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'wfStatus')
  String? get wfStatus;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'referenceNumber')
  String? get referenceNumber;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'executingDepartment')
  String? get executingDepartment;
  @override
  @JsonKey(name: 'address')
  EstimateAddress? get address;
  @override
  @JsonKey(name: 'estimateDetails')
  List<EstimateDetail>? get estimateDetails;
  @override
  @JsonKey(name: 'auditDetails')
  AuditDetails? get auditDetails;
  @override
  @JsonKey(ignore: true)
  _$$_EstimateCopyWith<_$_Estimate> get copyWith =>
      throw _privateConstructorUsedError;
}

EstimateDetail _$EstimateDetailFromJson(Map<String, dynamic> json) {
  return _EstimateDetail.fromJson(json);
}

/// @nodoc
mixin _$EstimateDetail {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'previousLineItemId')
  String? get previousLineItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sorId')
  String? get sorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitRate')
  double? get unitRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'noOfunit')
  int? get noOfunit => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'uomValue')
  double? get uomValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'length')
  int? get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'width')
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDeduction')
  bool? get isDeduction => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountDetail')
  List<AmoutDetail>? get amountDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstimateDetailCopyWith<EstimateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstimateDetailCopyWith<$Res> {
  factory $EstimateDetailCopyWith(
          EstimateDetail value, $Res Function(EstimateDetail) then) =
      _$EstimateDetailCopyWithImpl<$Res, EstimateDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'previousLineItemId') String? previousLineItemId,
      @JsonKey(name: 'sorId') String? sorId,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'unitRate') double? unitRate,
      @JsonKey(name: 'noOfunit') int? noOfunit,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'uomValue') double? uomValue,
      @JsonKey(name: 'length') int? length,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'isDeduction') bool? isDeduction,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'amountDetail') List<AmoutDetail>? amountDetails});
}

/// @nodoc
class _$EstimateDetailCopyWithImpl<$Res, $Val extends EstimateDetail>
    implements $EstimateDetailCopyWith<$Res> {
  _$EstimateDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? previousLineItemId = freezed,
    Object? sorId = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? unitRate = freezed,
    Object? noOfunit = freezed,
    Object? uom = freezed,
    Object? uomValue = freezed,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quantity = freezed,
    Object? isDeduction = freezed,
    Object? isActive = freezed,
    Object? amountDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      previousLineItemId: freezed == previousLineItemId
          ? _value.previousLineItemId
          : previousLineItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      sorId: freezed == sorId
          ? _value.sorId
          : sorId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unitRate: freezed == unitRate
          ? _value.unitRate
          : unitRate // ignore: cast_nullable_to_non_nullable
              as double?,
      noOfunit: freezed == noOfunit
          ? _value.noOfunit
          : noOfunit // ignore: cast_nullable_to_non_nullable
              as int?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      uomValue: freezed == uomValue
          ? _value.uomValue
          : uomValue // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeduction: freezed == isDeduction
          ? _value.isDeduction
          : isDeduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      amountDetails: freezed == amountDetails
          ? _value.amountDetails
          : amountDetails // ignore: cast_nullable_to_non_nullable
              as List<AmoutDetail>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EstimateDetailCopyWith<$Res>
    implements $EstimateDetailCopyWith<$Res> {
  factory _$$_EstimateDetailCopyWith(
          _$_EstimateDetail value, $Res Function(_$_EstimateDetail) then) =
      __$$_EstimateDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'previousLineItemId') String? previousLineItemId,
      @JsonKey(name: 'sorId') String? sorId,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'unitRate') double? unitRate,
      @JsonKey(name: 'noOfunit') int? noOfunit,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'uomValue') double? uomValue,
      @JsonKey(name: 'length') int? length,
      @JsonKey(name: 'width') int? width,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'quantity') int? quantity,
      @JsonKey(name: 'isDeduction') bool? isDeduction,
      @JsonKey(name: 'isActive') bool? isActive,
      @JsonKey(name: 'amountDetail') List<AmoutDetail>? amountDetails});
}

/// @nodoc
class __$$_EstimateDetailCopyWithImpl<$Res>
    extends _$EstimateDetailCopyWithImpl<$Res, _$_EstimateDetail>
    implements _$$_EstimateDetailCopyWith<$Res> {
  __$$_EstimateDetailCopyWithImpl(
      _$_EstimateDetail _value, $Res Function(_$_EstimateDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? previousLineItemId = freezed,
    Object? sorId = freezed,
    Object? category = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? unitRate = freezed,
    Object? noOfunit = freezed,
    Object? uom = freezed,
    Object? uomValue = freezed,
    Object? length = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quantity = freezed,
    Object? isDeduction = freezed,
    Object? isActive = freezed,
    Object? amountDetails = freezed,
  }) {
    return _then(_$_EstimateDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      previousLineItemId: freezed == previousLineItemId
          ? _value.previousLineItemId
          : previousLineItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      sorId: freezed == sorId
          ? _value.sorId
          : sorId // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      unitRate: freezed == unitRate
          ? _value.unitRate
          : unitRate // ignore: cast_nullable_to_non_nullable
              as double?,
      noOfunit: freezed == noOfunit
          ? _value.noOfunit
          : noOfunit // ignore: cast_nullable_to_non_nullable
              as int?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      uomValue: freezed == uomValue
          ? _value.uomValue
          : uomValue // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isDeduction: freezed == isDeduction
          ? _value.isDeduction
          : isDeduction // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      amountDetails: freezed == amountDetails
          ? _value._amountDetails
          : amountDetails // ignore: cast_nullable_to_non_nullable
              as List<AmoutDetail>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EstimateDetail implements _EstimateDetail {
  const _$_EstimateDetail(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'previousLineItemId') this.previousLineItemId,
      @JsonKey(name: 'sorId') this.sorId,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'unitRate') this.unitRate,
      @JsonKey(name: 'noOfunit') this.noOfunit,
      @JsonKey(name: 'uom') this.uom,
      @JsonKey(name: 'uomValue') this.uomValue,
      @JsonKey(name: 'length') this.length,
      @JsonKey(name: 'width') this.width,
      @JsonKey(name: 'height') this.height,
      @JsonKey(name: 'quantity') this.quantity,
      @JsonKey(name: 'isDeduction') this.isDeduction,
      @JsonKey(name: 'isActive') this.isActive,
      @JsonKey(name: 'amountDetail') final List<AmoutDetail>? amountDetails})
      : _amountDetails = amountDetails;

  factory _$_EstimateDetail.fromJson(Map<String, dynamic> json) =>
      _$$_EstimateDetailFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'previousLineItemId')
  final String? previousLineItemId;
  @override
  @JsonKey(name: 'sorId')
  final String? sorId;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'unitRate')
  final double? unitRate;
  @override
  @JsonKey(name: 'noOfunit')
  final int? noOfunit;
  @override
  @JsonKey(name: 'uom')
  final String? uom;
  @override
  @JsonKey(name: 'uomValue')
  final double? uomValue;
  @override
  @JsonKey(name: 'length')
  final int? length;
  @override
  @JsonKey(name: 'width')
  final int? width;
  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'quantity')
  final int? quantity;
  @override
  @JsonKey(name: 'isDeduction')
  final bool? isDeduction;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;
  final List<AmoutDetail>? _amountDetails;
  @override
  @JsonKey(name: 'amountDetail')
  List<AmoutDetail>? get amountDetails {
    final value = _amountDetails;
    if (value == null) return null;
    if (_amountDetails is EqualUnmodifiableListView) return _amountDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EstimateDetail(id: $id, previousLineItemId: $previousLineItemId, sorId: $sorId, category: $category, name: $name, description: $description, unitRate: $unitRate, noOfunit: $noOfunit, uom: $uom, uomValue: $uomValue, length: $length, width: $width, height: $height, quantity: $quantity, isDeduction: $isDeduction, isActive: $isActive, amountDetails: $amountDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EstimateDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.previousLineItemId, previousLineItemId) ||
                other.previousLineItemId == previousLineItemId) &&
            (identical(other.sorId, sorId) || other.sorId == sorId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unitRate, unitRate) ||
                other.unitRate == unitRate) &&
            (identical(other.noOfunit, noOfunit) ||
                other.noOfunit == noOfunit) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.uomValue, uomValue) ||
                other.uomValue == uomValue) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isDeduction, isDeduction) ||
                other.isDeduction == isDeduction) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._amountDetails, _amountDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      previousLineItemId,
      sorId,
      category,
      name,
      description,
      unitRate,
      noOfunit,
      uom,
      uomValue,
      length,
      width,
      height,
      quantity,
      isDeduction,
      isActive,
      const DeepCollectionEquality().hash(_amountDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EstimateDetailCopyWith<_$_EstimateDetail> get copyWith =>
      __$$_EstimateDetailCopyWithImpl<_$_EstimateDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EstimateDetailToJson(
      this,
    );
  }
}

abstract class _EstimateDetail implements EstimateDetail {
  const factory _EstimateDetail(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'previousLineItemId')
          final String? previousLineItemId,
      @JsonKey(name: 'sorId')
          final String? sorId,
      @JsonKey(name: 'category')
          final String? category,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'description')
          final String? description,
      @JsonKey(name: 'unitRate')
          final double? unitRate,
      @JsonKey(name: 'noOfunit')
          final int? noOfunit,
      @JsonKey(name: 'uom')
          final String? uom,
      @JsonKey(name: 'uomValue')
          final double? uomValue,
      @JsonKey(name: 'length')
          final int? length,
      @JsonKey(name: 'width')
          final int? width,
      @JsonKey(name: 'height')
          final int? height,
      @JsonKey(name: 'quantity')
          final int? quantity,
      @JsonKey(name: 'isDeduction')
          final bool? isDeduction,
      @JsonKey(name: 'isActive')
          final bool? isActive,
      @JsonKey(name: 'amountDetail')
          final List<AmoutDetail>? amountDetails}) = _$_EstimateDetail;

  factory _EstimateDetail.fromJson(Map<String, dynamic> json) =
      _$_EstimateDetail.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'previousLineItemId')
  String? get previousLineItemId;
  @override
  @JsonKey(name: 'sorId')
  String? get sorId;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'unitRate')
  double? get unitRate;
  @override
  @JsonKey(name: 'noOfunit')
  int? get noOfunit;
  @override
  @JsonKey(name: 'uom')
  String? get uom;
  @override
  @JsonKey(name: 'uomValue')
  double? get uomValue;
  @override
  @JsonKey(name: 'length')
  int? get length;
  @override
  @JsonKey(name: 'width')
  int? get width;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(name: 'quantity')
  int? get quantity;
  @override
  @JsonKey(name: 'isDeduction')
  bool? get isDeduction;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'amountDetail')
  List<AmoutDetail>? get amountDetails;
  @override
  @JsonKey(ignore: true)
  _$$_EstimateDetailCopyWith<_$_EstimateDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

AmoutDetail _$AmoutDetailFromJson(Map<String, dynamic> json) {
  return _AmoutDetail.fromJson(json);
}

/// @nodoc
mixin _$AmoutDetail {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AmoutDetailCopyWith<AmoutDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmoutDetailCopyWith<$Res> {
  factory $AmoutDetailCopyWith(
          AmoutDetail value, $Res Function(AmoutDetail) then) =
      _$AmoutDetailCopyWithImpl<$Res, AmoutDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'isActive') bool? isActive});
}

/// @nodoc
class _$AmoutDetailCopyWithImpl<$Res, $Val extends AmoutDetail>
    implements $AmoutDetailCopyWith<$Res> {
  _$AmoutDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? id = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AmoutDetailCopyWith<$Res>
    implements $AmoutDetailCopyWith<$Res> {
  factory _$$_AmoutDetailCopyWith(
          _$_AmoutDetail value, $Res Function(_$_AmoutDetail) then) =
      __$$_AmoutDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'id') String? id,
      @JsonKey(name: 'isActive') bool? isActive});
}

/// @nodoc
class __$$_AmoutDetailCopyWithImpl<$Res>
    extends _$AmoutDetailCopyWithImpl<$Res, _$_AmoutDetail>
    implements _$$_AmoutDetailCopyWith<$Res> {
  __$$_AmoutDetailCopyWithImpl(
      _$_AmoutDetail _value, $Res Function(_$_AmoutDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? amount = freezed,
    Object? id = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_AmoutDetail(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AmoutDetail implements _AmoutDetail {
  const _$_AmoutDetail(
      {@JsonKey(name: 'type') this.type,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'isActive') this.isActive});

  factory _$_AmoutDetail.fromJson(Map<String, dynamic> json) =>
      _$$_AmoutDetailFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'isActive')
  final bool? isActive;

  @override
  String toString() {
    return 'AmoutDetail(type: $type, amount: $amount, id: $id, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AmoutDetail &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, amount, id, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AmoutDetailCopyWith<_$_AmoutDetail> get copyWith =>
      __$$_AmoutDetailCopyWithImpl<_$_AmoutDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AmoutDetailToJson(
      this,
    );
  }
}

abstract class _AmoutDetail implements AmoutDetail {
  const factory _AmoutDetail(
      {@JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'amount') final double? amount,
      @JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'isActive') final bool? isActive}) = _$_AmoutDetail;

  factory _AmoutDetail.fromJson(Map<String, dynamic> json) =
      _$_AmoutDetail.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'isActive')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AmoutDetailCopyWith<_$_AmoutDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

EstimateAddress _$EstimateAddressFromJson(Map<String, dynamic> json) {
  return _EstimateAddress.fromJson(json);
}

/// @nodoc
mixin _$EstimateAddress {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'doorNo')
  String? get doorNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'locationAccuracy')
  double? get locationAccuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressNumber')
  String? get addressNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressLine1')
  String? get addressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressLine2')
  String? get addressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'landmark')
  String? get landmark => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstimateAddressCopyWith<EstimateAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstimateAddressCopyWith<$Res> {
  factory $EstimateAddressCopyWith(
          EstimateAddress value, $Res Function(EstimateAddress) then) =
      _$EstimateAddressCopyWithImpl<$Res, EstimateAddress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'doorNo') String? doorNo,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'locationAccuracy') double? locationAccuracy,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'addressNumber') String? addressNumber,
      @JsonKey(name: 'addressLine1') String? addressLine1,
      @JsonKey(name: 'addressLine2') String? addressLine2,
      @JsonKey(name: 'landmark') String? landmark,
      @JsonKey(name: 'city') String? city});
}

/// @nodoc
class _$EstimateAddressCopyWithImpl<$Res, $Val extends EstimateAddress>
    implements $EstimateAddressCopyWith<$Res> {
  _$EstimateAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? doorNo = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationAccuracy = freezed,
    Object? type = freezed,
    Object? addressNumber = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? landmark = freezed,
    Object? city = freezed,
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
      doorNo: freezed == doorNo
          ? _value.doorNo
          : doorNo // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationAccuracy: freezed == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNumber: freezed == addressNumber
          ? _value.addressNumber
          : addressNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EstimateAddressCopyWith<$Res>
    implements $EstimateAddressCopyWith<$Res> {
  factory _$$_EstimateAddressCopyWith(
          _$_EstimateAddress value, $Res Function(_$_EstimateAddress) then) =
      __$$_EstimateAddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'tenantId') String? tenantId,
      @JsonKey(name: 'doorNo') String? doorNo,
      @JsonKey(name: 'latitude') double? latitude,
      @JsonKey(name: 'longitude') double? longitude,
      @JsonKey(name: 'locationAccuracy') double? locationAccuracy,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'addressNumber') String? addressNumber,
      @JsonKey(name: 'addressLine1') String? addressLine1,
      @JsonKey(name: 'addressLine2') String? addressLine2,
      @JsonKey(name: 'landmark') String? landmark,
      @JsonKey(name: 'city') String? city});
}

/// @nodoc
class __$$_EstimateAddressCopyWithImpl<$Res>
    extends _$EstimateAddressCopyWithImpl<$Res, _$_EstimateAddress>
    implements _$$_EstimateAddressCopyWith<$Res> {
  __$$_EstimateAddressCopyWithImpl(
      _$_EstimateAddress _value, $Res Function(_$_EstimateAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? tenantId = freezed,
    Object? doorNo = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationAccuracy = freezed,
    Object? type = freezed,
    Object? addressNumber = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? landmark = freezed,
    Object? city = freezed,
  }) {
    return _then(_$_EstimateAddress(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      doorNo: freezed == doorNo
          ? _value.doorNo
          : doorNo // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      locationAccuracy: freezed == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      addressNumber: freezed == addressNumber
          ? _value.addressNumber
          : addressNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EstimateAddress implements _EstimateAddress {
  const _$_EstimateAddress(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'tenantId') this.tenantId,
      @JsonKey(name: 'doorNo') this.doorNo,
      @JsonKey(name: 'latitude') this.latitude,
      @JsonKey(name: 'longitude') this.longitude,
      @JsonKey(name: 'locationAccuracy') this.locationAccuracy,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'addressNumber') this.addressNumber,
      @JsonKey(name: 'addressLine1') this.addressLine1,
      @JsonKey(name: 'addressLine2') this.addressLine2,
      @JsonKey(name: 'landmark') this.landmark,
      @JsonKey(name: 'city') this.city});

  factory _$_EstimateAddress.fromJson(Map<String, dynamic> json) =>
      _$$_EstimateAddressFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'tenantId')
  final String? tenantId;
  @override
  @JsonKey(name: 'doorNo')
  final String? doorNo;
  @override
  @JsonKey(name: 'latitude')
  final double? latitude;
  @override
  @JsonKey(name: 'longitude')
  final double? longitude;
  @override
  @JsonKey(name: 'locationAccuracy')
  final double? locationAccuracy;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'addressNumber')
  final String? addressNumber;
  @override
  @JsonKey(name: 'addressLine1')
  final String? addressLine1;
  @override
  @JsonKey(name: 'addressLine2')
  final String? addressLine2;
  @override
  @JsonKey(name: 'landmark')
  final String? landmark;
  @override
  @JsonKey(name: 'city')
  final String? city;

  @override
  String toString() {
    return 'EstimateAddress(id: $id, tenantId: $tenantId, doorNo: $doorNo, latitude: $latitude, longitude: $longitude, locationAccuracy: $locationAccuracy, type: $type, addressNumber: $addressNumber, addressLine1: $addressLine1, addressLine2: $addressLine2, landmark: $landmark, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EstimateAddress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.doorNo, doorNo) || other.doorNo == doorNo) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.addressNumber, addressNumber) ||
                other.addressNumber == addressNumber) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tenantId,
      doorNo,
      latitude,
      longitude,
      locationAccuracy,
      type,
      addressNumber,
      addressLine1,
      addressLine2,
      landmark,
      city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EstimateAddressCopyWith<_$_EstimateAddress> get copyWith =>
      __$$_EstimateAddressCopyWithImpl<_$_EstimateAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EstimateAddressToJson(
      this,
    );
  }
}

abstract class _EstimateAddress implements EstimateAddress {
  const factory _EstimateAddress(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'tenantId') final String? tenantId,
      @JsonKey(name: 'doorNo') final String? doorNo,
      @JsonKey(name: 'latitude') final double? latitude,
      @JsonKey(name: 'longitude') final double? longitude,
      @JsonKey(name: 'locationAccuracy') final double? locationAccuracy,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'addressNumber') final String? addressNumber,
      @JsonKey(name: 'addressLine1') final String? addressLine1,
      @JsonKey(name: 'addressLine2') final String? addressLine2,
      @JsonKey(name: 'landmark') final String? landmark,
      @JsonKey(name: 'city') final String? city}) = _$_EstimateAddress;

  factory _EstimateAddress.fromJson(Map<String, dynamic> json) =
      _$_EstimateAddress.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'tenantId')
  String? get tenantId;
  @override
  @JsonKey(name: 'doorNo')
  String? get doorNo;
  @override
  @JsonKey(name: 'latitude')
  double? get latitude;
  @override
  @JsonKey(name: 'longitude')
  double? get longitude;
  @override
  @JsonKey(name: 'locationAccuracy')
  double? get locationAccuracy;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'addressNumber')
  String? get addressNumber;
  @override
  @JsonKey(name: 'addressLine1')
  String? get addressLine1;
  @override
  @JsonKey(name: 'addressLine2')
  String? get addressLine2;
  @override
  @JsonKey(name: 'landmark')
  String? get landmark;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(ignore: true)
  _$$_EstimateAddressCopyWith<_$_EstimateAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

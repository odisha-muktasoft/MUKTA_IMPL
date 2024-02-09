// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wage_seeker_registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WageSeekerBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WageSeekerBlocEventCopyWith<$Res> {
  factory $WageSeekerBlocEventCopyWith(
          WageSeekerBlocEvent value, $Res Function(WageSeekerBlocEvent) then) =
      _$WageSeekerBlocEventCopyWithImpl<$Res, WageSeekerBlocEvent>;
}

/// @nodoc
class _$WageSeekerBlocEventCopyWithImpl<$Res, $Val extends WageSeekerBlocEvent>
    implements $WageSeekerBlocEventCopyWith<$Res> {
  _$WageSeekerBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WageSeekerCreateEventCopyWith<$Res> {
  factory _$$WageSeekerCreateEventCopyWith(_$WageSeekerCreateEvent value,
          $Res Function(_$WageSeekerCreateEvent) then) =
      __$$WageSeekerCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails});
}

/// @nodoc
class __$$WageSeekerCreateEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res, _$WageSeekerCreateEvent>
    implements _$$WageSeekerCreateEventCopyWith<$Res> {
  __$$WageSeekerCreateEventCopyWithImpl(_$WageSeekerCreateEvent _value,
      $Res Function(_$WageSeekerCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualDetails = freezed,
    Object? skillDetails = freezed,
    Object? locationDetails = freezed,
    Object? financialDetails = freezed,
  }) {
    return _then(_$WageSeekerCreateEvent(
      individualDetails: freezed == individualDetails
          ? _value.individualDetails
          : individualDetails // ignore: cast_nullable_to_non_nullable
              as IndividualDetails?,
      skillDetails: freezed == skillDetails
          ? _value.skillDetails
          : skillDetails // ignore: cast_nullable_to_non_nullable
              as SkillDetails?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails?,
      financialDetails: freezed == financialDetails
          ? _value.financialDetails
          : financialDetails // ignore: cast_nullable_to_non_nullable
              as FinancialDetails?,
    ));
  }
}

/// @nodoc

class _$WageSeekerCreateEvent
    with DiagnosticableTreeMixin
    implements WageSeekerCreateEvent {
  const _$WageSeekerCreateEvent(
      {this.individualDetails,
      this.skillDetails,
      this.locationDetails,
      this.financialDetails});

  @override
  final IndividualDetails? individualDetails;
  @override
  final SkillDetails? skillDetails;
  @override
  final LocationDetails? locationDetails;
  @override
  final FinancialDetails? financialDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.create(individualDetails: $individualDetails, skillDetails: $skillDetails, locationDetails: $locationDetails, financialDetails: $financialDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocEvent.create'))
      ..add(DiagnosticsProperty('individualDetails', individualDetails))
      ..add(DiagnosticsProperty('skillDetails', skillDetails))
      ..add(DiagnosticsProperty('locationDetails', locationDetails))
      ..add(DiagnosticsProperty('financialDetails', financialDetails));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WageSeekerCreateEvent &&
            (identical(other.individualDetails, individualDetails) ||
                other.individualDetails == individualDetails) &&
            (identical(other.skillDetails, skillDetails) ||
                other.skillDetails == skillDetails) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.financialDetails, financialDetails) ||
                other.financialDetails == financialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualDetails, skillDetails,
      locationDetails, financialDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WageSeekerCreateEventCopyWith<_$WageSeekerCreateEvent> get copyWith =>
      __$$WageSeekerCreateEventCopyWithImpl<_$WageSeekerCreateEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return create(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return create?.call(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          individualDetails, skillDetails, locationDetails, financialDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class WageSeekerCreateEvent implements WageSeekerBlocEvent {
  const factory WageSeekerCreateEvent(
      {final IndividualDetails? individualDetails,
      final SkillDetails? skillDetails,
      final LocationDetails? locationDetails,
      final FinancialDetails? financialDetails}) = _$WageSeekerCreateEvent;

  IndividualDetails? get individualDetails;
  SkillDetails? get skillDetails;
  LocationDetails? get locationDetails;
  FinancialDetails? get financialDetails;
  @JsonKey(ignore: true)
  _$$WageSeekerCreateEventCopyWith<_$WageSeekerCreateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WageSeekerIdentificationCreateEventCopyWith<$Res> {
  factory _$$WageSeekerIdentificationCreateEventCopyWith(
          _$WageSeekerIdentificationCreateEvent value,
          $Res Function(_$WageSeekerIdentificationCreateEvent) then) =
      __$$WageSeekerIdentificationCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String documentType,
      String number,
      String name,
      bool adharVerified,
      int timeStamp,
      AdharCardResponse? adharCardResponse});

  $AdharCardResponseCopyWith<$Res>? get adharCardResponse;
}

/// @nodoc
class __$$WageSeekerIdentificationCreateEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res,
        _$WageSeekerIdentificationCreateEvent>
    implements _$$WageSeekerIdentificationCreateEventCopyWith<$Res> {
  __$$WageSeekerIdentificationCreateEventCopyWithImpl(
      _$WageSeekerIdentificationCreateEvent _value,
      $Res Function(_$WageSeekerIdentificationCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentType = null,
    Object? number = null,
    Object? name = null,
    Object? adharVerified = null,
    Object? timeStamp = null,
    Object? adharCardResponse = freezed,
  }) {
    return _then(_$WageSeekerIdentificationCreateEvent(
      documentType: null == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adharVerified: null == adharVerified
          ? _value.adharVerified
          : adharVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as int,
      adharCardResponse: freezed == adharCardResponse
          ? _value.adharCardResponse
          : adharCardResponse // ignore: cast_nullable_to_non_nullable
              as AdharCardResponse?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AdharCardResponseCopyWith<$Res>? get adharCardResponse {
    if (_value.adharCardResponse == null) {
      return null;
    }

    return $AdharCardResponseCopyWith<$Res>(_value.adharCardResponse!, (value) {
      return _then(_value.copyWith(adharCardResponse: value));
    });
  }
}

/// @nodoc

class _$WageSeekerIdentificationCreateEvent
    with DiagnosticableTreeMixin
    implements WageSeekerIdentificationCreateEvent {
  const _$WageSeekerIdentificationCreateEvent(
      {required this.documentType,
      required this.number,
      required this.name,
      required this.adharVerified,
      required this.timeStamp,
      this.adharCardResponse});

  @override
  final String documentType;
  @override
  final String number;
  @override
  final String name;
  @override
  final bool adharVerified;
  @override
  final int timeStamp;
  @override
  final AdharCardResponse? adharCardResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.identificationCreate(documentType: $documentType, number: $number, name: $name, adharVerified: $adharVerified, timeStamp: $timeStamp, adharCardResponse: $adharCardResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'WageSeekerBlocEvent.identificationCreate'))
      ..add(DiagnosticsProperty('documentType', documentType))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('adharVerified', adharVerified))
      ..add(DiagnosticsProperty('timeStamp', timeStamp))
      ..add(DiagnosticsProperty('adharCardResponse', adharCardResponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WageSeekerIdentificationCreateEvent &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adharVerified, adharVerified) ||
                other.adharVerified == adharVerified) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.adharCardResponse, adharCardResponse) ||
                other.adharCardResponse == adharCardResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentType, number, name,
      adharVerified, timeStamp, adharCardResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WageSeekerIdentificationCreateEventCopyWith<
          _$WageSeekerIdentificationCreateEvent>
      get copyWith => __$$WageSeekerIdentificationCreateEventCopyWithImpl<
          _$WageSeekerIdentificationCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return identificationCreate(documentType, number, name, adharVerified,
        timeStamp, adharCardResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return identificationCreate?.call(documentType, number, name, adharVerified,
        timeStamp, adharCardResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (identificationCreate != null) {
      return identificationCreate(documentType, number, name, adharVerified,
          timeStamp, adharCardResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return identificationCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return identificationCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (identificationCreate != null) {
      return identificationCreate(this);
    }
    return orElse();
  }
}

abstract class WageSeekerIdentificationCreateEvent
    implements WageSeekerBlocEvent {
  const factory WageSeekerIdentificationCreateEvent(
          {required final String documentType,
          required final String number,
          required final String name,
          required final bool adharVerified,
          required final int timeStamp,
          final AdharCardResponse? adharCardResponse}) =
      _$WageSeekerIdentificationCreateEvent;

  String get documentType;
  String get number;
  String get name;
  bool get adharVerified;
  int get timeStamp;
  AdharCardResponse? get adharCardResponse;
  @JsonKey(ignore: true)
  _$$WageSeekerIdentificationCreateEventCopyWith<
          _$WageSeekerIdentificationCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WageSeekerDetailsCreateEventCopyWith<$Res> {
  factory _$$WageSeekerDetailsCreateEventCopyWith(
          _$WageSeekerDetailsCreateEvent value,
          $Res Function(_$WageSeekerDetailsCreateEvent) then) =
      __$$WageSeekerDetailsCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String fatherName,
      DateTime dob,
      String relationShip,
      String gender,
      String socialCategory,
      String mobileNumber});
}

/// @nodoc
class __$$WageSeekerDetailsCreateEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res,
        _$WageSeekerDetailsCreateEvent>
    implements _$$WageSeekerDetailsCreateEventCopyWith<$Res> {
  __$$WageSeekerDetailsCreateEventCopyWithImpl(
      _$WageSeekerDetailsCreateEvent _value,
      $Res Function(_$WageSeekerDetailsCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fatherName = null,
    Object? dob = null,
    Object? relationShip = null,
    Object? gender = null,
    Object? socialCategory = null,
    Object? mobileNumber = null,
  }) {
    return _then(_$WageSeekerDetailsCreateEvent(
      fatherName: null == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      relationShip: null == relationShip
          ? _value.relationShip
          : relationShip // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      socialCategory: null == socialCategory
          ? _value.socialCategory
          : socialCategory // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WageSeekerDetailsCreateEvent
    with DiagnosticableTreeMixin
    implements WageSeekerDetailsCreateEvent {
  const _$WageSeekerDetailsCreateEvent(
      {required this.fatherName,
      required this.dob,
      required this.relationShip,
      required this.gender,
      required this.socialCategory,
      required this.mobileNumber});

  @override
  final String fatherName;
  @override
  final DateTime dob;
  @override
  final String relationShip;
  @override
  final String gender;
  @override
  final String socialCategory;
  @override
  final String mobileNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.detailsCreate(fatherName: $fatherName, dob: $dob, relationShip: $relationShip, gender: $gender, socialCategory: $socialCategory, mobileNumber: $mobileNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocEvent.detailsCreate'))
      ..add(DiagnosticsProperty('fatherName', fatherName))
      ..add(DiagnosticsProperty('dob', dob))
      ..add(DiagnosticsProperty('relationShip', relationShip))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('socialCategory', socialCategory))
      ..add(DiagnosticsProperty('mobileNumber', mobileNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WageSeekerDetailsCreateEvent &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.relationShip, relationShip) ||
                other.relationShip == relationShip) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.socialCategory, socialCategory) ||
                other.socialCategory == socialCategory) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fatherName, dob, relationShip,
      gender, socialCategory, mobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WageSeekerDetailsCreateEventCopyWith<_$WageSeekerDetailsCreateEvent>
      get copyWith => __$$WageSeekerDetailsCreateEventCopyWithImpl<
          _$WageSeekerDetailsCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return detailsCreate(
        fatherName, dob, relationShip, gender, socialCategory, mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return detailsCreate?.call(
        fatherName, dob, relationShip, gender, socialCategory, mobileNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (detailsCreate != null) {
      return detailsCreate(
          fatherName, dob, relationShip, gender, socialCategory, mobileNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return detailsCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return detailsCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (detailsCreate != null) {
      return detailsCreate(this);
    }
    return orElse();
  }
}

abstract class WageSeekerDetailsCreateEvent implements WageSeekerBlocEvent {
  const factory WageSeekerDetailsCreateEvent(
      {required final String fatherName,
      required final DateTime dob,
      required final String relationShip,
      required final String gender,
      required final String socialCategory,
      required final String mobileNumber}) = _$WageSeekerDetailsCreateEvent;

  String get fatherName;
  DateTime get dob;
  String get relationShip;
  String get gender;
  String get socialCategory;
  String get mobileNumber;
  @JsonKey(ignore: true)
  _$$WageSeekerDetailsCreateEventCopyWith<_$WageSeekerDetailsCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WageSeekerSkillCreateEventCopyWith<$Res> {
  factory _$$WageSeekerSkillCreateEventCopyWith(
          _$WageSeekerSkillCreateEvent value,
          $Res Function(_$WageSeekerSkillCreateEvent) then) =
      __$$WageSeekerSkillCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({SkillDetails skillDetails});
}

/// @nodoc
class __$$WageSeekerSkillCreateEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res,
        _$WageSeekerSkillCreateEvent>
    implements _$$WageSeekerSkillCreateEventCopyWith<$Res> {
  __$$WageSeekerSkillCreateEventCopyWithImpl(
      _$WageSeekerSkillCreateEvent _value,
      $Res Function(_$WageSeekerSkillCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillDetails = null,
  }) {
    return _then(_$WageSeekerSkillCreateEvent(
      skillDetails: null == skillDetails
          ? _value.skillDetails
          : skillDetails // ignore: cast_nullable_to_non_nullable
              as SkillDetails,
    ));
  }
}

/// @nodoc

class _$WageSeekerSkillCreateEvent
    with DiagnosticableTreeMixin
    implements WageSeekerSkillCreateEvent {
  const _$WageSeekerSkillCreateEvent({required this.skillDetails});

  @override
  final SkillDetails skillDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.skillCreate(skillDetails: $skillDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocEvent.skillCreate'))
      ..add(DiagnosticsProperty('skillDetails', skillDetails));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WageSeekerSkillCreateEvent &&
            (identical(other.skillDetails, skillDetails) ||
                other.skillDetails == skillDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skillDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WageSeekerSkillCreateEventCopyWith<_$WageSeekerSkillCreateEvent>
      get copyWith => __$$WageSeekerSkillCreateEventCopyWithImpl<
          _$WageSeekerSkillCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return skillCreate(skillDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return skillCreate?.call(skillDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (skillCreate != null) {
      return skillCreate(skillDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return skillCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return skillCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (skillCreate != null) {
      return skillCreate(this);
    }
    return orElse();
  }
}

abstract class WageSeekerSkillCreateEvent implements WageSeekerBlocEvent {
  const factory WageSeekerSkillCreateEvent(
          {required final SkillDetails skillDetails}) =
      _$WageSeekerSkillCreateEvent;

  SkillDetails get skillDetails;
  @JsonKey(ignore: true)
  _$$WageSeekerSkillCreateEventCopyWith<_$WageSeekerSkillCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WageSeekerPhotoCreateEventCopyWith<$Res> {
  factory _$$WageSeekerPhotoCreateEventCopyWith(
          _$WageSeekerPhotoCreateEvent value,
          $Res Function(_$WageSeekerPhotoCreateEvent) then) =
      __$$WageSeekerPhotoCreateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({File? imageFile, Uint8List? bytes, String? photo});
}

/// @nodoc
class __$$WageSeekerPhotoCreateEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res,
        _$WageSeekerPhotoCreateEvent>
    implements _$$WageSeekerPhotoCreateEventCopyWith<$Res> {
  __$$WageSeekerPhotoCreateEventCopyWithImpl(
      _$WageSeekerPhotoCreateEvent _value,
      $Res Function(_$WageSeekerPhotoCreateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFile = freezed,
    Object? bytes = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$WageSeekerPhotoCreateEvent(
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$WageSeekerPhotoCreateEvent
    with DiagnosticableTreeMixin
    implements WageSeekerPhotoCreateEvent {
  const _$WageSeekerPhotoCreateEvent({this.imageFile, this.bytes, this.photo});

  @override
  final File? imageFile;
  @override
  final Uint8List? bytes;
  @override
  final String? photo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.photoCreate(imageFile: $imageFile, bytes: $bytes, photo: $photo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocEvent.photoCreate'))
      ..add(DiagnosticsProperty('imageFile', imageFile))
      ..add(DiagnosticsProperty('bytes', bytes))
      ..add(DiagnosticsProperty('photo', photo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WageSeekerPhotoCreateEvent &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageFile,
      const DeepCollectionEquality().hash(bytes), photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WageSeekerPhotoCreateEventCopyWith<_$WageSeekerPhotoCreateEvent>
      get copyWith => __$$WageSeekerPhotoCreateEventCopyWithImpl<
          _$WageSeekerPhotoCreateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return photoCreate(imageFile, bytes, photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return photoCreate?.call(imageFile, bytes, photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (photoCreate != null) {
      return photoCreate(imageFile, bytes, photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return photoCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return photoCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (photoCreate != null) {
      return photoCreate(this);
    }
    return orElse();
  }
}

abstract class WageSeekerPhotoCreateEvent implements WageSeekerBlocEvent {
  const factory WageSeekerPhotoCreateEvent(
      {final File? imageFile,
      final Uint8List? bytes,
      final String? photo}) = _$WageSeekerPhotoCreateEvent;

  File? get imageFile;
  Uint8List? get bytes;
  String? get photo;
  @JsonKey(ignore: true)
  _$$WageSeekerPhotoCreateEventCopyWith<_$WageSeekerPhotoCreateEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WageSeekerClearEventCopyWith<$Res> {
  factory _$$WageSeekerClearEventCopyWith(_$WageSeekerClearEvent value,
          $Res Function(_$WageSeekerClearEvent) then) =
      __$$WageSeekerClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WageSeekerClearEventCopyWithImpl<$Res>
    extends _$WageSeekerBlocEventCopyWithImpl<$Res, _$WageSeekerClearEvent>
    implements _$$WageSeekerClearEventCopyWith<$Res> {
  __$$WageSeekerClearEventCopyWithImpl(_$WageSeekerClearEvent _value,
      $Res Function(_$WageSeekerClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WageSeekerClearEvent
    with DiagnosticableTreeMixin
    implements WageSeekerClearEvent {
  const _$WageSeekerClearEvent();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocEvent.clear()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'WageSeekerBlocEvent.clear'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WageSeekerClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)
        identificationCreate,
    required TResult Function(
            String fatherName,
            DateTime dob,
            String relationShip,
            String gender,
            String socialCategory,
            String mobileNumber)
        detailsCreate,
    required TResult Function(SkillDetails skillDetails) skillCreate,
    required TResult Function(File? imageFile, Uint8List? bytes, String? photo)
        photoCreate,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult? Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult? Function(SkillDetails skillDetails)? skillCreate,
    TResult? Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            String documentType,
            String number,
            String name,
            bool adharVerified,
            int timeStamp,
            AdharCardResponse? adharCardResponse)?
        identificationCreate,
    TResult Function(String fatherName, DateTime dob, String relationShip,
            String gender, String socialCategory, String mobileNumber)?
        detailsCreate,
    TResult Function(SkillDetails skillDetails)? skillCreate,
    TResult Function(File? imageFile, Uint8List? bytes, String? photo)?
        photoCreate,
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
    required TResult Function(WageSeekerCreateEvent value) create,
    required TResult Function(WageSeekerIdentificationCreateEvent value)
        identificationCreate,
    required TResult Function(WageSeekerDetailsCreateEvent value) detailsCreate,
    required TResult Function(WageSeekerSkillCreateEvent value) skillCreate,
    required TResult Function(WageSeekerPhotoCreateEvent value) photoCreate,
    required TResult Function(WageSeekerClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WageSeekerCreateEvent value)? create,
    TResult? Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult? Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult? Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult? Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult? Function(WageSeekerClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WageSeekerCreateEvent value)? create,
    TResult Function(WageSeekerIdentificationCreateEvent value)?
        identificationCreate,
    TResult Function(WageSeekerDetailsCreateEvent value)? detailsCreate,
    TResult Function(WageSeekerSkillCreateEvent value)? skillCreate,
    TResult Function(WageSeekerPhotoCreateEvent value)? photoCreate,
    TResult Function(WageSeekerClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class WageSeekerClearEvent implements WageSeekerBlocEvent {
  const factory WageSeekerClearEvent() = _$WageSeekerClearEvent;
}

/// @nodoc
mixin _$WageSeekerBlocState {
  IndividualDetails? get individualDetails =>
      throw _privateConstructorUsedError;
  SkillDetails? get skillDetails => throw _privateConstructorUsedError;
  LocationDetails? get locationDetails => throw _privateConstructorUsedError;
  FinancialDetails? get financialDetails => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateWageSeeker value) create,
    required TResult Function(_EditWageSeeker value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateWageSeeker value)? create,
    TResult? Function(_EditWageSeeker value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateWageSeeker value)? create,
    TResult Function(_EditWageSeeker value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WageSeekerBlocStateCopyWith<WageSeekerBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WageSeekerBlocStateCopyWith<$Res> {
  factory $WageSeekerBlocStateCopyWith(
          WageSeekerBlocState value, $Res Function(WageSeekerBlocState) then) =
      _$WageSeekerBlocStateCopyWithImpl<$Res, WageSeekerBlocState>;
  @useResult
  $Res call(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails});
}

/// @nodoc
class _$WageSeekerBlocStateCopyWithImpl<$Res, $Val extends WageSeekerBlocState>
    implements $WageSeekerBlocStateCopyWith<$Res> {
  _$WageSeekerBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualDetails = freezed,
    Object? skillDetails = freezed,
    Object? locationDetails = freezed,
    Object? financialDetails = freezed,
  }) {
    return _then(_value.copyWith(
      individualDetails: freezed == individualDetails
          ? _value.individualDetails
          : individualDetails // ignore: cast_nullable_to_non_nullable
              as IndividualDetails?,
      skillDetails: freezed == skillDetails
          ? _value.skillDetails
          : skillDetails // ignore: cast_nullable_to_non_nullable
              as SkillDetails?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails?,
      financialDetails: freezed == financialDetails
          ? _value.financialDetails
          : financialDetails // ignore: cast_nullable_to_non_nullable
              as FinancialDetails?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateWageSeekerCopyWith<$Res>
    implements $WageSeekerBlocStateCopyWith<$Res> {
  factory _$$_CreateWageSeekerCopyWith(
          _$_CreateWageSeeker value, $Res Function(_$_CreateWageSeeker) then) =
      __$$_CreateWageSeekerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails});
}

/// @nodoc
class __$$_CreateWageSeekerCopyWithImpl<$Res>
    extends _$WageSeekerBlocStateCopyWithImpl<$Res, _$_CreateWageSeeker>
    implements _$$_CreateWageSeekerCopyWith<$Res> {
  __$$_CreateWageSeekerCopyWithImpl(
      _$_CreateWageSeeker _value, $Res Function(_$_CreateWageSeeker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualDetails = freezed,
    Object? skillDetails = freezed,
    Object? locationDetails = freezed,
    Object? financialDetails = freezed,
  }) {
    return _then(_$_CreateWageSeeker(
      individualDetails: freezed == individualDetails
          ? _value.individualDetails
          : individualDetails // ignore: cast_nullable_to_non_nullable
              as IndividualDetails?,
      skillDetails: freezed == skillDetails
          ? _value.skillDetails
          : skillDetails // ignore: cast_nullable_to_non_nullable
              as SkillDetails?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails?,
      financialDetails: freezed == financialDetails
          ? _value.financialDetails
          : financialDetails // ignore: cast_nullable_to_non_nullable
              as FinancialDetails?,
    ));
  }
}

/// @nodoc

class _$_CreateWageSeeker extends _CreateWageSeeker
    with DiagnosticableTreeMixin {
  const _$_CreateWageSeeker(
      {this.individualDetails,
      this.skillDetails,
      this.locationDetails,
      this.financialDetails})
      : super._();

  @override
  final IndividualDetails? individualDetails;
  @override
  final SkillDetails? skillDetails;
  @override
  final LocationDetails? locationDetails;
  @override
  final FinancialDetails? financialDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocState.create(individualDetails: $individualDetails, skillDetails: $skillDetails, locationDetails: $locationDetails, financialDetails: $financialDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocState.create'))
      ..add(DiagnosticsProperty('individualDetails', individualDetails))
      ..add(DiagnosticsProperty('skillDetails', skillDetails))
      ..add(DiagnosticsProperty('locationDetails', locationDetails))
      ..add(DiagnosticsProperty('financialDetails', financialDetails));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateWageSeeker &&
            (identical(other.individualDetails, individualDetails) ||
                other.individualDetails == individualDetails) &&
            (identical(other.skillDetails, skillDetails) ||
                other.skillDetails == skillDetails) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.financialDetails, financialDetails) ||
                other.financialDetails == financialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualDetails, skillDetails,
      locationDetails, financialDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateWageSeekerCopyWith<_$_CreateWageSeeker> get copyWith =>
      __$$_CreateWageSeekerCopyWithImpl<_$_CreateWageSeeker>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        clear,
  }) {
    return create(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
  }) {
    return create?.call(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          individualDetails, skillDetails, locationDetails, financialDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateWageSeeker value) create,
    required TResult Function(_EditWageSeeker value) clear,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateWageSeeker value)? create,
    TResult? Function(_EditWageSeeker value)? clear,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateWageSeeker value)? create,
    TResult Function(_EditWageSeeker value)? clear,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _CreateWageSeeker extends WageSeekerBlocState {
  const factory _CreateWageSeeker(
      {final IndividualDetails? individualDetails,
      final SkillDetails? skillDetails,
      final LocationDetails? locationDetails,
      final FinancialDetails? financialDetails}) = _$_CreateWageSeeker;
  const _CreateWageSeeker._() : super._();

  @override
  IndividualDetails? get individualDetails;
  @override
  SkillDetails? get skillDetails;
  @override
  LocationDetails? get locationDetails;
  @override
  FinancialDetails? get financialDetails;
  @override
  @JsonKey(ignore: true)
  _$$_CreateWageSeekerCopyWith<_$_CreateWageSeeker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditWageSeekerCopyWith<$Res>
    implements $WageSeekerBlocStateCopyWith<$Res> {
  factory _$$_EditWageSeekerCopyWith(
          _$_EditWageSeeker value, $Res Function(_$_EditWageSeeker) then) =
      __$$_EditWageSeekerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {IndividualDetails? individualDetails,
      SkillDetails? skillDetails,
      LocationDetails? locationDetails,
      FinancialDetails? financialDetails});
}

/// @nodoc
class __$$_EditWageSeekerCopyWithImpl<$Res>
    extends _$WageSeekerBlocStateCopyWithImpl<$Res, _$_EditWageSeeker>
    implements _$$_EditWageSeekerCopyWith<$Res> {
  __$$_EditWageSeekerCopyWithImpl(
      _$_EditWageSeeker _value, $Res Function(_$_EditWageSeeker) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? individualDetails = freezed,
    Object? skillDetails = freezed,
    Object? locationDetails = freezed,
    Object? financialDetails = freezed,
  }) {
    return _then(_$_EditWageSeeker(
      individualDetails: freezed == individualDetails
          ? _value.individualDetails
          : individualDetails // ignore: cast_nullable_to_non_nullable
              as IndividualDetails?,
      skillDetails: freezed == skillDetails
          ? _value.skillDetails
          : skillDetails // ignore: cast_nullable_to_non_nullable
              as SkillDetails?,
      locationDetails: freezed == locationDetails
          ? _value.locationDetails
          : locationDetails // ignore: cast_nullable_to_non_nullable
              as LocationDetails?,
      financialDetails: freezed == financialDetails
          ? _value.financialDetails
          : financialDetails // ignore: cast_nullable_to_non_nullable
              as FinancialDetails?,
    ));
  }
}

/// @nodoc

class _$_EditWageSeeker extends _EditWageSeeker with DiagnosticableTreeMixin {
  const _$_EditWageSeeker(
      {this.individualDetails,
      this.skillDetails,
      this.locationDetails,
      this.financialDetails})
      : super._();

  @override
  final IndividualDetails? individualDetails;
  @override
  final SkillDetails? skillDetails;
  @override
  final LocationDetails? locationDetails;
  @override
  final FinancialDetails? financialDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WageSeekerBlocState.clear(individualDetails: $individualDetails, skillDetails: $skillDetails, locationDetails: $locationDetails, financialDetails: $financialDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WageSeekerBlocState.clear'))
      ..add(DiagnosticsProperty('individualDetails', individualDetails))
      ..add(DiagnosticsProperty('skillDetails', skillDetails))
      ..add(DiagnosticsProperty('locationDetails', locationDetails))
      ..add(DiagnosticsProperty('financialDetails', financialDetails));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditWageSeeker &&
            (identical(other.individualDetails, individualDetails) ||
                other.individualDetails == individualDetails) &&
            (identical(other.skillDetails, skillDetails) ||
                other.skillDetails == skillDetails) &&
            (identical(other.locationDetails, locationDetails) ||
                other.locationDetails == locationDetails) &&
            (identical(other.financialDetails, financialDetails) ||
                other.financialDetails == financialDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, individualDetails, skillDetails,
      locationDetails, financialDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditWageSeekerCopyWith<_$_EditWageSeeker> get copyWith =>
      __$$_EditWageSeekerCopyWithImpl<_$_EditWageSeeker>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        create,
    required TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)
        clear,
  }) {
    return clear(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult? Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
  }) {
    return clear?.call(
        individualDetails, skillDetails, locationDetails, financialDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        create,
    TResult Function(
            IndividualDetails? individualDetails,
            SkillDetails? skillDetails,
            LocationDetails? locationDetails,
            FinancialDetails? financialDetails)?
        clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(
          individualDetails, skillDetails, locationDetails, financialDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateWageSeeker value) create,
    required TResult Function(_EditWageSeeker value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateWageSeeker value)? create,
    TResult? Function(_EditWageSeeker value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateWageSeeker value)? create,
    TResult Function(_EditWageSeeker value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _EditWageSeeker extends WageSeekerBlocState {
  const factory _EditWageSeeker(
      {final IndividualDetails? individualDetails,
      final SkillDetails? skillDetails,
      final LocationDetails? locationDetails,
      final FinancialDetails? financialDetails}) = _$_EditWageSeeker;
  const _EditWageSeeker._() : super._();

  @override
  IndividualDetails? get individualDetails;
  @override
  SkillDetails? get skillDetails;
  @override
  LocationDetails? get locationDetails;
  @override
  FinancialDetails? get financialDetails;
  @override
  @JsonKey(ignore: true)
  _$$_EditWageSeekerCopyWith<_$_EditWageSeeker> get copyWith =>
      throw _privateConstructorUsedError;
}

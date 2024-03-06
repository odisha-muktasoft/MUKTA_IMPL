// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalizationEvent {
  String get module => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)
        onLoadLocalization,
    required TResult Function(String module, String tenantId, String locale)
        onSpecificLoadLocalization,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult? Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnSpecificLoadLocalizationEvent value)
        onSpecificLoadLocalization,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationEventCopyWith<LocalizationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationEventCopyWith<$Res> {
  factory $LocalizationEventCopyWith(
          LocalizationEvent value, $Res Function(LocalizationEvent) then) =
      _$LocalizationEventCopyWithImpl<$Res, LocalizationEvent>;
  @useResult
  $Res call({String module, String tenantId, String locale});
}

/// @nodoc
class _$LocalizationEventCopyWithImpl<$Res, $Val extends LocalizationEvent>
    implements $LocalizationEventCopyWith<$Res> {
  _$LocalizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? tenantId = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnLoadLocalizationEventCopyWith<$Res>
    implements $LocalizationEventCopyWith<$Res> {
  factory _$$OnLoadLocalizationEventCopyWith(_$OnLoadLocalizationEvent value,
          $Res Function(_$OnLoadLocalizationEvent) then) =
      __$$OnLoadLocalizationEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String module,
      String tenantId,
      String locale,
      List<Languages>? languages,
      List<LocalizationModules>? localizationModules});
}

/// @nodoc
class __$$OnLoadLocalizationEventCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$OnLoadLocalizationEvent>
    implements _$$OnLoadLocalizationEventCopyWith<$Res> {
  __$$OnLoadLocalizationEventCopyWithImpl(_$OnLoadLocalizationEvent _value,
      $Res Function(_$OnLoadLocalizationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? tenantId = null,
    Object? locale = null,
    Object? languages = freezed,
    Object? localizationModules = freezed,
  }) {
    return _then(_$OnLoadLocalizationEvent(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>?,
      localizationModules: freezed == localizationModules
          ? _value._localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<LocalizationModules>?,
    ));
  }
}

/// @nodoc

class _$OnLoadLocalizationEvent
    with DiagnosticableTreeMixin
    implements OnLoadLocalizationEvent {
  const _$OnLoadLocalizationEvent(
      {required this.module,
      required this.tenantId,
      required this.locale,
      final List<Languages>? languages,
      final List<LocalizationModules>? localizationModules})
      : _languages = languages,
        _localizationModules = localizationModules;

  @override
  final String module;
  @override
  final String tenantId;
  @override
  final String locale;
  final List<Languages>? _languages;
  @override
  List<Languages>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LocalizationModules>? _localizationModules;
  @override
  List<LocalizationModules>? get localizationModules {
    final value = _localizationModules;
    if (value == null) return null;
    if (_localizationModules is EqualUnmodifiableListView)
      return _localizationModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationEvent.onLoadLocalization(module: $module, tenantId: $tenantId, locale: $locale, languages: $languages, localizationModules: $localizationModules)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalizationEvent.onLoadLocalization'))
      ..add(DiagnosticsProperty('module', module))
      ..add(DiagnosticsProperty('tenantId', tenantId))
      ..add(DiagnosticsProperty('locale', locale))
      ..add(DiagnosticsProperty('languages', languages))
      ..add(DiagnosticsProperty('localizationModules', localizationModules));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadLocalizationEvent &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._localizationModules, _localizationModules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      module,
      tenantId,
      locale,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_localizationModules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadLocalizationEventCopyWith<_$OnLoadLocalizationEvent> get copyWith =>
      __$$OnLoadLocalizationEventCopyWithImpl<_$OnLoadLocalizationEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)
        onLoadLocalization,
    required TResult Function(String module, String tenantId, String locale)
        onSpecificLoadLocalization,
  }) {
    return onLoadLocalization(
        module, tenantId, locale, languages, localizationModules);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult? Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
  }) {
    return onLoadLocalization?.call(
        module, tenantId, locale, languages, localizationModules);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) {
    if (onLoadLocalization != null) {
      return onLoadLocalization(
          module, tenantId, locale, languages, localizationModules);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnSpecificLoadLocalizationEvent value)
        onSpecificLoadLocalization,
  }) {
    return onLoadLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
  }) {
    return onLoadLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) {
    if (onLoadLocalization != null) {
      return onLoadLocalization(this);
    }
    return orElse();
  }
}

abstract class OnLoadLocalizationEvent implements LocalizationEvent {
  const factory OnLoadLocalizationEvent(
          {required final String module,
          required final String tenantId,
          required final String locale,
          final List<Languages>? languages,
          final List<LocalizationModules>? localizationModules}) =
      _$OnLoadLocalizationEvent;

  @override
  String get module;
  @override
  String get tenantId;
  @override
  String get locale;
  List<Languages>? get languages;
  List<LocalizationModules>? get localizationModules;
  @override
  @JsonKey(ignore: true)
  _$$OnLoadLocalizationEventCopyWith<_$OnLoadLocalizationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSpecificLoadLocalizationEventCopyWith<$Res>
    implements $LocalizationEventCopyWith<$Res> {
  factory _$$OnSpecificLoadLocalizationEventCopyWith(
          _$OnSpecificLoadLocalizationEvent value,
          $Res Function(_$OnSpecificLoadLocalizationEvent) then) =
      __$$OnSpecificLoadLocalizationEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String module, String tenantId, String locale});
}

/// @nodoc
class __$$OnSpecificLoadLocalizationEventCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res,
        _$OnSpecificLoadLocalizationEvent>
    implements _$$OnSpecificLoadLocalizationEventCopyWith<$Res> {
  __$$OnSpecificLoadLocalizationEventCopyWithImpl(
      _$OnSpecificLoadLocalizationEvent _value,
      $Res Function(_$OnSpecificLoadLocalizationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? tenantId = null,
    Object? locale = null,
  }) {
    return _then(_$OnSpecificLoadLocalizationEvent(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnSpecificLoadLocalizationEvent
    with DiagnosticableTreeMixin
    implements OnSpecificLoadLocalizationEvent {
  const _$OnSpecificLoadLocalizationEvent(
      {required this.module, required this.tenantId, required this.locale});

  @override
  final String module;
  @override
  final String tenantId;
  @override
  final String locale;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationEvent.onSpecificLoadLocalization(module: $module, tenantId: $tenantId, locale: $locale)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'LocalizationEvent.onSpecificLoadLocalization'))
      ..add(DiagnosticsProperty('module', module))
      ..add(DiagnosticsProperty('tenantId', tenantId))
      ..add(DiagnosticsProperty('locale', locale));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSpecificLoadLocalizationEvent &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, module, tenantId, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSpecificLoadLocalizationEventCopyWith<_$OnSpecificLoadLocalizationEvent>
      get copyWith => __$$OnSpecificLoadLocalizationEventCopyWithImpl<
          _$OnSpecificLoadLocalizationEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)
        onLoadLocalization,
    required TResult Function(String module, String tenantId, String locale)
        onSpecificLoadLocalization,
  }) {
    return onSpecificLoadLocalization(module, tenantId, locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult? Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
  }) {
    return onSpecificLoadLocalization?.call(module, tenantId, locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String module,
            String tenantId,
            String locale,
            List<Languages>? languages,
            List<LocalizationModules>? localizationModules)?
        onLoadLocalization,
    TResult Function(String module, String tenantId, String locale)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) {
    if (onSpecificLoadLocalization != null) {
      return onSpecificLoadLocalization(module, tenantId, locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadLocalizationEvent value) onLoadLocalization,
    required TResult Function(OnSpecificLoadLocalizationEvent value)
        onSpecificLoadLocalization,
  }) {
    return onSpecificLoadLocalization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult? Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
  }) {
    return onSpecificLoadLocalization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadLocalizationEvent value)? onLoadLocalization,
    TResult Function(OnSpecificLoadLocalizationEvent value)?
        onSpecificLoadLocalization,
    required TResult orElse(),
  }) {
    if (onSpecificLoadLocalization != null) {
      return onSpecificLoadLocalization(this);
    }
    return orElse();
  }
}

abstract class OnSpecificLoadLocalizationEvent implements LocalizationEvent {
  const factory OnSpecificLoadLocalizationEvent(
      {required final String module,
      required final String tenantId,
      required final String locale}) = _$OnSpecificLoadLocalizationEvent;

  @override
  String get module;
  @override
  String get tenantId;
  @override
  String get locale;
  @override
  @JsonKey(ignore: true)
  _$$OnSpecificLoadLocalizationEventCopyWith<_$OnSpecificLoadLocalizationEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)
        loaded,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
        loaded,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

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
    extends _$LocalizationStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial with DiagnosticableTreeMixin {
  const _$_Initial() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LocalizationState.initial'));
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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

abstract class _Initial extends LocalizationState {
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
    extends _$LocalizationStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading extends _Loading with DiagnosticableTreeMixin {
  const _$_Loading() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LocalizationState.loading'));
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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

abstract class _Loading extends LocalizationState {
  const factory _Loading() = _$_Loading;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Languages>? languages, List<ModuleStatus>? moduleStatus});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = freezed,
    Object? moduleStatus = freezed,
  }) {
    return _then(_$_Loaded(
      freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Languages>?,
      freezed == moduleStatus
          ? _value._moduleStatus
          : moduleStatus // ignore: cast_nullable_to_non_nullable
              as List<ModuleStatus>?,
    ));
  }
}

/// @nodoc

class _$_Loaded extends _Loaded with DiagnosticableTreeMixin {
  _$_Loaded(
      final List<Languages>? languages, final List<ModuleStatus>? moduleStatus)
      : _languages = languages,
        _moduleStatus = moduleStatus,
        super._();

  final List<Languages>? _languages;
  @override
  List<Languages>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ModuleStatus>? _moduleStatus;
  @override
  List<ModuleStatus>? get moduleStatus {
    final value = _moduleStatus;
    if (value == null) return null;
    if (_moduleStatus is EqualUnmodifiableListView) return _moduleStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationState.loaded(languages: $languages, moduleStatus: $moduleStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalizationState.loaded'))
      ..add(DiagnosticsProperty('languages', languages))
      ..add(DiagnosticsProperty('moduleStatus', moduleStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._moduleStatus, _moduleStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_moduleStatus));

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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)
        loaded,
    required TResult Function(String? error) error,
  }) {
    return loaded(languages, moduleStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
        loaded,
    TResult? Function(String? error)? error,
  }) {
    return loaded?.call(languages, moduleStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
        loaded,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(languages, moduleStatus);
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

abstract class _Loaded extends LocalizationState {
  factory _Loaded(final List<Languages>? languages,
      final List<ModuleStatus>? moduleStatus) = _$_Loaded;
  _Loaded._() : super._();

  List<Languages>? get languages;
  List<ModuleStatus>? get moduleStatus;
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
    extends _$LocalizationStateCopyWithImpl<$Res, _$_Error>
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

class _$_Error extends _Error with DiagnosticableTreeMixin {
  const _$_Error(this.error) : super._();

  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalizationState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalizationState.error'))
      ..add(DiagnosticsProperty('error', error));
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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
            List<Languages>? languages, List<ModuleStatus>? moduleStatus)?
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

abstract class _Error extends LocalizationState {
  const factory _Error(final String? error) = _$_Error;
  const _Error._() : super._();

  String? get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

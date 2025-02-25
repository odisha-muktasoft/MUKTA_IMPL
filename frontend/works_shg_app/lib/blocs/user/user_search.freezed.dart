// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUserEvent value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUserEvent value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUserEvent value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchEventCopyWith<$Res> {
  factory $UserSearchEventCopyWith(
          UserSearchEvent value, $Res Function(UserSearchEvent) then) =
      _$UserSearchEventCopyWithImpl<$Res, UserSearchEvent>;
}

/// @nodoc
class _$UserSearchEventCopyWithImpl<$Res, $Val extends UserSearchEvent>
    implements $UserSearchEventCopyWith<$Res> {
  _$UserSearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchUserEventImplCopyWith<$Res> {
  factory _$$SearchUserEventImplCopyWith(_$SearchUserEventImpl value,
          $Res Function(_$SearchUserEventImpl) then) =
      __$$SearchUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SearchUserEventImplCopyWithImpl<$Res>
    extends _$UserSearchEventCopyWithImpl<$Res, _$SearchUserEventImpl>
    implements _$$SearchUserEventImplCopyWith<$Res> {
  __$$SearchUserEventImplCopyWithImpl(
      _$SearchUserEventImpl _value, $Res Function(_$SearchUserEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SearchUserEventImpl
    with DiagnosticableTreeMixin
    implements SearchUserEvent {
  const _$SearchUserEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSearchEvent.search()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserSearchEvent.search'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SearchUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() search,
  }) {
    return search();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? search,
  }) {
    return search?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchUserEvent value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchUserEvent value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchUserEvent value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class SearchUserEvent implements UserSearchEvent {
  const factory SearchUserEvent() = _$SearchUserEventImpl;
}

/// @nodoc
mixin _$UserSearchState {
  bool get loading => throw _privateConstructorUsedError;
  UserSearchModel? get userSearchModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSearchStateCopyWith<UserSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchStateCopyWith<$Res> {
  factory $UserSearchStateCopyWith(
          UserSearchState value, $Res Function(UserSearchState) then) =
      _$UserSearchStateCopyWithImpl<$Res, UserSearchState>;
  @useResult
  $Res call({bool loading, UserSearchModel? userSearchModel});

  $UserSearchModelCopyWith<$Res>? get userSearchModel;
}

/// @nodoc
class _$UserSearchStateCopyWithImpl<$Res, $Val extends UserSearchState>
    implements $UserSearchStateCopyWith<$Res> {
  _$UserSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? userSearchModel = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      userSearchModel: freezed == userSearchModel
          ? _value.userSearchModel
          : userSearchModel // ignore: cast_nullable_to_non_nullable
              as UserSearchModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSearchModelCopyWith<$Res>? get userSearchModel {
    if (_value.userSearchModel == null) {
      return null;
    }

    return $UserSearchModelCopyWith<$Res>(_value.userSearchModel!, (value) {
      return _then(_value.copyWith(userSearchModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSearchStateImplCopyWith<$Res>
    implements $UserSearchStateCopyWith<$Res> {
  factory _$$UserSearchStateImplCopyWith(_$UserSearchStateImpl value,
          $Res Function(_$UserSearchStateImpl) then) =
      __$$UserSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, UserSearchModel? userSearchModel});

  @override
  $UserSearchModelCopyWith<$Res>? get userSearchModel;
}

/// @nodoc
class __$$UserSearchStateImplCopyWithImpl<$Res>
    extends _$UserSearchStateCopyWithImpl<$Res, _$UserSearchStateImpl>
    implements _$$UserSearchStateImplCopyWith<$Res> {
  __$$UserSearchStateImplCopyWithImpl(
      _$UserSearchStateImpl _value, $Res Function(_$UserSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? userSearchModel = freezed,
  }) {
    return _then(_$UserSearchStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      userSearchModel: freezed == userSearchModel
          ? _value.userSearchModel
          : userSearchModel // ignore: cast_nullable_to_non_nullable
              as UserSearchModel?,
    ));
  }
}

/// @nodoc

class _$UserSearchStateImpl extends _UserSearchState
    with DiagnosticableTreeMixin {
  const _$UserSearchStateImpl({this.loading = false, this.userSearchModel})
      : super._();

  @override
  @JsonKey()
  final bool loading;
  @override
  final UserSearchModel? userSearchModel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSearchState(loading: $loading, userSearchModel: $userSearchModel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSearchState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('userSearchModel', userSearchModel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.userSearchModel, userSearchModel) ||
                other.userSearchModel == userSearchModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, userSearchModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchStateImplCopyWith<_$UserSearchStateImpl> get copyWith =>
      __$$UserSearchStateImplCopyWithImpl<_$UserSearchStateImpl>(
          this, _$identity);
}

abstract class _UserSearchState extends UserSearchState {
  const factory _UserSearchState(
      {final bool loading,
      final UserSearchModel? userSearchModel}) = _$UserSearchStateImpl;
  const _UserSearchState._() : super._();

  @override
  bool get loading;
  @override
  UserSearchModel? get userSearchModel;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchStateImplCopyWith<_$UserSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

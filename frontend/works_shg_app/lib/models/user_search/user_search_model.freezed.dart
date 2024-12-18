// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSearchModel _$UserSearchModelFromJson(Map<String, dynamic> json) {
  return _UserSearchModel.fromJson(json);
}

/// @nodoc
mixin _$UserSearchModel {
  @JsonKey(name: 'user')
  List<UserRequestModel>? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSearchModelCopyWith<UserSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSearchModelCopyWith<$Res> {
  factory $UserSearchModelCopyWith(
          UserSearchModel value, $Res Function(UserSearchModel) then) =
      _$UserSearchModelCopyWithImpl<$Res, UserSearchModel>;
  @useResult
  $Res call({@JsonKey(name: 'user') List<UserRequestModel>? user});
}

/// @nodoc
class _$UserSearchModelCopyWithImpl<$Res, $Val extends UserSearchModel>
    implements $UserSearchModelCopyWith<$Res> {
  _$UserSearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserRequestModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSearchModelImplCopyWith<$Res>
    implements $UserSearchModelCopyWith<$Res> {
  factory _$$UserSearchModelImplCopyWith(_$UserSearchModelImpl value,
          $Res Function(_$UserSearchModelImpl) then) =
      __$$UserSearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'user') List<UserRequestModel>? user});
}

/// @nodoc
class __$$UserSearchModelImplCopyWithImpl<$Res>
    extends _$UserSearchModelCopyWithImpl<$Res, _$UserSearchModelImpl>
    implements _$$UserSearchModelImplCopyWith<$Res> {
  __$$UserSearchModelImplCopyWithImpl(
      _$UserSearchModelImpl _value, $Res Function(_$UserSearchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserSearchModelImpl(
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as List<UserRequestModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSearchModelImpl implements _UserSearchModel {
  const _$UserSearchModelImpl(
      {@JsonKey(name: 'user') final List<UserRequestModel>? user})
      : _user = user;

  factory _$UserSearchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSearchModelImplFromJson(json);

  final List<UserRequestModel>? _user;
  @override
  @JsonKey(name: 'user')
  List<UserRequestModel>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableListView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserSearchModel(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSearchModelImpl &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSearchModelImplCopyWith<_$UserSearchModelImpl> get copyWith =>
      __$$UserSearchModelImplCopyWithImpl<_$UserSearchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSearchModelImplToJson(
      this,
    );
  }
}

abstract class _UserSearchModel implements UserSearchModel {
  const factory _UserSearchModel(
          {@JsonKey(name: 'user') final List<UserRequestModel>? user}) =
      _$UserSearchModelImpl;

  factory _UserSearchModel.fromJson(Map<String, dynamic> json) =
      _$UserSearchModelImpl.fromJson;

  @override
  @JsonKey(name: 'user')
  List<UserRequestModel>? get user;
  @override
  @JsonKey(ignore: true)
  _$$UserSearchModelImplCopyWith<_$UserSearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

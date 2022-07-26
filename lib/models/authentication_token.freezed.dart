// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticationToken _$AuthenticationTokenFromJson(Map<String, dynamic> json) {
  return _AuthenticationToken.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationToken {
  int get userId => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationTokenCopyWith<AuthenticationToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationTokenCopyWith<$Res> {
  factory $AuthenticationTokenCopyWith(
          AuthenticationToken value, $Res Function(AuthenticationToken) then) =
      _$AuthenticationTokenCopyWithImpl<$Res>;
  $Res call({int userId, String token});
}

/// @nodoc
class _$AuthenticationTokenCopyWithImpl<$Res>
    implements $AuthenticationTokenCopyWith<$Res> {
  _$AuthenticationTokenCopyWithImpl(this._value, this._then);

  final AuthenticationToken _value;
  // ignore: unused_field
  final $Res Function(AuthenticationToken) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthenticationTokenCopyWith<$Res>
    implements $AuthenticationTokenCopyWith<$Res> {
  factory _$$_AuthenticationTokenCopyWith(_$_AuthenticationToken value,
          $Res Function(_$_AuthenticationToken) then) =
      __$$_AuthenticationTokenCopyWithImpl<$Res>;
  @override
  $Res call({int userId, String token});
}

/// @nodoc
class __$$_AuthenticationTokenCopyWithImpl<$Res>
    extends _$AuthenticationTokenCopyWithImpl<$Res>
    implements _$$_AuthenticationTokenCopyWith<$Res> {
  __$$_AuthenticationTokenCopyWithImpl(_$_AuthenticationToken _value,
      $Res Function(_$_AuthenticationToken) _then)
      : super(_value, (v) => _then(v as _$_AuthenticationToken));

  @override
  _$_AuthenticationToken get _value => super._value as _$_AuthenticationToken;

  @override
  $Res call({
    Object? userId = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_AuthenticationToken(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticationToken implements _AuthenticationToken {
  _$_AuthenticationToken({required this.userId, required this.token});

  factory _$_AuthenticationToken.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticationTokenFromJson(json);

  @override
  final int userId;
  @override
  final String token;

  @override
  String toString() {
    return 'AuthenticationToken(userId: $userId, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationToken &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$$_AuthenticationTokenCopyWith<_$_AuthenticationToken> get copyWith =>
      __$$_AuthenticationTokenCopyWithImpl<_$_AuthenticationToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticationTokenToJson(
      this,
    );
  }
}

abstract class _AuthenticationToken implements AuthenticationToken {
  factory _AuthenticationToken(
      {required final int userId,
      required final String token}) = _$_AuthenticationToken;

  factory _AuthenticationToken.fromJson(Map<String, dynamic> json) =
      _$_AuthenticationToken.fromJson;

  @override
  int get userId;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationTokenCopyWith<_$_AuthenticationToken> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bottler.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bottler _$BottlerFromJson(Map<String, dynamic> json) {
  return _Bottler.fromJson(json);
}

/// @nodoc
mixin _$Bottler {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BottlerCopyWith<Bottler> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottlerCopyWith<$Res> {
  factory $BottlerCopyWith(Bottler value, $Res Function(Bottler) then) =
      _$BottlerCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$BottlerCopyWithImpl<$Res> implements $BottlerCopyWith<$Res> {
  _$BottlerCopyWithImpl(this._value, this._then);

  final Bottler _value;
  // ignore: unused_field
  final $Res Function(Bottler) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BottlerCopyWith<$Res> implements $BottlerCopyWith<$Res> {
  factory _$$_BottlerCopyWith(
          _$_Bottler value, $Res Function(_$_Bottler) then) =
      __$$_BottlerCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_BottlerCopyWithImpl<$Res> extends _$BottlerCopyWithImpl<$Res>
    implements _$$_BottlerCopyWith<$Res> {
  __$$_BottlerCopyWithImpl(_$_Bottler _value, $Res Function(_$_Bottler) _then)
      : super(_value, (v) => _then(v as _$_Bottler));

  @override
  _$_Bottler get _value => super._value as _$_Bottler;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Bottler(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bottler implements _Bottler {
  _$_Bottler({this.id, this.name});

  factory _$_Bottler.fromJson(Map<String, dynamic> json) =>
      _$$_BottlerFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Bottler(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bottler &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_BottlerCopyWith<_$_Bottler> get copyWith =>
      __$$_BottlerCopyWithImpl<_$_Bottler>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BottlerToJson(
      this,
    );
  }
}

abstract class _Bottler implements Bottler {
  factory _Bottler({final int? id, final String? name}) = _$_Bottler;

  factory _Bottler.fromJson(Map<String, dynamic> json) = _$_Bottler.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_BottlerCopyWith<_$_Bottler> get copyWith =>
      throw _privateConstructorUsedError;
}

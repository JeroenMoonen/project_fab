// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'distillery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Distillery _$DistilleryFromJson(Map<String, dynamic> json) {
  return _Distillery.fromJson(json);
}

/// @nodoc
mixin _$Distillery {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistilleryCopyWith<Distillery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistilleryCopyWith<$Res> {
  factory $DistilleryCopyWith(
          Distillery value, $Res Function(Distillery) then) =
      _$DistilleryCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$DistilleryCopyWithImpl<$Res> implements $DistilleryCopyWith<$Res> {
  _$DistilleryCopyWithImpl(this._value, this._then);

  final Distillery _value;
  // ignore: unused_field
  final $Res Function(Distillery) _then;

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
abstract class _$$_DistilleryCopyWith<$Res>
    implements $DistilleryCopyWith<$Res> {
  factory _$$_DistilleryCopyWith(
          _$_Distillery value, $Res Function(_$_Distillery) then) =
      __$$_DistilleryCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_DistilleryCopyWithImpl<$Res> extends _$DistilleryCopyWithImpl<$Res>
    implements _$$_DistilleryCopyWith<$Res> {
  __$$_DistilleryCopyWithImpl(
      _$_Distillery _value, $Res Function(_$_Distillery) _then)
      : super(_value, (v) => _then(v as _$_Distillery));

  @override
  _$_Distillery get _value => super._value as _$_Distillery;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Distillery(
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
class _$_Distillery implements _Distillery {
  _$_Distillery({this.id, this.name});

  factory _$_Distillery.fromJson(Map<String, dynamic> json) =>
      _$$_DistilleryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Distillery(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Distillery &&
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
  _$$_DistilleryCopyWith<_$_Distillery> get copyWith =>
      __$$_DistilleryCopyWithImpl<_$_Distillery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistilleryToJson(
      this,
    );
  }
}

abstract class _Distillery implements Distillery {
  factory _Distillery({final int? id, final String? name}) = _$_Distillery;

  factory _Distillery.fromJson(Map<String, dynamic> json) =
      _$_Distillery.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_DistilleryCopyWith<_$_Distillery> get copyWith =>
      throw _privateConstructorUsedError;
}

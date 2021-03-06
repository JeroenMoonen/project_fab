// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'whisky.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Whisky _$WhiskyFromJson(Map<String, dynamic> json) {
  return _Whisky.fromJson(json);
}

/// @nodoc
mixin _$Whisky {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get strength => throw _privateConstructorUsedError;
  String? get vintage => throw _privateConstructorUsedError;
  String? get bottled => throw _privateConstructorUsedError;
  int get content => throw _privateConstructorUsedError;
  int? get numberOfBottles => throw _privateConstructorUsedError;
  String? get bottlingSerie => throw _privateConstructorUsedError;
  String? get bottleCode => throw _privateConstructorUsedError;
  String? get statedAge => throw _privateConstructorUsedError;
  String? get caskNumber => throw _privateConstructorUsedError;
  String? get caskType =>
      throw _privateConstructorUsedError; //String? category,
  Brand? get brand => throw _privateConstructorUsedError;
  bool get bottlerIsDistillery => throw _privateConstructorUsedError;
  Bottler? get bottler => throw _privateConstructorUsedError;
  Distillery? get distillery => throw _privateConstructorUsedError;
  String? get strengthUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WhiskyCopyWith<Whisky> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhiskyCopyWith<$Res> {
  factory $WhiskyCopyWith(Whisky value, $Res Function(Whisky) then) =
      _$WhiskyCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      int? strength,
      String? vintage,
      String? bottled,
      int content,
      int? numberOfBottles,
      String? bottlingSerie,
      String? bottleCode,
      String? statedAge,
      String? caskNumber,
      String? caskType,
      Brand? brand,
      bool bottlerIsDistillery,
      Bottler? bottler,
      Distillery? distillery,
      String? strengthUnit});

  $BrandCopyWith<$Res>? get brand;
  $BottlerCopyWith<$Res>? get bottler;
  $DistilleryCopyWith<$Res>? get distillery;
}

/// @nodoc
class _$WhiskyCopyWithImpl<$Res> implements $WhiskyCopyWith<$Res> {
  _$WhiskyCopyWithImpl(this._value, this._then);

  final Whisky _value;
  // ignore: unused_field
  final $Res Function(Whisky) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? strength = freezed,
    Object? vintage = freezed,
    Object? bottled = freezed,
    Object? content = freezed,
    Object? numberOfBottles = freezed,
    Object? bottlingSerie = freezed,
    Object? bottleCode = freezed,
    Object? statedAge = freezed,
    Object? caskNumber = freezed,
    Object? caskType = freezed,
    Object? brand = freezed,
    Object? bottlerIsDistillery = freezed,
    Object? bottler = freezed,
    Object? distillery = freezed,
    Object? strengthUnit = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int?,
      vintage: vintage == freezed
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as String?,
      bottled: bottled == freezed
          ? _value.bottled
          : bottled // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfBottles: numberOfBottles == freezed
          ? _value.numberOfBottles
          : numberOfBottles // ignore: cast_nullable_to_non_nullable
              as int?,
      bottlingSerie: bottlingSerie == freezed
          ? _value.bottlingSerie
          : bottlingSerie // ignore: cast_nullable_to_non_nullable
              as String?,
      bottleCode: bottleCode == freezed
          ? _value.bottleCode
          : bottleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statedAge: statedAge == freezed
          ? _value.statedAge
          : statedAge // ignore: cast_nullable_to_non_nullable
              as String?,
      caskNumber: caskNumber == freezed
          ? _value.caskNumber
          : caskNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      caskType: caskType == freezed
          ? _value.caskType
          : caskType // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      bottlerIsDistillery: bottlerIsDistillery == freezed
          ? _value.bottlerIsDistillery
          : bottlerIsDistillery // ignore: cast_nullable_to_non_nullable
              as bool,
      bottler: bottler == freezed
          ? _value.bottler
          : bottler // ignore: cast_nullable_to_non_nullable
              as Bottler?,
      distillery: distillery == freezed
          ? _value.distillery
          : distillery // ignore: cast_nullable_to_non_nullable
              as Distillery?,
      strengthUnit: strengthUnit == freezed
          ? _value.strengthUnit
          : strengthUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $BrandCopyWith<$Res>? get brand {
    if (_value.brand == null) {
      return null;
    }

    return $BrandCopyWith<$Res>(_value.brand!, (value) {
      return _then(_value.copyWith(brand: value));
    });
  }

  @override
  $BottlerCopyWith<$Res>? get bottler {
    if (_value.bottler == null) {
      return null;
    }

    return $BottlerCopyWith<$Res>(_value.bottler!, (value) {
      return _then(_value.copyWith(bottler: value));
    });
  }

  @override
  $DistilleryCopyWith<$Res>? get distillery {
    if (_value.distillery == null) {
      return null;
    }

    return $DistilleryCopyWith<$Res>(_value.distillery!, (value) {
      return _then(_value.copyWith(distillery: value));
    });
  }
}

/// @nodoc
abstract class _$$_WhiskyCopyWith<$Res> implements $WhiskyCopyWith<$Res> {
  factory _$$_WhiskyCopyWith(_$_Whisky value, $Res Function(_$_Whisky) then) =
      __$$_WhiskyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      int? strength,
      String? vintage,
      String? bottled,
      int content,
      int? numberOfBottles,
      String? bottlingSerie,
      String? bottleCode,
      String? statedAge,
      String? caskNumber,
      String? caskType,
      Brand? brand,
      bool bottlerIsDistillery,
      Bottler? bottler,
      Distillery? distillery,
      String? strengthUnit});

  @override
  $BrandCopyWith<$Res>? get brand;
  @override
  $BottlerCopyWith<$Res>? get bottler;
  @override
  $DistilleryCopyWith<$Res>? get distillery;
}

/// @nodoc
class __$$_WhiskyCopyWithImpl<$Res> extends _$WhiskyCopyWithImpl<$Res>
    implements _$$_WhiskyCopyWith<$Res> {
  __$$_WhiskyCopyWithImpl(_$_Whisky _value, $Res Function(_$_Whisky) _then)
      : super(_value, (v) => _then(v as _$_Whisky));

  @override
  _$_Whisky get _value => super._value as _$_Whisky;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? strength = freezed,
    Object? vintage = freezed,
    Object? bottled = freezed,
    Object? content = freezed,
    Object? numberOfBottles = freezed,
    Object? bottlingSerie = freezed,
    Object? bottleCode = freezed,
    Object? statedAge = freezed,
    Object? caskNumber = freezed,
    Object? caskType = freezed,
    Object? brand = freezed,
    Object? bottlerIsDistillery = freezed,
    Object? bottler = freezed,
    Object? distillery = freezed,
    Object? strengthUnit = freezed,
  }) {
    return _then(_$_Whisky(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      strength: strength == freezed
          ? _value.strength
          : strength // ignore: cast_nullable_to_non_nullable
              as int?,
      vintage: vintage == freezed
          ? _value.vintage
          : vintage // ignore: cast_nullable_to_non_nullable
              as String?,
      bottled: bottled == freezed
          ? _value.bottled
          : bottled // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfBottles: numberOfBottles == freezed
          ? _value.numberOfBottles
          : numberOfBottles // ignore: cast_nullable_to_non_nullable
              as int?,
      bottlingSerie: bottlingSerie == freezed
          ? _value.bottlingSerie
          : bottlingSerie // ignore: cast_nullable_to_non_nullable
              as String?,
      bottleCode: bottleCode == freezed
          ? _value.bottleCode
          : bottleCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statedAge: statedAge == freezed
          ? _value.statedAge
          : statedAge // ignore: cast_nullable_to_non_nullable
              as String?,
      caskNumber: caskNumber == freezed
          ? _value.caskNumber
          : caskNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      caskType: caskType == freezed
          ? _value.caskType
          : caskType // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      bottlerIsDistillery: bottlerIsDistillery == freezed
          ? _value.bottlerIsDistillery
          : bottlerIsDistillery // ignore: cast_nullable_to_non_nullable
              as bool,
      bottler: bottler == freezed
          ? _value.bottler
          : bottler // ignore: cast_nullable_to_non_nullable
              as Bottler?,
      distillery: distillery == freezed
          ? _value.distillery
          : distillery // ignore: cast_nullable_to_non_nullable
              as Distillery?,
      strengthUnit: strengthUnit == freezed
          ? _value.strengthUnit
          : strengthUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Whisky implements _Whisky {
  _$_Whisky(
      {required this.id,
      required this.name,
      this.strength,
      this.vintage,
      this.bottled,
      required this.content,
      this.numberOfBottles,
      this.bottlingSerie,
      this.bottleCode,
      this.statedAge,
      this.caskNumber,
      this.caskType,
      this.brand = null,
      this.bottlerIsDistillery = false,
      this.bottler = null,
      this.distillery = null,
      this.strengthUnit});

  factory _$_Whisky.fromJson(Map<String, dynamic> json) =>
      _$$_WhiskyFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? strength;
  @override
  final String? vintage;
  @override
  final String? bottled;
  @override
  final int content;
  @override
  final int? numberOfBottles;
  @override
  final String? bottlingSerie;
  @override
  final String? bottleCode;
  @override
  final String? statedAge;
  @override
  final String? caskNumber;
  @override
  final String? caskType;
//String? category,
  @override
  @JsonKey()
  final Brand? brand;
  @override
  @JsonKey()
  final bool bottlerIsDistillery;
  @override
  @JsonKey()
  final Bottler? bottler;
  @override
  @JsonKey()
  final Distillery? distillery;
  @override
  final String? strengthUnit;

  @override
  String toString() {
    return 'Whisky(id: $id, name: $name, strength: $strength, vintage: $vintage, bottled: $bottled, content: $content, numberOfBottles: $numberOfBottles, bottlingSerie: $bottlingSerie, bottleCode: $bottleCode, statedAge: $statedAge, caskNumber: $caskNumber, caskType: $caskType, brand: $brand, bottlerIsDistillery: $bottlerIsDistillery, bottler: $bottler, distillery: $distillery, strengthUnit: $strengthUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Whisky &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.strength, strength) &&
            const DeepCollectionEquality().equals(other.vintage, vintage) &&
            const DeepCollectionEquality().equals(other.bottled, bottled) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.numberOfBottles, numberOfBottles) &&
            const DeepCollectionEquality()
                .equals(other.bottlingSerie, bottlingSerie) &&
            const DeepCollectionEquality()
                .equals(other.bottleCode, bottleCode) &&
            const DeepCollectionEquality().equals(other.statedAge, statedAge) &&
            const DeepCollectionEquality()
                .equals(other.caskNumber, caskNumber) &&
            const DeepCollectionEquality().equals(other.caskType, caskType) &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.bottlerIsDistillery, bottlerIsDistillery) &&
            const DeepCollectionEquality().equals(other.bottler, bottler) &&
            const DeepCollectionEquality()
                .equals(other.distillery, distillery) &&
            const DeepCollectionEquality()
                .equals(other.strengthUnit, strengthUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(strength),
      const DeepCollectionEquality().hash(vintage),
      const DeepCollectionEquality().hash(bottled),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(numberOfBottles),
      const DeepCollectionEquality().hash(bottlingSerie),
      const DeepCollectionEquality().hash(bottleCode),
      const DeepCollectionEquality().hash(statedAge),
      const DeepCollectionEquality().hash(caskNumber),
      const DeepCollectionEquality().hash(caskType),
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(bottlerIsDistillery),
      const DeepCollectionEquality().hash(bottler),
      const DeepCollectionEquality().hash(distillery),
      const DeepCollectionEquality().hash(strengthUnit));

  @JsonKey(ignore: true)
  @override
  _$$_WhiskyCopyWith<_$_Whisky> get copyWith =>
      __$$_WhiskyCopyWithImpl<_$_Whisky>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WhiskyToJson(
      this,
    );
  }
}

abstract class _Whisky implements Whisky {
  factory _Whisky(
      {required final int id,
      required final String name,
      final int? strength,
      final String? vintage,
      final String? bottled,
      required final int content,
      final int? numberOfBottles,
      final String? bottlingSerie,
      final String? bottleCode,
      final String? statedAge,
      final String? caskNumber,
      final String? caskType,
      final Brand? brand,
      final bool bottlerIsDistillery,
      final Bottler? bottler,
      final Distillery? distillery,
      final String? strengthUnit}) = _$_Whisky;

  factory _Whisky.fromJson(Map<String, dynamic> json) = _$_Whisky.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get strength;
  @override
  String? get vintage;
  @override
  String? get bottled;
  @override
  int get content;
  @override
  int? get numberOfBottles;
  @override
  String? get bottlingSerie;
  @override
  String? get bottleCode;
  @override
  String? get statedAge;
  @override
  String? get caskNumber;
  @override
  String? get caskType;
  @override //String? category,
  Brand? get brand;
  @override
  bool get bottlerIsDistillery;
  @override
  Bottler? get bottler;
  @override
  Distillery? get distillery;
  @override
  String? get strengthUnit;
  @override
  @JsonKey(ignore: true)
  _$$_WhiskyCopyWith<_$_Whisky> get copyWith =>
      throw _privateConstructorUsedError;
}

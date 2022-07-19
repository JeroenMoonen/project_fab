// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whisky.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Whisky _$$_WhiskyFromJson(Map<String, dynamic> json) => _$_Whisky(
      id: json['id'] as int,
      name: json['name'] as String,
      strength: json['strength'] as int?,
      vintage: json['vintage'] as String?,
      bottled: json['bottled'] as String?,
      content: json['content'] as int,
      numberOfBottles: json['numberOfBottles'] as int?,
      bottlingSerie: json['bottlingSerie'] as String?,
      bottleCode: json['bottleCode'] as String?,
      statedAge: json['statedAge'] as String?,
      caskNumber: json['caskNumber'] as String?,
      caskType: json['caskType'] as String?,
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      bottlerIsDistillery: json['bottlerIsDistillery'] as bool? ?? false,
      bottler: json['bottler'] == null
          ? null
          : Bottler.fromJson(json['bottler'] as Map<String, dynamic>),
      distillery: json['distillery'] == null
          ? null
          : Distillery.fromJson(json['distillery'] as Map<String, dynamic>),
      strengthUnit: json['strengthUnit'] as String?,
    );

Map<String, dynamic> _$$_WhiskyToJson(_$_Whisky instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'strength': instance.strength,
      'vintage': instance.vintage,
      'bottled': instance.bottled,
      'content': instance.content,
      'numberOfBottles': instance.numberOfBottles,
      'bottlingSerie': instance.bottlingSerie,
      'bottleCode': instance.bottleCode,
      'statedAge': instance.statedAge,
      'caskNumber': instance.caskNumber,
      'caskType': instance.caskType,
      'brand': instance.brand,
      'bottlerIsDistillery': instance.bottlerIsDistillery,
      'bottler': instance.bottler,
      'distillery': instance.distillery,
      'strengthUnit': instance.strengthUnit,
    };

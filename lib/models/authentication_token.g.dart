// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticationToken _$$_AuthenticationTokenFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticationToken(
      userId: json['userId'] as int,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_AuthenticationTokenToJson(
        _$_AuthenticationToken instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] as String?,
      about: json['about'] as String?,
      location: json['location'] as String?,
      checkinCount: json['checkinCount'] as int? ?? 0,
      friendsCount: json['friendsCount'] as int? ?? 0,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
      'about': instance.about,
      'location': instance.location,
      'checkinCount': instance.checkinCount,
      'friendsCount': instance.friendsCount,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as int,
      body: json['body'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      postedAt: DateTime.parse(json['postedAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'user': instance.user,
      'postedAt': instance.postedAt.toIso8601String(),
    };

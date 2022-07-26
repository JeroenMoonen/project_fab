// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Checkin _$$_CheckinFromJson(Map<String, dynamic> json) => _$_Checkin(
      id: json['id'] as int,
      whisky: Whisky.fromJson(json['whisky'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      review: json['review'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      noseReview: json['noseReview'] as String?,
      noseRating: (json['noseRating'] as num?)?.toDouble(),
      tasteReview: json['tasteReview'] as String?,
      tasteRating: (json['tasteRating'] as num?)?.toDouble(),
      finishReview: json['finishReview'] as String?,
      finishRating: (json['finishRating'] as num?)?.toDouble(),
      postedAt: DateTime.parse(json['postedAt'] as String),
    );

Map<String, dynamic> _$$_CheckinToJson(_$_Checkin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'whisky': instance.whisky,
      'user': instance.user,
      'review': instance.review,
      'rating': instance.rating,
      'noseReview': instance.noseReview,
      'noseRating': instance.noseRating,
      'tasteReview': instance.tasteReview,
      'tasteRating': instance.tasteRating,
      'finishReview': instance.finishReview,
      'finishRating': instance.finishRating,
      'postedAt': instance.postedAt.toIso8601String(),
    };

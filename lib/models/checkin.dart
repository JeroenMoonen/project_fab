import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_fab/models/models.dart';

part 'checkin.freezed.dart';
part 'checkin.g.dart';

@freezed
class Checkin with _$Checkin {
  factory Checkin({
    required int id,
    required Whisky whisky,
    required User user,
    required String review,
    double? rating,
    String? noseReview,
    double? noseRating,
    String? tasteReview,
    double? tasteRating,
    String? finishReview,
    double? finishRating,
    required DateTime postedAt,
  }) = _Checkin;

  factory Checkin.fromJson(Map<String, dynamic> json) =>
      _$CheckinFromJson(json);
}

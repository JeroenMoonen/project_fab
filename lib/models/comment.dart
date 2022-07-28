import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_fab/models/user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    required int id,
    required String body,
    required User user,
    required DateTime postedAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

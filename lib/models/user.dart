import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    String? firstName,
    String? lastName,
    required String email,
    // String? gender,
    String? dateOfBirth,
    String? about,
    String? location,
    @Default(0) int checkinCount,
    @Default(0) int friendsCount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

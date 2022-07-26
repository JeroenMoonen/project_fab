import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_token.freezed.dart';
part 'authentication_token.g.dart';

@freezed
class AuthenticationToken with _$AuthenticationToken {
  factory AuthenticationToken({
    required int userId,
    required String token,
  }) = _AuthenticationToken;

  factory AuthenticationToken.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTokenFromJson(json);
}

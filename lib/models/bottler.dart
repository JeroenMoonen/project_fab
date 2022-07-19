import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottler.freezed.dart';
part 'bottler.g.dart';

@freezed
class Bottler with _$Bottler {
  factory Bottler({
    int? id,
    String? name,
  }) = _Bottler;

  factory Bottler.fromJson(Map<String, dynamic> json) =>
      _$BottlerFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'distillery.freezed.dart';
part 'distillery.g.dart';

@freezed
class Distillery with _$Distillery {
  factory Distillery({
    int? id,
    String? name,
  }) = _Distillery;

  factory Distillery.fromJson(Map<String, dynamic> json) =>
      _$DistilleryFromJson(json);
}

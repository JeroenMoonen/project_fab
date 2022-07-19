import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_fab/models/bottler.dart';
import 'package:project_fab/models/brand.dart';
import 'package:project_fab/models/distillery.dart';

part 'whisky.freezed.dart';
part 'whisky.g.dart';

@freezed
class Whisky with _$Whisky {
  factory Whisky({
    required int id,
    required String name,
    int? strength,
    String? vintage,
    String? bottled,
    required int content,
    int? numberOfBottles,
    String? bottlingSerie,
    String? bottleCode,
    String? statedAge,
    String? caskNumber,
    String? caskType,
    //String? category,
    @Default(null) Brand? brand,
    @Default(false) bool bottlerIsDistillery,
    @Default(null) Bottler? bottler,
    @Default(null) Distillery? distillery,
    String? strengthUnit,
  }) = _Whisky;

  factory Whisky.fromJson(Map<String, dynamic> json) => _$WhiskyFromJson(json);
}

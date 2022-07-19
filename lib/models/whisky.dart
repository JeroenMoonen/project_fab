import 'package:freezed_annotation/freezed_annotation.dart';

part 'whisky.freezed.dart';
part 'whisky.g.dart';

@freezed
class Whisky with _$Whisky {
  factory Whisky({
    int? id,
    String? name,
    int? strength,
    String? vintage,
    String? bottled,
    int? content,
    int? numberOfBottles,
    String? bottlingSerie,
    String? bottleCode,
    String? statedAge,
    String? caskNumber,
    String? caskType,
    //String? category,
    //String? brand,
    bool? bottlerIsDistillery,
    //String? bottler,
    //String? distillery,
    String? strngthUnit,
  }) = _Whisky;

  factory Whisky.fromJson(Map<String, dynamic> json) => _$WhiskyFromJson(json);
}

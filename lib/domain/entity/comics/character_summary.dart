import 'package:json_annotation/json_annotation.dart';

part 'character_summary.g.dart';

@JsonSerializable()
class CharacterSummary {
  final String? resourceURI;
  final String? name;
  final String? role;

  CharacterSummary(
    this.resourceURI,
    this.name,
    this.role,
  );

  factory CharacterSummary.fromJson(Map<String, dynamic> json) => _$CharacterSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterSummaryToJson(this);
}
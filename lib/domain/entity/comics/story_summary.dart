import 'package:my_trial_project/domain/entity/comics/character_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_summary.g.dart';

@JsonSerializable(explicitToJson: true)

class StorySummary {
  final int? available;
  final int? returned;
  final String? collectionURI;
  final List<CharacterSummary>? items;

  StorySummary(
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  );

  factory StorySummary.fromJson(Map<String, dynamic> json) => _$StorySummaryFromJson(json);

  Map<String, dynamic> toJson() => _$StorySummaryToJson(this);
}

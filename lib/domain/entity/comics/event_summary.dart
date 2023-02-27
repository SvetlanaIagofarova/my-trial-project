import 'package:my_trial_project/domain/entity/comics/character_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_summary.g.dart';

@JsonSerializable(explicitToJson: true)

class EventSummary {
  final int? available;
  final int? returned;
  final String? collectionURI;
  final List<CharacterSummary>? items;

  EventSummary(
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  );

  factory EventSummary.fromJson(Map<String, dynamic> json) => _$EventSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$EventSummaryToJson(this);
}

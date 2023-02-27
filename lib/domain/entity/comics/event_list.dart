import 'package:json_annotation/json_annotation.dart';
import 'package:my_trial_project/domain/entity/comics/event_summary.dart';

part 'event_list.g.dart';

@JsonSerializable(explicitToJson: true)

class EventList {
  final int? available;
  final int? returned;
  final String? collectionURI;
  final List<EventSummary>? items;

  EventList(
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  );

  factory EventList.fromJson(Map<String, dynamic> json) => _$EventListFromJson(json);

  Map<String, dynamic> toJson() => _$EventListToJson(this);
}
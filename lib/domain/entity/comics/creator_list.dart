import 'package:my_trial_project/domain/entity/comics/creator_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_list.g.dart';

@JsonSerializable(explicitToJson: true)

class CreatorList {
  final int? available;
  final int? returned;
  final String? collectionURI;
  final List<CreatorSummary>? items;

  CreatorList(
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  );

  factory CreatorList.fromJson(Map<String, dynamic> json) => _$CreatorListFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorListToJson(this);
}

import 'package:my_trial_project/domain/entity/comics/character_summary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_list.g.dart';

@JsonSerializable(explicitToJson: true)

class CharacterList {
  final int? available;
  final int? returned;
  final String? collectionURI;
  final List<CharacterSummary>? items;

  CharacterList(
    this.available,
    this.returned,
    this.collectionURI,
    this.items,
  );

  factory CharacterList.fromJson(Map<String, dynamic> json) => _$CharacterListFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListToJson(this);
}

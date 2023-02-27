import 'package:json_annotation/json_annotation.dart';

part 'creator_summary.g.dart';

@JsonSerializable()
class CreatorSummary {
  final String? resourceURI;
  final String? name;
  final String? role;

  CreatorSummary(
    this.resourceURI,
    this.name,
    this.role,
  );

  factory CreatorSummary.fromJson(Map<String, dynamic> json) => _$CreatorSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$CreatorSummaryToJson(this);
}

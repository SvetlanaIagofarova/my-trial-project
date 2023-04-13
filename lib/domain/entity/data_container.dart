import 'package:my_trial_project/domain/entity/comic.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_container.g.dart';

@JsonSerializable(explicitToJson: true)
class DataContainer {
  final int offset;
  final int? limit;
  final int total;
  final int? count;
  @JsonKey(name: 'results')
  final List<Comic> comic;

  DataContainer(
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.comic,
  );

  factory DataContainer.fromJson(Map<String, dynamic> json) =>
      _$DataContainerFromJson(json);

  Map<String, dynamic> toJson() => _$DataContainerToJson(this);
}

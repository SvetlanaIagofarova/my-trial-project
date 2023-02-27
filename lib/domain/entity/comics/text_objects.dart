import 'package:json_annotation/json_annotation.dart';

part 'text_objects.g.dart';

@JsonSerializable()

class TextObjects {
  final String? type;
  final String? language;
  final String? text;

  TextObjects(
    this.type,
    this.language,
    this.text,
  );

  factory TextObjects.fromJson(Map<String, dynamic> json) => _$TextObjectsFromJson(json);

  Map<String, dynamic> toJson() => _$TextObjectsToJson(this);
}

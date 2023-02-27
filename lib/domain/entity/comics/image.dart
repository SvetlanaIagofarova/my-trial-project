import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final String? path;
  @JsonKey(name: 'extension')
  final String? imageExtension;

  Image(
    this.path,
    this.imageExtension,
  );

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
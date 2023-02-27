import 'package:my_trial_project/domain/entity/data_container.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wrapper_object.g.dart';

@JsonSerializable(explicitToJson: true)
class WrapperObject {
  final int? code;
  final String? status;
  final String? etag;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final DataContainer data;

  WrapperObject(
    this.code,
    this.status,
    this.etag,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.data,
  );

  factory WrapperObject.fromJson(Map<String, dynamic> json) =>
      _$WrapperObjectFromJson(json);

  Map<String, dynamic> toJson() => _$WrapperObjectToJson(this);
}

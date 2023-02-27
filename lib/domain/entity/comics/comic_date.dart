import 'package:json_annotation/json_annotation.dart';

part 'comic_date.g.dart';

@JsonSerializable()
class ComicDate {
  final String? type;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? date;

  ComicDate(
    this.type,
    this.date,
  );

  
  static DateTime? _parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }

  factory ComicDate.fromJson(Map<String, dynamic> json) => _$ComicDateFromJson(json);

  Map<String, dynamic> toJson() => _$ComicDateToJson(this);
}

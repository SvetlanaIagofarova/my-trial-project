import 'package:my_trial_project/domain/entity/comics/character_list.dart';
import 'package:my_trial_project/domain/entity/comics/comic_summary.dart';
import 'package:my_trial_project/domain/entity/comics/creator_list.dart';
import 'package:my_trial_project/domain/entity/comics/comic_date.dart';
import 'package:my_trial_project/domain/entity/comics/event_list.dart';
import 'package:my_trial_project/domain/entity/comics/comic_price.dart';
import 'package:my_trial_project/domain/entity/comics/series_summary.dart';
import 'package:my_trial_project/domain/entity/comics/story_list.dart';
import 'package:my_trial_project/domain/entity/comics/text_objects.dart';
import 'package:my_trial_project/domain/entity/comics/thumbnail.dart';
import 'package:my_trial_project/domain/entity/comics/url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comics.g.dart';

@JsonSerializable(explicitToJson: true)
class Comics {
  final int id;
  final int? digitalId;
  final String title;
  final double? issueNumber;
  final String? variantDescription;
  final String? description;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final int? pageCount;
  final List<TextObjects>? textObjects;
  final String? resourceURI;
  final List<Url>? urls;
  final SeriesSummary? series;
  final List<ComicSummary>? variants;
  final List<ComicSummary>? collections;
  final List<ComicSummary>? collectedIssues;
  final List<ComicDate>? dates;
  final List<ComicPrice>? prices;
  final Thumbnail? thumbnail;
  final CreatorList? creators;
  final CharacterList? characters;
  final StoryList? stories;
  final EventList? events;

  Comics(
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.pageCount,
    this.textObjects,
    this.resourceURI,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  );

  factory Comics.fromJson(Map<String, dynamic> json) => _$ComicsFromJson(json);

  Map<String, dynamic> toJson() => _$ComicsToJson(this);

  static DateTime? _parseDateFromString(String? rawDate) {
    if (rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }
}

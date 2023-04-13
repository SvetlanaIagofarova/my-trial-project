// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comic _$ComicFromJson(Map<String, dynamic> json) => Comic(
      json['id'] as int,
      json['digitalId'] as int?,
      json['title'] as String,
      (json['issueNumber'] as num?)?.toDouble(),
      json['variantDescription'] as String?,
      json['description'] as String?,
      Comic._parseDateFromString(json['modified'] as String?),
      json['isbn'] as String?,
      json['upc'] as String?,
      json['diamondCode'] as String?,
      json['ean'] as String?,
      json['issn'] as String?,
      json['format'] as String?,
      json['pageCount'] as int?,
      (json['textObjects'] as List<dynamic>?)
          ?.map((e) => TextObjects.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['resourceURI'] as String?,
      (json['urls'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['series'] == null
          ? null
          : SeriesSummary.fromJson(json['series'] as Map<String, dynamic>),
      (json['variants'] as List<dynamic>?)
          ?.map((e) => ComicSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['collections'] as List<dynamic>?)
          ?.map((e) => ComicSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['collectedIssues'] as List<dynamic>?)
          ?.map((e) => ComicSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['dates'] as List<dynamic>?)
          ?.map((e) => ComicDate.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['prices'] as List<dynamic>?)
          ?.map((e) => ComicPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      json['creators'] == null
          ? null
          : CreatorList.fromJson(json['creators'] as Map<String, dynamic>),
      json['characters'] == null
          ? null
          : CharacterList.fromJson(json['characters'] as Map<String, dynamic>),
      json['stories'] == null
          ? null
          : StoryList.fromJson(json['stories'] as Map<String, dynamic>),
      json['events'] == null
          ? null
          : EventList.fromJson(json['events'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicToJson(Comic instance) => <String, dynamic>{
      'id': instance.id,
      'digitalId': instance.digitalId,
      'title': instance.title,
      'issueNumber': instance.issueNumber,
      'variantDescription': instance.variantDescription,
      'description': instance.description,
      'modified': instance.modified?.toIso8601String(),
      'isbn': instance.isbn,
      'upc': instance.upc,
      'diamondCode': instance.diamondCode,
      'ean': instance.ean,
      'issn': instance.issn,
      'format': instance.format,
      'pageCount': instance.pageCount,
      'textObjects': instance.textObjects?.map((e) => e.toJson()).toList(),
      'resourceURI': instance.resourceURI,
      'urls': instance.urls?.map((e) => e.toJson()).toList(),
      'series': instance.series?.toJson(),
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
      'collections': instance.collections?.map((e) => e.toJson()).toList(),
      'collectedIssues':
          instance.collectedIssues?.map((e) => e.toJson()).toList(),
      'dates': instance.dates?.map((e) => e.toJson()).toList(),
      'prices': instance.prices?.map((e) => e.toJson()).toList(),
      'thumbnail': instance.thumbnail?.toJson(),
      'creators': instance.creators?.toJson(),
      'characters': instance.characters?.toJson(),
      'stories': instance.stories?.toJson(),
      'events': instance.events?.toJson(),
    };

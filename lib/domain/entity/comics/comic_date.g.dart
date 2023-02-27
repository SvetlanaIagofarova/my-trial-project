// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicDate _$ComicDateFromJson(Map<String, dynamic> json) => ComicDate(
      json['type'] as String?,
      ComicDate._parseDateFromString(json['date'] as String?),
    );

Map<String, dynamic> _$ComicDateToJson(ComicDate instance) => <String, dynamic>{
      'type': instance.type,
      'date': instance.date?.toIso8601String(),
    };

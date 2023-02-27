// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataContainer _$DataContainerFromJson(Map<String, dynamic> json) =>
    DataContainer(
      json['offset'] as int?,
      json['limit'] as int?,
      json['total'] as int?,
      json['count'] as int?,
      (json['results'] as List<dynamic>)
          .map((e) => Comics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataContainerToJson(DataContainer instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.comics.map((e) => e.toJson()).toList(),
    };

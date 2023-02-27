// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatorList _$CreatorListFromJson(Map<String, dynamic> json) => CreatorList(
      json['available'] as int?,
      json['returned'] as int?,
      json['collectionURI'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => CreatorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatorListToJson(CreatorList instance) =>
    <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

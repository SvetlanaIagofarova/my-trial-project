// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterList _$CharacterListFromJson(Map<String, dynamic> json) =>
    CharacterList(
      json['available'] as int?,
      json['returned'] as int?,
      json['collectionURI'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => CharacterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListToJson(CharacterList instance) =>
    <String, dynamic>{
      'available': instance.available,
      'returned': instance.returned,
      'collectionURI': instance.collectionURI,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

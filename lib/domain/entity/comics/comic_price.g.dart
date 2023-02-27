// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comic_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicPrice _$ComicPriceFromJson(Map<String, dynamic> json) => ComicPrice(
      json['type'] as String?,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ComicPriceToJson(ComicPrice instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
    };

import 'package:json_annotation/json_annotation.dart';

part 'comic_price.g.dart';

@JsonSerializable()
class ComicPrice {
  final String? type;
  final double? price;

  ComicPrice(
    this.type,
    this.price,
  );

  factory ComicPrice.fromJson(Map<String, dynamic> json) => _$ComicPriceFromJson(json);

  Map<String, dynamic> toJson() => _$ComicPriceToJson(this);
}

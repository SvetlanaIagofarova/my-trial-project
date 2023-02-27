// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapper_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrapperObject _$WrapperObjectFromJson(Map<String, dynamic> json) =>
    WrapperObject(
      json['code'] as int?,
      json['status'] as String?,
      json['etag'] as String?,
      json['copyright'] as String?,
      json['attributionText'] as String?,
      json['attributionHTML'] as String?,
      DataContainer.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WrapperObjectToJson(WrapperObject instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'etag': instance.etag,
      'copyright': instance.copyright,
      'attributionText': instance.attributionText,
      'attributionHTML': instance.attributionHTML,
      'data': instance.data.toJson(),
    };

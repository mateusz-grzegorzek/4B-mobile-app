// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapPlace _$MapPlaceFromJson(Map<String, dynamic> json) {
  return MapPlace(
      json['mId'] as int,
      json['mAddress'] as String,
      json['mName'] as String,
      (json['mCoordX'] as num)?.toDouble(),
      (json['mCoordY'] as num)?.toDouble());
}

Map<String, dynamic> _$MapPlaceToJson(MapPlace instance) => <String, dynamic>{
      'mId': instance.mId,
      'mAddress': instance.mAddress,
      'mName': instance.mName,
      'mCoordX': instance.mCoordX,
      'mCoordY': instance.mCoordY
    };

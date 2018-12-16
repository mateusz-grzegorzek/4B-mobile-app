// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_place.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

MapPlace _$MapPlaceFromJson(Map<String, dynamic> json) => new MapPlace(
    json['mId'] as int,
    json['mAddress'] as String,
    json['mName'] as String,
    (json['mCoordX'] as num)?.toDouble(),
    (json['mCoordY'] as num)?.toDouble());

abstract class _$MapPlaceSerializerMixin {
  int get mId;
  String get mAddress;
  String get mName;
  double get mCoordX;
  double get mCoordY;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mId': mId,
        'mAddress': mAddress,
        'mName': mName,
        'mCoordX': mCoordX,
        'mCoordY': mCoordY
      };
}

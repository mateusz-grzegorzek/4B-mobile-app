// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TileInfo _$TileInfoFromJson(Map<String, dynamic> json) {
  return TileInfo(json['mId'] as int, json['mFamily'] as String,
      json['mTitle'] as String, json['mBody'] as String);
}

Map<String, dynamic> _$TileInfoToJson(TileInfo instance) => <String, dynamic>{
      'mId': instance.mId,
      'mFamily': instance.mFamily,
      'mTitle': instance.mTitle,
      'mBody': instance.mBody
    };

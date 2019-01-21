// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) {
  return TripInfo(
      json['mId'] as int,
      json['mTitle'] as String,
      json['mBody'] as String,
      json['mUserName'] as String,
      json['mPassword'] as String,
      json['mAboutCountry'] as String,
      (json['mVisitedPlaces'] as List)
          ?.map((e) =>
              e == null ? null : TileInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['mImportantInfo'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$TripInfoToJson(TripInfo instance) => <String, dynamic>{
      'mId': instance.mId,
      'mTitle': instance.mTitle,
      'mBody': instance.mBody,
      'mUserName': instance.mUserName,
      'mPassword': instance.mPassword,
      'mAboutCountry': instance.mAboutCountry,
      'mVisitedPlaces': instance.mVisitedPlaces,
      'mImportantInfo': instance.mImportantInfo
    };

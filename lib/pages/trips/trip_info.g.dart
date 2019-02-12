// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) {
  return TripInfo(
    json['mId'] as int,
    json['mTitle'] as String,
    json['mUserName'] as String,
    json['mPassword'] as String,
    json['mAboutCountry'] as String,
    (json['mContacts'] as List)
        ?.map((e) =>
            e == null ? null : ContactInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['mBackgroundImagePath'] as String,
    (json['mDayTiles'] as List)
        ?.map((e) =>
            e == null ? null : DayTile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TripInfoToJson(TripInfo instance) => <String, dynamic>{
      'mId': instance.mId,
      'mTitle': instance.mTitle,
      'mUserName': instance.mUserName,
      'mPassword': instance.mPassword,
      'mAboutCountry': instance.mAboutCountry,
      'mContacts': instance.mContacts,
      'mBackgroundImagePath': instance.mBackgroundImagePath
    };

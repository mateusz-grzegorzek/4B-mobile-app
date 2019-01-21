// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) {
  return EventInfo(
      json['mId'] as int,
      json['mTitle'] as String,
      json['mBody'] as String,
      json['mPlaceId'] as int,
      json['mStartTime'] == null
          ? null
          : DateTime.parse(json['mStartTime'] as String),
      json['mEndTime'] == null
          ? null
          : DateTime.parse(json['mEndTime'] as String));
}

Map<String, dynamic> _$EventInfoToJson(EventInfo instance) => <String, dynamic>{
      'mId': instance.mId,
      'mTitle': instance.mTitle,
      'mBody': instance.mBody,
      'mPlaceId': instance.mPlaceId,
      'mStartTime': instance.mStartTime?.toIso8601String(),
      'mEndTime': instance.mEndTime?.toIso8601String()
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_events_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayEventsInfo _$DayEventsInfoFromJson(Map<String, dynamic> json) {
  return DayEventsInfo(
      json['mDateTime'] == null
          ? null
          : DateTime.parse(json['mDateTime'] as String),
      json['mTitle'] as String,
      (json['mEventInfoList'] as List)
          ?.map((e) =>
              e == null ? null : EventInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DayEventsInfoToJson(DayEventsInfo instance) =>
    <String, dynamic>{
      'mDateTime': instance.mDateTime?.toIso8601String(),
      'mTitle': instance.mTitle,
      'mEventInfoList': instance.mEventInfoList
    };

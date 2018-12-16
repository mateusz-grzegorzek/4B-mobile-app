// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_events_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

DayEventsInfo _$DayEventsInfoFromJson(Map<String, dynamic> json) =>
    new DayEventsInfo(
        json['mDateTime'] == null
            ? null
            : DateTime.parse(json['mDateTime'] as String),
        json['mTitle'] as String,
        (json['mEventInfoList'] as List)
            ?.map((e) => e == null
                ? null
                : new EventInfo.fromJson(e as Map<String, dynamic>))
            ?.toList());

abstract class _$DayEventsInfoSerializerMixin {
  DateTime get mDateTime;
  String get mTitle;
  List<EventInfo> get mEventInfoList;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mDateTime': mDateTime?.toIso8601String(),
        'mTitle': mTitle,
        'mEventInfoList': mEventInfoList
      };
}

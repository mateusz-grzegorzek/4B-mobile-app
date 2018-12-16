// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) => new EventInfo(
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

abstract class _$EventInfoSerializerMixin {
  int get mId;
  String get mTitle;
  String get mBody;
  int get mPlaceId;
  DateTime get mStartTime;
  DateTime get mEndTime;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mId': mId,
        'mTitle': mTitle,
        'mBody': mBody,
        'mPlaceId': mPlaceId,
        'mStartTime': mStartTime?.toIso8601String(),
        'mEndTime': mEndTime?.toIso8601String()
      };
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayTile _$DayTileFromJson(Map<String, dynamic> json) {
  return DayTile(json['mId'] as int, json['mDayNumber'] as int,
      json['mEventsList'] as List<EventInfo>);
}

Map<String, dynamic> _$DayTileToJson(DayTile instance) => <String, dynamic>{
      'mId': instance.mId,
      'mDayNumber': instance.mDayNumber,
      'mEventsList': instance.mEventsList
    };

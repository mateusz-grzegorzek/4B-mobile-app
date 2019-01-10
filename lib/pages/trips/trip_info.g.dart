// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) => new TripInfo(
    json['mId'] as int,
    json['mTitle'] as String,
    json['mBody'] as String,
    json['mUserName'] as String,
    json['mPassword'] as String,
    json['mAboutCountry'] as String);

abstract class _$TripInfoSerializerMixin {
  int get mId;
  String get mTitle;
  String get mBody;
  String get mUserName;
  String get mPassword;
  String get mAboutCountry;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mId': mId,
        'mTitle': mTitle,
        'mBody': mBody,
        'mUserName': mUserName,
        'mPassword': mPassword,
        'mAboutCountry': mAboutCountry
      };
}

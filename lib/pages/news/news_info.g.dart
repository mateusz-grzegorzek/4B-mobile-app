// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

NewsInfo _$NewsInfoFromJson(Map<String, dynamic> json) => new NewsInfo(
    json['mId'] as int, json['mTitle'] as String, json['mBody'] as String);

abstract class _$NewsInfoSerializerMixin {
  int get mId;
  String get mTitle;
  String get mBody;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'mId': mId, 'mTitle': mTitle, 'mBody': mBody};
}

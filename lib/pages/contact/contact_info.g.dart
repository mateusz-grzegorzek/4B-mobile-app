// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => new ContactInfo(
    json['mId'] as int,
    json['mName'] as String,
    json['mDescription'] as String,
    json['mPhoneNumber'] as String);

abstract class _$ContactInfoSerializerMixin {
  int get mId;
  String get mName;
  String get mDescription;
  String get mPhoneNumber;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mId': mId,
        'mName': mName,
        'mDescription': mDescription,
        'mPhoneNumber': mPhoneNumber
      };
}

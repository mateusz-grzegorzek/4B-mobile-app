// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return ContactInfo(
      json['mId'] as int,
      json['mName'] as String,
      json['mDescription'] as String,
      json['mPhoneNumber'] as String,
      json['mEmail'] as String);
}

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'mId': instance.mId,
      'mName': instance.mName,
      'mDescription': instance.mDescription,
      'mPhoneNumber': instance.mPhoneNumber,
      'mEmail': instance.mEmail
    };

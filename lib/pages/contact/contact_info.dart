import 'package:json_annotation/json_annotation.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo extends Object with _$ContactInfoSerializerMixin {
  ContactInfo(this.mId, this.mName, this.mDescription, this.mPhoneNumber);

  int mId;
  String mName;
  String mDescription;
  String mPhoneNumber;

  void log() {
    print(
        "ContactInfo:mId=$mId,mName=$mName,mDescription=$mDescription,mPhoneNumber=$mPhoneNumber");
  }

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}

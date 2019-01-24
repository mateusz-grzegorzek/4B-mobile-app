import 'package:json_annotation/json_annotation.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo extends Object {
  ContactInfo(this.mId, this.mName, this.mDescription, this.mPhoneNumber, [this.mEmail=""]);

  int mId;
  String mName;
  String mDescription;
  String mPhoneNumber;
  String mEmail;

  void log() {
    print(
        "ContactInfo:mId=$mId,mName=$mName,mDescription=$mDescription,mPhoneNumber=$mPhoneNumber,mEmail=$mEmail");
  }

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}

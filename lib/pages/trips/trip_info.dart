import 'package:json_annotation/json_annotation.dart';

import '../common/contact/contact_info.dart';
import '../../utils/tile_info.dart';
part 'trip_info.g.dart';

@JsonSerializable()
class TripInfo extends Object {
  TripInfo(this.mId, this.mTitle, this.mBody, this.mUserName, this.mPassword,
      this.mAboutCountry, this.mVisitedPlaces, this.mImportantInfo, this.mContacts);

  int mId;
  String mTitle;
  String mBody;
  String mUserName;
  String mPassword;
  String mAboutCountry;
  List<TileInfo> mVisitedPlaces;
  List<String> mImportantInfo;
  List<ContactInfo> mContacts;

  TripInfo.fromTripInfo(TripInfo aNewsInfo) {
    this.mId = aNewsInfo.mId;
    this.mTitle = aNewsInfo.mTitle;
    this.mBody = aNewsInfo.mBody;
    this.mUserName = aNewsInfo.mUserName;
    this.mPassword = aNewsInfo.mPassword;
    this.mAboutCountry = aNewsInfo.mAboutCountry;
    this.mVisitedPlaces = aNewsInfo.mVisitedPlaces;
    this.mImportantInfo = aNewsInfo.mImportantInfo;
    this.mContacts = aNewsInfo.mContacts;
  }

  void fLog() {
    print("TripInfo:mId=$mId,mTitle=$mTitle,mBody=$mBody,mUserName=$mUserName,"
        "mPassword=$mPassword,mAboutCountry=$mAboutCountry,mVisitedPlaces=$mVisitedPlaces,mImportantInfo=$mImportantInfo,mContacts=$mContacts");
  }

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}

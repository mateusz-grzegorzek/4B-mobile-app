import 'package:business_mobile_app/pages/trips/schedule/day_tile.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/contact/contact_info.dart';
import '../../utils/tile_info.dart';
part 'trip_info.g.dart';

@JsonSerializable()
class TripInfo extends Object {
  TripInfo(
      this.mId,
      this.mTitle,
      this.mUserName,
      this.mPassword,
      this.mAboutCountry,
      this.mContacts,
      this.mBackgroundImagePath,
      this.mDayTiles);

  int mId;
  String mTitle;
  String mUserName;
  String mPassword;
  String mAboutCountry;
  List<ContactInfo> mContacts;
  String mBackgroundImagePath;
  List<DayTile> mDayTiles;

  TripInfo.fromTripInfo(TripInfo aTripInfo) {
    this.mId = aTripInfo.mId;
    this.mTitle = aTripInfo.mTitle;
    this.mUserName = aTripInfo.mUserName;
    this.mPassword = aTripInfo.mPassword;
    this.mAboutCountry = aTripInfo.mAboutCountry;
    this.mContacts = aTripInfo.mContacts;
    this.mBackgroundImagePath = aTripInfo.mBackgroundImagePath;
    this.mDayTiles = aTripInfo.mDayTiles;
  }

  void fLog() {
    print("TripInfo:mId=$mId,mTitle=$mTitle,mUserName=$mUserName,"
        "mPassword=$mPassword,mAboutCountry=$mAboutCountry,mContacts=$mContacts,mBackgroundImagePath=$mBackgroundImagePath");
  }

  Map<String, dynamic> toJson() => _$TripInfoToJson(this);

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}

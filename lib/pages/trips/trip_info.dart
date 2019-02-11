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
      this.mBody,
      this.mUserName,
      this.mPassword,
      this.mAboutCountry,
      this.mVisitedPlaces,
      this.mImportantInfo,
      this.mContacts,
      this.mBackgroundImagePath,
      this.mDayTiles);

  int mId;
  String mTitle;
  String mBody;
  String mUserName;
  String mPassword;
  String mAboutCountry;
  List<TileInfo> mVisitedPlaces;
  List<TileInfo> mImportantInfo;
  List<ContactInfo> mContacts;
  String mBackgroundImagePath;
  List<DayTile> mDayTiles;

  TripInfo.fromTripInfo(TripInfo aTripInfo) {
    this.mId = aTripInfo.mId;
    this.mTitle = aTripInfo.mTitle;
    this.mBody = aTripInfo.mBody;
    this.mUserName = aTripInfo.mUserName;
    this.mPassword = aTripInfo.mPassword;
    this.mAboutCountry = aTripInfo.mAboutCountry;
    this.mVisitedPlaces = aTripInfo.mVisitedPlaces;
    this.mImportantInfo = aTripInfo.mImportantInfo;
    this.mContacts = aTripInfo.mContacts;
    this.mBackgroundImagePath = aTripInfo.mBackgroundImagePath;
    this.mDayTiles = aTripInfo.mDayTiles;
  }

  void fLog() {
    print("TripInfo:mId=$mId,mTitle=$mTitle,mBody=$mBody,mUserName=$mUserName,"
        "mPassword=$mPassword,mAboutCountry=$mAboutCountry,mVisitedPlaces=$mVisitedPlaces,mImportantInfo=$mImportantInfo,mContacts=$mContacts,mBackgroundImagePath=$mBackgroundImagePath");
  }

  Map<String, dynamic> toJson() => _$TripInfoToJson(this);

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}

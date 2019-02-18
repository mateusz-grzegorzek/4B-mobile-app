import 'package:business_mobile_app/pages/trips/news/news_info.dart';
import 'package:business_mobile_app/pages/trips/schedule/day_tile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip_info.g.dart';

@JsonSerializable()
class TripInfo extends Object {
  TripInfo(this.mId, this.mTitle, this.mUserName, this.mPassword,
      this.mDayTiles, this.mNewsList);

  int mId;
  String mTitle;
  String mUserName;
  String mPassword;
  List<DayTile> mDayTiles;
  List<NewsInfo> mNewsList;

  TripInfo.fromTripInfo(TripInfo aTripInfo) {
    this.mId = aTripInfo.mId;
    this.mTitle = aTripInfo.mTitle;
    this.mUserName = aTripInfo.mUserName;
    this.mPassword = aTripInfo.mPassword;
    this.mDayTiles = aTripInfo.mDayTiles;
    this.mNewsList = aTripInfo.mNewsList;
  }

  void fLog() {
    print("TripInfo:mId=$mId,mTitle=$mTitle,mUserName=$mUserName,"
        "mPassword=$mPassword");
  }

  Map<String, dynamic> toJson() => _$TripInfoToJson(this);

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}

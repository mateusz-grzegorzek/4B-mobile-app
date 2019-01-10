import 'package:json_annotation/json_annotation.dart';

part 'trip_info.g.dart';

@JsonSerializable()
class TripInfo extends Object with _$TripInfoSerializerMixin {
  TripInfo(this.mId, this.mTitle, this.mBody, this.mUserName, this.mPassword,
      this.mAboutCountry, this.mVisitedPlaces, this.mImportantInfo);

  int mId;
  String mTitle;
  String mBody;
  String mUserName;
  String mPassword;
  String mAboutCountry;
  List<String> mVisitedPlaces;
  List<String> mImportantInfo;

  TripInfo.fromTripInfo(TripInfo aNewsInfo) {
    this.mId = aNewsInfo.mId;
    this.mTitle = aNewsInfo.mTitle;
    this.mBody = aNewsInfo.mBody;
    this.mUserName = aNewsInfo.mUserName;
    this.mPassword = aNewsInfo.mPassword;
    this.mAboutCountry = aNewsInfo.mAboutCountry;
    this.mVisitedPlaces = aNewsInfo.mVisitedPlaces;
    this.mImportantInfo = aNewsInfo.mImportantInfo;
  }

  void fLog() {
    print("TripInfo:mId=$mId,mTitle=$mTitle,mBody=$mBody,mUserName=$mUserName,"
        "mPassword=$mPassword,mAboutCountry=$mAboutCountry,mVisitedPlaces=$mVisitedPlaces,mImportantInfo=$mImportantInfo");
  }

  factory TripInfo.fromJson(Map<String, dynamic> json) =>
      _$TripInfoFromJson(json);
}

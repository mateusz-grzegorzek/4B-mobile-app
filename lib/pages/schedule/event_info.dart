import 'package:json_annotation/json_annotation.dart';

part 'event_info.g.dart';

@JsonSerializable()
class EventInfo extends Object with _$EventInfoSerializerMixin {
  EventInfo(this.mId, this.mTitle, this.mBody, this.mPlaceId, this.mStartTime,
      this.mEndTime);

  int mId;
  String mTitle;
  String mBody;
  int mPlaceId;
  DateTime mStartTime;
  DateTime mEndTime;
  void log() {
    print("EventInfo:" +
        "mId=" +
        mId.toString() +
        "mTitle=" +
        mTitle +
        ",mBody=" +
        mBody +
        ",mPlaceId=" +
        mPlaceId.toString() +
        ",mStartTime=" +
        mStartTime.toString() +
        ",mEndTime=" +
        mEndTime.toString());
  }

  int compareTo(EventInfo aEventInfo) {
    int diff = mStartTime.difference(aEventInfo.mStartTime).inMilliseconds;
    if (diff > 0) {
      return 1;
    } else if (diff == 0) {
      return 0;
    } else {
      return -1;
    }
  }

  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);
}

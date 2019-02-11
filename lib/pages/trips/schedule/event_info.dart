import 'package:json_annotation/json_annotation.dart';

part 'event_info.g.dart';

@JsonSerializable()
class EventInfo extends Object {
  EventInfo(this.mId, this.mTitle, this.mStartTime, this.mEndTime);

  int mId;
  String mTitle;
  DateTime mStartTime;
  DateTime mEndTime;
  void log() {
    print("EventInfo:" +
        "mId=" +
        mId.toString() +
        "mTitle=" +
        mTitle +
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

  Map<String, dynamic> toJson() => _$EventInfoToJson(this);

  factory EventInfo.fromJson(Map<String, dynamic> json) =>
      _$EventInfoFromJson(json);
}

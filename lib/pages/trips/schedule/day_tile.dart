import 'package:business_mobile_app/pages/trips/schedule/event_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_tile.g.dart';

@JsonSerializable()
class DayTile extends Object {
  DayTile(this.mId, this.mDayNumber, this.mEventsList);

  int mId;
  int mDayNumber;
  List<EventInfo> mEventsList;

  void fLog() {
    print("DayTile:mId=$mId,mDayNumber=$mDayNumber");
  }

  factory DayTile.fromJson(Map<String, dynamic> json) =>
      _$DayTileFromJson(json);

  Map<String, dynamic> toJson() => _$DayTileToJson(this);
}

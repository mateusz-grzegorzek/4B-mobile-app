import 'package:json_annotation/json_annotation.dart';
import 'day_events_list_view.dart';
import 'event_info.dart';
import 'schedule_page.dart';

part 'day_events_info.g.dart';

@JsonSerializable()
class DayEventsInfo extends Object with _$DayEventsInfoSerializerMixin {
  DayEventsInfo(this.mDateTime, this.mTitle, this.mEventInfoList);

  DateTime mDateTime;
  String mTitle;
  List<EventInfo> mEventInfoList;

  factory DayEventsInfo.fromJson(Map<String, dynamic> json) =>
      _$DayEventsInfoFromJson(json);
}

DayEventsMap fCreateSplayTreeMapFromDayEventsInfoList(
    List<DayEventsInfo> aDayEventsInfoList) {
  DayEventsMap dayEventsMap = new DayEventsMap(fCompareDayTab);
  List<MapEntry<DayTab, DayEventsListView>> mapEntryList =
      new List<MapEntry<DayTab, DayEventsListView>>();
  aDayEventsInfoList.forEach((dayEventsInfo) {
    DayEventsListView dayEventsListView = new DayEventsListView();
    dayEventsListView.mEventInfoList.addAll(dayEventsInfo.mEventInfoList);
    MapEntry<DayTab, DayEventsListView> mapEntry =
        new MapEntry<DayTab, DayEventsListView>(
            new DayTab(dayEventsInfo.mDateTime, dayEventsInfo.mTitle),
            dayEventsListView);
    mapEntryList.add(mapEntry);
  });
  dayEventsMap.addEntries(mapEntryList);
  return dayEventsMap;
}

List<DayEventsInfo> fCreateDayEventsInfoListFromSplayTreeMap(
    DayEventsMap aDayEventsMap) {
  List<DayEventsInfo> dayEventsInfoList = new List<DayEventsInfo>();
  aDayEventsMap.forEach((dayTab, dayEventsListView) {
    DayEventsInfo dayEventsInfo = new DayEventsInfo(
        dayTab.mDateTime, dayTab.text, dayEventsListView.mEventInfoList);
    dayEventsInfoList.add(dayEventsInfo);
  });
  return dayEventsInfoList;
}

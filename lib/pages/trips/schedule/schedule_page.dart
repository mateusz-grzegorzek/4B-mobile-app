import 'dart:collection';
import 'dart:async';
import 'dart:convert';
import 'dart:core';
import "package:intl/date_symbols.dart";
import 'package:flutter/material.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';
import '../../../utils/widgets/app_bar.dart';
import 'day_events_info.dart';
import 'event_info.dart';
import 'day_events_list_view.dart';

DayEventsMap gDayEventsMap = new DayEventsMap(fCompareDayTab);

class DayEventsMap extends SplayTreeMap<DayTab, DayEventsListView> {
  DayEventsMap(aCompareTo) : super(aCompareTo);
}

class DayTab extends Tab {
  DayTab(this.mDateTime, aTitle) : super(text: aTitle);
  final DateTime mDateTime;
}

void fGetScheduleFromMemory() {
  String scheduleJson = gPrefs.getString(gScheduleDatabaseKey);
  if (scheduleJson != null) {
    List<DayEventsInfo> dayEventsInfoList = new List<DayEventsInfo>();
    json.decode(scheduleJson).forEach((aDayEventsInfo) {
      dayEventsInfoList.add(DayEventsInfo.fromJson(aDayEventsInfo));
    });
    gDayEventsMap
        .addAll(fCreateSplayTreeMapFromDayEventsInfoList(dayEventsInfoList));
  }
}

int fCompareDays(DateTime aLeftDateTime, DateTime aRightDateTime) {
  int diffInYears = aLeftDateTime.year - aRightDateTime.year;
  print("fCompareDays:diffInYears=$diffInYears");
  if (diffInYears > 0) {
    return 1;
  } else if (diffInYears < 0) {
    return -1;
  } else {
    int diffInMonths = aLeftDateTime.month - aRightDateTime.month;
    print("fCompareDays:diffInMonths=$diffInMonths");
    if (diffInMonths > 0) {
      return 1;
    } else if (diffInMonths < 0) {
      return -1;
    } else {
      int diffInDays = aLeftDateTime.day - aRightDateTime.day;
      print("fCompareDays:diffInDays=$diffInDays");
      if (diffInDays > 0) {
        return 1;
      } else if (diffInDays < 0) {
        return -1;
      } else {
        return 0;
      }
    }
  }
}

int fCompareDayTab(DayTab aLeftDayTab, DayTab aRightDayTab) {
  return fCompareDays(aLeftDayTab.mDateTime, aRightDayTab.mDateTime);
}

void fAddEventToList(aEventId, aEventInfo) {
  print("fAddEventToList");
  EventInfo eventInfo = new EventInfo(
      fGetDatabaseId(aEventId, 3),
      aEventInfo["title"],
      aEventInfo["body"],
      aEventInfo["place_id"],
      DateTime.parse(aEventInfo["start_time"]),
      DateTime.parse(aEventInfo["end_time"]));
  eventInfo.log();

  bool dayAlreadyInList = false;
  try {
    gDayEventsMap.forEach((aDayTab, aDayEventsListView) {
      int result = fCompareDays(aDayTab.mDateTime, eventInfo.mStartTime);
      print("fAddEventToList:result=$result");
      if (result == 0) {
        dayAlreadyInList = true;
        aDayEventsListView.mEventInfoList.add(eventInfo);
        aDayEventsListView.mEventInfoList.sort(
            (firstEvent, secondEvent) => firstEvent.compareTo(secondEvent));
        //throw new Exception("dayAlreadyInList"); tu sie cos zjebalo i w debugu zatrzymuje z komunikatem, do naprawy
      }
    });
  } catch (e) {} /* only way to break forEach :P */

  print("fAddEventToList:dayAlreadyInList=" + dayAlreadyInList.toString());
  if (!dayAlreadyInList) {
    String weekday = eventInfo.mStartTime.day.toString() +
        " " +
        en_USSymbols.SHORTMONTHS[eventInfo.mStartTime.month - 1];
    DayTab dayTab = new DayTab(eventInfo.mStartTime, weekday);
    gDayEventsMap[dayTab] = new DayEventsListView();
    gDayEventsMap[dayTab].mEventInfoList.add(eventInfo);
  }
}

class SchedulePage extends StatefulWidget {
  static const String Id = "SchedulePage";
  static const String Title = "Agenda wyjazdu";
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  TabController mTabController;
  StreamSubscription<bool> mStreamSub;

  int fFindTodayDayTabIndex() {
    int index = 0;
    bool indexFound = false;
    try {
      gDayEventsMap.forEach((aDayTab, aDayEventsListView) {
        int result = fCompareDays(aDayTab.mDateTime, DateTime.now());
        if (result == 0) {
          indexFound = true;
          throw new Exception("index");
        }
        index++;
      });
    } on Exception {}
    if (!indexFound) {
      index = 0;
    }
    print("fFindTodayDayTabIndex:index=$index");
    return index;
  }

  @override
  void initState() {
    print("_SchedulePageState:initState");
    super.initState();
    mStreamSub = fGetStream(gScheduleDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_SchedulePageState:dispose");
    super.dispose();
    if (mTabController != null) {
      mTabController.dispose();
    }
    mStreamSub.cancel();
    fCloseStream(gScheduleDatabaseKey);
  }

  @override
  Widget build(BuildContext aContext) {
    print("_SchedulePageState:build:gDays.length=" +
        gDayEventsMap.length.toString());
    if (gDayEventsMap.length > 0) {
      int previousIndex = fFindTodayDayTabIndex();
      if (mTabController != null) {
        previousIndex = mTabController.index;
      }
      mTabController =
          TabController(vsync: this, length: gDayEventsMap.length + 1);
      mTabController.animateTo(previousIndex);
      TabBar dayTabBar = TabBar(
        isScrollable: true,
        controller: mTabController,
        tabs: List.from(gDayEventsMap.keys),
      );

      return Scaffold(
          appBar: fGetDefaultAppBar(SchedulePage.Title),
          body: DefaultTabController(
            length: gDayEventsMap.length + 1,
            child: Scaffold(
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size(0.0, 0.0),
                  child: Container(child: dayTabBar),
                ),
              ),
              body: TabBarView(
                  controller: mTabController,
                  children: List.from(gDayEventsMap.values)),
            ),
          ));
    } else {
      return Scaffold(
        appBar: fGetDefaultAppBar(SchedulePage.Title),
        body: Center(child: new Text("No data...")),
      );
    }
  }
}

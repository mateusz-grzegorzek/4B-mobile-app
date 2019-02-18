import 'dart:async';
import 'dart:core';
import 'package:business_mobile_app/pages/trips/schedule/event_info.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/firebase_data.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/widgets/expand_all_tiles.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

class SchedulePage extends StatefulWidget {
  static const String Id = "SchedulePage";
  static const String Title = "Agenda wyjazdu";
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  var mExpansionTileList = List<GlobalKey<AppExpansionTileState>>();
  StreamSubscription<bool> mStreamSubscription;

  @override
  void initState() {
    print("_SchedulePageState:initState");
    super.initState();
    mStreamSubscription = fGetStream(gTripsDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_SchedulePageState:dispose");
    super.dispose();
    mStreamSubscription.cancel();
    fCloseStream(gTripsDatabaseKey);
  }

  Widget fPrintTime(String time) {
    return Column(
      children: <Widget>[
        fPrintSuperscriptText(time),
      ],
    );
  }

  Widget fBuildTimeRow(DateTime aStartTime, DateTime aEndTime) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        fPrintBoldText(aStartTime.hour.toString()),
        fPrintTime(aStartTime.minute.toString().padLeft(2, '0')),
        fPrintBoldText(" - "),
        fPrintBoldText(aEndTime.hour.toString()),
        fPrintTime(aEndTime.minute.toString().padLeft(2, '0'))
      ],
    );
  }

  Column fBuildEventRow(EventInfo aEventInfo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.all(5)),
            fBuildTimeRow(aEventInfo.mStartTime, aEventInfo.mEndTime)
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 5)),
        fPrintText(aEventInfo.mTitle),
        Padding(padding: EdgeInsets.only(top: 5)),
      ],
    );
  }

  Column fBuildDayTiles() {
    return Column(
        children:
            List<Widget>.generate(fGetDayTilesList().length, (int dayIndex) {
      mExpansionTileList.add(GlobalKey());
      return fBuildExpansionTile(
          mExpansionTileList[dayIndex],
          "Dzień " + fGetDayTilesList()[dayIndex].mDayNumber.toString(),
          List<Widget>.generate(fGetDayTilesList()[dayIndex].mEventsList.length,
              (int eventIndex) {
            return fBuildEventRow(
                fGetDayTilesList()[dayIndex].mEventsList[eventIndex]);
          }));
    }));
  }

  Widget fBuildBody() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintHeadingText("Agenda wyjazdu"),
          Padding(padding: EdgeInsets.all(5)),
          ExpandAllTilesWidget(mExpansionTileList),
          Padding(padding: EdgeInsets.all(5)),
          fBuildDayTiles()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext aContext) {
    mExpansionTileList.clear();
    return fBuildSilverPage(
        "assets/images/trips/las_vegas/schedule_top_image.png",
        fBuildBody(),
        TripsPage.drawer);
  }
}

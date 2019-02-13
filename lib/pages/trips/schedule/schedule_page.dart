import 'dart:core';
import 'package:business_mobile_app/pages/trips/schedule/event_info.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

Widget fBuildExpandAllTiles(
    List<GlobalKey<AppExpansionTileState>> aExpansionTileList) {
  return GestureDetector(
    onTap: () {
      aExpansionTileList.forEach((expansionTile) {
        expansionTile.currentState.expand();
      });
    },
    child: Container(
        height: 52,
        decoration: BoxDecoration(
          border: Border.all(
            color: gBrownColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Row(children: <Widget>[
          Padding(padding: EdgeInsets.all(5)),
          Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: fPrintBoldText("Rozwiń wszystkie informacje")),
          Padding(padding: EdgeInsets.all(10)),
          Image(
              image: AssetImage("assets/images/expand_arrows.png"), height: 20)
        ])),
  );
}

class SchedulePage extends StatefulWidget {
  static const String Id = "SchedulePage";
  static const String Title = "Agenda wyjazdu";
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
  var mExpansionTileList = List<GlobalKey<AppExpansionTileState>>();

  @override
  void initState() {
    print("_SchedulePageState:initState");
    super.initState();
  }

  @override
  void dispose() {
    print("_SchedulePageState:dispose");
    super.dispose();
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
        fPrintBoldText("-"),
        fPrintBoldText(aEndTime.hour.toString()),
        fPrintTime(aEndTime.minute.toString().padLeft(2, '0'))
      ],
    );
  }

  Column fBuildEventRow(EventInfo aEventInfo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.all(5)),
            fBuildTimeRow(aEventInfo.mStartTime, aEventInfo.mEndTime),
            fPrintBoldText(" - "),
            fPrintText(aEventInfo.mTitle)
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }

  Column fBuildDayTiles() {
    return Column(
        children:
            List<Widget>.generate(gTripInfo.mDayTiles.length, (int dayIndex) {
      mExpansionTileList.add(GlobalKey());
      return fBuildExpansionTile(
          mExpansionTileList[dayIndex],
          "Dzień " + gTripInfo.mDayTiles[dayIndex].mDayNumber.toString(),
          List<Widget>.generate(
              gTripInfo.mDayTiles[dayIndex].mEventsList.length,
              (int eventIndex) {
            return fBuildEventRow(
                gTripInfo.mDayTiles[dayIndex].mEventsList[eventIndex]);
          }));
    }));
  }

  Widget fBuildBody() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintHeadingText(" Agenda wyjazdu"),
          Padding(padding: EdgeInsets.all(5)),
          fBuildExpandAllTiles(mExpansionTileList),
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
        "assets/images/trips/las_vegas/schedule_top_image.png", fBuildBody());
  }
}

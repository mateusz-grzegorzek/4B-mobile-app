import 'dart:core';
import 'package:business_mobile_app/pages/trips/schedule/event_info.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import '../../../utils/widgets/app_bar.dart';

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

class SchedulePage extends StatefulWidget {
  static const String Id = "SchedulePage";
  static const String Title = "Agenda wyjazdu";
  @override
  _SchedulePageState createState() => new _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with TickerProviderStateMixin {
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
        fPrintBoldText(" - "),
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

  var expansionTileList = List<GlobalKey<AppExpansionTileState>>();

  Column fBuildDayTiles() {
    return Column(
        children:
            List<Widget>.generate(gTripInfo.mDayTiles.length, (int index) {
      GlobalKey<AppExpansionTileState> expansionTile = GlobalKey();
      expansionTileList.add(expansionTile);
      return AppExpansionTile(
          key: expansionTileList[index],
          trailing: Image(
              image: AssetImage("assets/images/expansion_arrow.png"),
              height: 15),
          title: fPrintBoldText(
              "Dzień " + gTripInfo.mDayTiles[index].mDayNumber.toString()),
          children: List<Widget>.generate(
              gTripInfo.mDayTiles[index].mEventsList.length, (int index2) {
            return fBuildEventRow(
                gTripInfo.mDayTiles[index].mEventsList[index2]);
          }));
    }));
  }

  Widget fBuildExpandAllTiles() {
    return GestureDetector(
      onTap: () {
        expansionTileList.forEach((expansionTile) {
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
                image: AssetImage("assets/images/expand_arrows.png"),
                height: 20)
          ])),
    );
  }

  @override
  Widget build(BuildContext aContext) {
    return Scaffold(
        appBar: fBuildAppBar(
            "assets/images/trips/las_vegas/schedule_top_image.png"),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                fPrintHeadingText(" Agenda wyjazdu"),
                Padding(padding: EdgeInsets.all(5)),
                fBuildExpandAllTiles(),
                Padding(padding: EdgeInsets.all(5)),
                fBuildDayTiles()
              ],
            ),
          ),
        ));
  }
}

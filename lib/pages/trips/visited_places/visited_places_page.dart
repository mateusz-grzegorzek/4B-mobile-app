import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/trips/schedule/schedule_page.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import '../../../utils/widgets/app_bar.dart';

class VisitedPlacesPage extends StatefulWidget {
  static const String Id = "VisitedPlacesPage";
  static const String Title = "Odwiedzane miejsca";
  @override
  _VisitedPlacesPageState createState() => new _VisitedPlacesPageState();
}

class _VisitedPlacesPageState extends State<VisitedPlacesPage> {
  Column fBuildPlace(String aTitle, String aBody, String aImagePath) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(aImagePath),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                fPrintText(
                    aTitle,
                    TextStyle(
                        color: gBrownColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                fPrintJustifiedText(aBody)
              ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: fGetDefaultAppBar(VisitedPlacesPage.Title),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              fPrintHeadingText(" Odwiedzane miejsca"),
              Padding(padding: EdgeInsets.only(top: 10)),
              fBuildPlace(gVisitedPlace1Title, gVisitedPlace1Body,
                  gVisitedPlace1ImagePath),
              fBuildPlace(gVisitedPlace2Title, gVisitedPlace2Body,
                  gVisitedPlace2ImagePath),
              fBuildPlace(gVisitedPlace3Title, gVisitedPlace3Body,
                  gVisitedPlace3ImagePath),
              fBuildPlace(gVisitedPlace4Title, gVisitedPlace4Body,
                  gVisitedPlace4ImagePath),
              fBuildPlace(gVisitedPlace5Title, gVisitedPlace5Body,
                  gVisitedPlace5ImagePath),
              Padding(padding: EdgeInsets.only(top: 10)),
              fBuildButton(() => fChangePage(context, SchedulePage.Id),
                  "Zobacz agendę wyjazdu"),
            ],
          ),
        ));
  }
}

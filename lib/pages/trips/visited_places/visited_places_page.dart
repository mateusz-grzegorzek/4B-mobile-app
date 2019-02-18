import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/pages/trips/schedule/schedule_page.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

class VisitedPlacesPage extends StatelessWidget {
  static const String Id = "VisitedPlacesPage";
  static const String Title = "Odwiedzane miejsca";

  Column fBuildPlace(String aTitle, String aBody, String aImagePath) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(aImagePath),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                fPrintText(
                    aTitle,
                    TextStyle(
                        color: gBrownColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald')),
                fPrintJustifiedText(aBody)
              ]),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }

  Widget fBuildBody(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintHeadingText(" Odwiedzane miejsca"),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildPlace(
              gVisitedPlace1Title, gVisitedPlace1Body, gVisitedPlace1ImagePath),
          fBuildPlace(
              gVisitedPlace2Title, gVisitedPlace2Body, gVisitedPlace2ImagePath),
          fBuildPlace(
              gVisitedPlace3Title, gVisitedPlace3Body, gVisitedPlace3ImagePath),
          fBuildPlace(
              gVisitedPlace4Title, gVisitedPlace4Body, gVisitedPlace4ImagePath),
          fBuildPlace(
              gVisitedPlace5Title, gVisitedPlace5Body, gVisitedPlace5ImagePath),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildButton(() => fChangePage(context, SchedulePage.Id),
              "Zobacz agendę wyjazdu"),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage(
        "assets/images/trips/las_vegas/places/visited_places_top_image.png",
        fBuildBody(context),
        TripsPage.drawer);
  }
}

import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/pages/trips/schedule/schedule_page.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places_las_vegas.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places_thailand.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_place.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/trips_handlers.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

class VisitedPlacesPage extends StatefulWidget {
  static const String Id = "VisitedPlacesPage";
  static const String Title = "Odwiedzane miejsca";

  @override
  _VisitedPlacesPageState createState() => _VisitedPlacesPageState();
}

class _VisitedPlacesPageState extends State<VisitedPlacesPage> {
  List<VisitedPlace> places;
  String appBarImageAssetPath;

  _VisitedPlacesPageState() {
    if (isLasVegasTrip()) {
      places = gVisitedPlacesLasVegas;
      appBarImageAssetPath =
          "assets/images/trips/las_vegas/places/visited_places_top_image.png";
    } else if (isThailandTrip()) {
      places = gVisitedPlacesThailand;
      appBarImageAssetPath = "assets/images/trips/thailand/appbar.jpg";
    }
  }

  Widget fBuildBody(BuildContext context) {
    List<Widget> items = [];
    items.addAll([
      fPrintHeadingText(" Odwiedzane miejsca"),
      Padding(padding: EdgeInsets.only(top: 10)),
    ]);
    items.addAll(places);
    items.addAll([
      Padding(padding: EdgeInsets.only(top: 10)),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: fBuildButton(() => fChangePage(context, SchedulePage.Id),
              "Zobacz agendę wyjazdu")),
      Padding(padding: EdgeInsets.only(top: 20)),
    ]);

    return Container(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage(
        appBarImageAssetPath, fBuildBody(context), TripsPage.drawer);
  }
}

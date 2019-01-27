import '../../trips/trips_page.dart';
import 'package:flutter/material.dart';

class VisitedPlacesWidget extends StatefulWidget {
  @override
  VisitedPlacesPage createState() => new VisitedPlacesPage();
}

class VisitedPlacesPage extends State<VisitedPlacesWidget> {
  static const String Id = "VisitedPlacesPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: gVisitedPlaces.length,
        itemBuilder: (BuildContext context, int index) =>
          gVisitedPlaces[index].fGetTileCard()
      )
    );
  }
}

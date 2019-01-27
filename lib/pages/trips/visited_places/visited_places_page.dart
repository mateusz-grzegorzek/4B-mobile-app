import '../../trips/trips_page.dart';
import 'package:flutter/material.dart';

class VisitedPlacesPage extends StatefulWidget {
  static const String Id = "VisitedPlacesPage";
  @override
  _VisitedPlacesPageState createState() => new _VisitedPlacesPageState();
}

class _VisitedPlacesPageState extends State<VisitedPlacesPage> {
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

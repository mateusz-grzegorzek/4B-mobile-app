import 'package:flutter/material.dart';
import '../../trips/trips_page.dart';
import '../../../utils/widgets/app_bar.dart';

class VisitedPlacesPage extends StatefulWidget {
  static const String Id = "VisitedPlacesPage";
  static const String Title = "Odwiedzane miejsca";
  @override
  _VisitedPlacesPageState createState() => new _VisitedPlacesPageState();
}

class _VisitedPlacesPageState extends State<VisitedPlacesPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: fGetDefaultAppBar(VisitedPlacesPage.Title),
        body: ListView.builder(
            itemCount: gVisitedPlaces.length,
            itemBuilder: (BuildContext context, int index) =>
                gVisitedPlaces[index].fGetTileCard()));
  }
}

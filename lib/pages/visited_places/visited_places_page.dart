import '../trips/trips_page.dart';
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
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gVisitedPlaces[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gVisitedPlaces.length,
      ),
    );
  }
}

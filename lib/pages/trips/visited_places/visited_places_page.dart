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
        padding: const EdgeInsets.all(6.0),
        itemBuilder: (context, index) {
          return new Card(
            child: new ListTile(
              title: new Text(
                gVisitedPlaces[index].mTitle,
                style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
              subtitle: new Text(gVisitedPlaces[index].mBody)
            ));
        }
      )
    );
  }
}

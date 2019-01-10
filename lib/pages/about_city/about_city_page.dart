import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<String> gVisitedPlacesList = new List<String>();

void fGetVisitedPlacesFromMemory() {
  String visitedPlacesJson = gPrefs.getString(gVisitedPlacesDatabaseKey);
  if (visitedPlacesJson != null) {
    dynamic tmp = json.decode(visitedPlacesJson);
    for (var name in tmp) {
      gVisitedPlacesList.add(name);
    }
  }
}

void fAddVisitedPlaceToList(aVisitedPlaceId, aVisitedPlaceInfo) {
  print("FirebaseData:fAddVisitedPlaceToList");
  gVisitedPlacesList.add(aVisitedPlaceInfo);
}

class VisitedPlacesWidget extends StatefulWidget {
  @override
  VisitedPlacesPage createState() => new VisitedPlacesPage();
}

class VisitedPlacesPage extends State<VisitedPlacesWidget> {
  static const String Id = "VisitedPlacesPage";
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("VisitedPlacesPage:initState");
    super.initState();
    mStreamSub = fGetStream(gVisitedPlacesDatabaseKey).listen((aArg) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("VisitedPlacesPage:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gVisitedPlacesDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gVisitedPlacesList[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gVisitedPlacesList.length,
      ),
    );
  }
}

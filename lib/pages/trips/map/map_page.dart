import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';
import 'map_place.dart';

final List<MapPlace> gPlacesList = new List<MapPlace>();

void fGetPlacesFromMemory() {
  String placesJson = gPrefs.getString(gPlacesDatabaseKey);
  if (placesJson != null) {
    gPlacesList.addAll(json.decode(placesJson).map<MapPlace>((mapPlace) {
      return new MapPlace(mapPlace['mId'], mapPlace['mAddress'],
          mapPlace['mName'], mapPlace['mCoordX'], mapPlace['mCoordY']);
    }).toList());
  }
}

void fAddPlaceToList(aPlaceId, aPlaceInfo) {
  int placeId = fGetDatabaseId(aPlaceId, 2);
  print("fAddPlaceToMap:id=$placeId");
  MapPlace place = new MapPlace(placeId, aPlaceInfo['address'],
      aPlaceInfo['name'], aPlaceInfo['coord_x'], aPlaceInfo['coord_y']);
  place.log();
  gPlacesList.add(place);
}

MapPlace fGetPlaceById(int aId) {
  MapPlace mapPlace;
  gPlacesList.forEach((aMapPlace) {
    if (aMapPlace.mId == aId) {
      mapPlace = aMapPlace;
      return;
    }
  });
  return mapPlace;
}

class MapWidget extends StatefulWidget {
  @override
  MapPage createState() => new MapPage();
}

class MapPage extends State<MapWidget> {
  static const String Id = "MapPage";
  StreamSubscription<bool> mStreamSub;

  static void fNavigateTo(double aCoordX, double aCoordY) async {
    print("fNavigateTo:aCoordX=$aCoordX,aCoordY=$aCoordY");
    String googleMapUrl =
        "https://www.google.com/maps/dir/?api=1&destination=$aCoordX,$aCoordY&travelmode=walking";
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not launch Maps';
    }
  }

  @override
  void initState() {
    print("MapPage:initState");
    super.initState();
    mStreamSub = fGetStream(gPlacesDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("MapPage:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gPlacesDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    print("MapPage:build:gPlacesList.length=" + gPlacesList.length.toString());
    gPlacesList.sort((firstMapPlace, secondMapPlace) {
      if (firstMapPlace.mId > secondMapPlace.mId) {
        return 1;
      } else {
        return -1;
      }
    });
    return new Scaffold(
        body: new Column(
      children: <Widget>[
        new Padding(padding: EdgeInsets.all(10.0)),
        new Text(
          "Nawiguj mnie do:",
          style: new TextStyle(fontSize: 30.0),
        ),
        new Expanded(
          child: new ListView.builder(
              itemCount: gPlacesList.length,
              padding: const EdgeInsets.only(top: 10.0),
              itemExtent: 80.0,
              itemBuilder: (context, index) {
                return new Card(
                  child: new ListTile(
                    title: new Text(gPlacesList[index].mName,
                        style: new TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    subtitle: new Text(gPlacesList[index].mAddress),
                    onTap: () => fNavigateTo(
                        gPlacesList[index].mCoordX, gPlacesList[index].mCoordY),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}

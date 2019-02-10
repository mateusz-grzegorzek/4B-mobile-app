import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';
import '../../../utils/widgets/appbars.dart';
import 'map_place.dart';

final List<MapPlace> gPlacesList = new List<MapPlace>();

void fGetPlacesFromMemory() {
  String placesJson = gPrefs.getString(gPlacesDatabaseKey);
  if (placesJson != null) {
    gPlacesList.addAll(json.decode(placesJson).map<MapPlace>((aMapPlace) {
      return MapPlace.fromJson(aMapPlace);
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

class MapPage extends StatefulWidget {
  static const String Id = "MapPage";
  static const String Title = "Mapa";

  static void fNavigateTo(double aCoordX, double aCoordY) async {
    print("fNavigateTo:aCoordX=$aCoordX,aCoordY=$aCoordY");
    String googleMapUrl =
        "https://www.google.com/maps/dir/?api=1&destination=$aCoordX,$aCoordY&travelmode=walking";

    if (Platform.isIOS) {
      try {
        Location location = Location();
        LocationData currentLocation;
        currentLocation = await location.getLocation();
        double originX = currentLocation.latitude;
        double originY = currentLocation.longitude;
        googleMapUrl =
            "https://www.google.com/maps/dir/?api=1&origin=$originX,$originY&destination=$aCoordX,$aCoordY&travelmode=walking";
      } on PlatformException {
        print(
            "fNavigateTo:Lack of location permission or error gathering location");
      }
    }

    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not launch Maps';
    }
  }

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("_MapPageState:initState");
    super.initState();
    mStreamSub = fGetStream(gPlacesDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_MapPageState:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gPlacesDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    print("_MapPageState:build:gPlacesList.length=" +
        gPlacesList.length.toString());
    gPlacesList.sort((firstMapPlace, secondMapPlace) {
      if (firstMapPlace.mId > secondMapPlace.mId) {
        return 1;
      } else {
        return -1;
      }
    });
    return new Scaffold(
        appBar: fGetDefaultAppBar(MapPage.Title),
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
                        onTap: () => MapPage.fNavigateTo(
                            gPlacesList[index].mCoordX,
                            gPlacesList[index].mCoordY),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

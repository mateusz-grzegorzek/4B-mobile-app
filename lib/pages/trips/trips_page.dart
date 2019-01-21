import 'dart:convert';

import '../trips/trip_info.dart';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';
import '../../utils/tile_info.dart';

final List<TripInfo> gTripsList = new List<TripInfo>();
String gAboutCountry;
List<TileInfo> gVisitedPlaces;
List<String> gImportantInfo;

void fGetTripsFromMemory() {
  String tripsJson = gPrefs.getString(gTripsDatabaseKey);
  if (tripsJson != null) {
    gTripsList.addAll(json.decode(tripsJson).map<TripInfo>((aTripInfo) {
      List<TileInfo> visitedPlaces = new List<TileInfo>();
      if (aTripInfo['mVisitedPlaces'] != null) {
        aTripInfo['mVisitedPlaces'].forEach((aVisitedPlace) {
          print(aVisitedPlace.toString());
          visitedPlaces.add(aVisitedPlace);
        });
      }
      List<String> importantInfo = new List<String>();
      if (aTripInfo['mVisitedPlaces'] != null) {
        aTripInfo['mImportantInfo'].forEach((aImportantInfo) {
          importantInfo.add(aImportantInfo);
        });
      }
      return new TripInfo(
          aTripInfo['mId'],
          aTripInfo['mTitle'],
          aTripInfo['mBody'],
          aTripInfo['mUserName'],
          aTripInfo['mPassword'],
          aTripInfo['mAboutCountry'],
          visitedPlaces,
          importantInfo);
    }).toList());
  }
}

void fAddTripToList(aTripId, aTripInfo) {
  int tripId = fGetDatabaseId(aTripId, 2);
  print("FirebaseData:fAddTripToList");
  List<TileInfo> visitedPlaces = new List<TileInfo>();
  aTripInfo["visited_places"].forEach((aCountry, aPlaceText) {
    visitedPlaces.add(new TileInfo(0, "visited_places", aPlaceText["title"],
        aPlaceText["body"])); // #TODO Id to fix
  });
  List<String> importantInfo = new List<String>();
  aTripInfo["important_info"].forEach((aCountry, aInfoText) {
    importantInfo.add(aInfoText);
  });
  TripInfo tripInfo = new TripInfo(
      tripId,
      aTripInfo["title"],
      aTripInfo["body"],
      aTripInfo["user_name"],
      aTripInfo["password"],
      aTripInfo["about_country"],
      visitedPlaces,
      importantInfo);
  tripInfo.fLog();
  gTripsList.add(tripInfo);
}

bool fIsTripLoginDataCorrect(String aUserName, String aPassword) {
  for (TripInfo tripInfo in gTripsList) {
    if (tripInfo.mUserName == aUserName && tripInfo.mPassword == aPassword) {
      gAboutCountry = tripInfo.mAboutCountry; // ToDo: Do it better
      gVisitedPlaces = tripInfo.mVisitedPlaces;
      gImportantInfo = tripInfo.mImportantInfo;
      return true;
    }
  }
  return false;
}

class TripsWidget extends StatefulWidget {
  @override
  TripsPage createState() => new TripsPage();
}

class TripsPage extends State<TripsWidget> {
  static const String Id = "TripsPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: null);
  }
}

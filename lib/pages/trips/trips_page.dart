import 'dart:convert';

import '../trips/trip_info.dart';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<TripInfo> gTripsList = new List<TripInfo>();
String gAboutCountry;
List<String> gVisitedPlaces;

void fGetTripsFromMemory() {
  /*
  String tripsJson = gPrefs.getString(gTripsDatabaseKey);
  if (tripsJson != null) {
    gTripsList.addAll(json.decode(tripsJson).map<TripInfo>((tripInfo) {
      return new TripInfo(
          tripInfo['mId'],
          tripInfo['mTitle'],
          tripInfo['mBody'],
          tripInfo['mUserName'],
          tripInfo['mPassword'],
          tripInfo['mAboutCountry'],
          tripInfo['mVisitedPlaces']);
    }).toList());
  }
  */
}

void fAddTripToList(aTripId, aTripInfo) {
  int tripId = fGetDatabaseId(aTripId, 2);
  print("FirebaseData:fAddTripToList");
  List<String> visitedPlaces = new List<String>();
  aTripInfo["visited_places"].forEach((aCountry, aPlaceText) {
    visitedPlaces.add(aPlaceText);
  });
  TripInfo tripInfo = new TripInfo(
      tripId,
      aTripInfo["title"],
      aTripInfo["body"],
      aTripInfo["user_name"],
      aTripInfo["password"],
      aTripInfo["about_country"],
      visitedPlaces);
  tripInfo.fLog();
  gTripsList.add(tripInfo);
}

bool fIsTripLoginDataCorrect(String aUserName, String aPassword) {
  for (TripInfo tripInfo in gTripsList) {
    if (tripInfo.mUserName == aUserName && tripInfo.mPassword == aPassword) {
      gAboutCountry = tripInfo.mAboutCountry; // ToDo: Do it better
      gVisitedPlaces = tripInfo.mVisitedPlaces;
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

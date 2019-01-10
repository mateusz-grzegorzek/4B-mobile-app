import 'dart:async';
import 'dart:convert';

import '../trips/trip_info.dart';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<TripInfo> gTripsList = new List<TripInfo>();

void fGetTripsFromMemory() {
  String tripsJson = gPrefs.getString(gTripsDatabaseKey);
  if (tripsJson != null) {
    gTripsList.addAll(json.decode(tripsJson).map<TripInfo>((tripInfo) {
      return new TripInfo(tripInfo['mId'], tripInfo['mTitle'],
          tripInfo['mBody'], tripInfo['mUserName'], tripInfo['mPassword']);
    }).toList());
  }
}

void fAddTripToList(aTripId, aTripInfo) {
  int tripId = fGetDatabaseId(aTripId, 2);
  print("FirebaseData:fAddTripToList");
  TripInfo tripInfo = new TripInfo(tripId, aTripInfo["title"],
      aTripInfo["body"], aTripInfo["user_name"], aTripInfo["password"]);
  tripInfo.fLog();
  gTripsList.add(tripInfo);
}

bool fIsTripLoginDataCorrect(String aUserName, String aPassword) {
  for (TripInfo tripInfo in gTripsList) {
    if (tripInfo.mUserName == aUserName && tripInfo.mPassword == aPassword) {
      return true;
    }
  }
  return false;
}

class TripsPageWidget extends StatefulWidget {
  @override
  TripsPage createState() => new TripsPage();
}

class TripsPage extends State<TripsPageWidget> {
  static const String Id = "TripsPageWidget";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView.builder(
            itemCount: gTripsList.length,
            padding: const EdgeInsets.all(6.0),
            itemBuilder: (context, index) {
              return new Card(
                child: new ListTile(
                  title: new Text(gTripsList[index].mTitle,
                      style: new TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                  subtitle: new Text(gTripsList[index].mBody),
                ),
              );
            }));
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';

import '../trips/trip_info.dart';
import '../common/contact/contact_info.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';
import '../../utils/tile_info.dart';

final List<TripInfo> gTripsList = new List<TripInfo>();
String gAboutCountry;
List<TileInfo> gVisitedPlaces;
List<String> gImportantInfo;
List<ContactInfo> gTripContacts;

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
      List<ContactInfo> tripContacts = new List<ContactInfo>();
      if (aTripInfo['mContacts'] != null) {
        aTripInfo['mContacts'].forEach((aTripContacts) {
          tripContacts.add(aTripContacts);
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
          importantInfo,
          tripContacts);
    }).toList());
  }
}

void fAddTripToList(aTripId, aTripInfo) {
  int tripId = fGetDatabaseId(aTripId, 2);
  print("FirebaseData:fAddTripToList");
  List<TileInfo> visitedPlaces = new List<TileInfo>();
  aTripInfo["visited_places"].forEach((aPlaceId, aPlaceText) {
    visitedPlaces.add(new TileInfo(int.parse(aPlaceId), "visited_places", aPlaceText["title"],
        aPlaceText["body"]));
  });
  List<String> importantInfo = new List<String>();
  aTripInfo["important_info"].forEach((aInfoId, aInfoText) {
    importantInfo.add(aInfoText);
  });
  List<ContactInfo> tripContacts = new List<ContactInfo>();
  aTripInfo["contacts"].forEach((aContactInfoId, aContactInfo) {
    tripContacts.add(new ContactInfo(int.parse(aContactInfoId), aContactInfo['name'],
        aContactInfo['description'], aContactInfo['phone_number']));
  });
  TripInfo tripInfo = new TripInfo(
      tripId,
      aTripInfo["title"],
      aTripInfo["body"],
      aTripInfo["user_name"],
      aTripInfo["password"],
      aTripInfo["about_country"],
      visitedPlaces,
      importantInfo,
      tripContacts);
  tripInfo.fLog();
  gTripsList.add(tripInfo);
}

bool fIsTripLoginDataCorrect(String aUserName, String aPassword) {
  for (TripInfo tripInfo in gTripsList) {
    if (tripInfo.mUserName == aUserName && tripInfo.mPassword == aPassword) {
      gAboutCountry = tripInfo.mAboutCountry; // ToDo: Do it better
      gVisitedPlaces = tripInfo.mVisitedPlaces;
      gImportantInfo = tripInfo.mImportantInfo;
      gTripContacts = tripInfo.mContacts;
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

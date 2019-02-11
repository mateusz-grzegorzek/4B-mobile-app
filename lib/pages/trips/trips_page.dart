import 'dart:convert';
import 'package:flutter/material.dart';

import 'trip_info.dart';
import 'map/map_page.dart';
import 'schedule/schedule_page.dart';
import 'news/news_page.dart';
import 'about_country/about_country_page.dart';
import 'visited_places/visited_places_page.dart';
import 'important_info/important_info_page.dart';
import 'contact/contact_page.dart';

import '../common/contact/contact_info.dart';
import '../home/home_page.dart';

import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';
import '../../utils/tile_info.dart';
import '../../utils/widgets/menu_bar.dart';
import '../../utils/widgets/appbars.dart';



final List<TripInfo> gTripsList = new List<TripInfo>();
String gAboutCountry;
List<TileInfo> gVisitedPlaces;
List<TileInfo> gImportantInfo;
List<ContactInfo> gTripContacts;

void fGetTripsFromMemory() {
  String tripsJson = gPrefs.getString(gTripsDatabaseKey);
  if (tripsJson != null) {
    gTripsList.addAll(json.decode(tripsJson).map<TripInfo>((aTripInfo) {
      List<TileInfo> visitedPlaces = new List<TileInfo>();
      if (aTripInfo['mVisitedPlaces'] != null) {
        aTripInfo['mVisitedPlaces'].forEach((aVisitedPlace) {
          visitedPlaces.add(TileInfo.fromJson(aVisitedPlace));
        });
      }
      List<TileInfo> importantInfo = new List<TileInfo>();
      if (aTripInfo['mImportantInfo'] != null) {
        aTripInfo['mImportantInfo'].forEach((aImportantInfo) {
          importantInfo.add(TileInfo.fromJson(aImportantInfo));
        });
      }
      List<ContactInfo> tripContacts = new List<ContactInfo>();
      if (aTripInfo['mContacts'] != null) {
        aTripInfo['mContacts'].forEach((aTripContacts) {
          tripContacts.add(ContactInfo.fromJson(aTripContacts));
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
    visitedPlaces.add(new TileInfo(int.parse(aPlaceId), "visited_places",
        aPlaceText["title"], aPlaceText["body"]));
  });
  List<TileInfo> importantInfo = new List<TileInfo>();
  aTripInfo["important_info"].forEach((aInfoId, aInfoText) {
    importantInfo.add(new TileInfo(int.parse(aInfoId), "important_info",
        aInfoText["title"], aInfoText["body"]));
  });
  List<ContactInfo> tripContacts = new List<ContactInfo>();
  aTripInfo["contacts"].forEach((aContactInfoId, aContactInfo) {
    tripContacts.add(new ContactInfo(
        int.parse(aContactInfoId),
        aContactInfo['name'],
        aContactInfo['description'],
        aContactInfo['phone_number']));
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

class TripsPage extends StatefulWidget {
  static const String Id = "TripsPage";
  static const String Title = "Drogi uczestniku, witamy w aplikacji!";
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final drawer = MenuBar(<MenuItem>[
    MenuItem(AboutCountryPage.Id, AboutCountryPage.Title),
    MenuItem(VisitedPlacesPage.Id, VisitedPlacesPage.Title),
    MenuItem(SchedulePage.Id, SchedulePage.Title),
    MenuItem(ImporatantInfoPage.Id, ImporatantInfoPage.Title),
    MenuItem(NewsPage.Id, NewsPage.Title),
    MenuItem(MapPage.Id, MapPage.Title),
    MenuItem(TripContactPage.Id, TripContactPage.Title),
    MenuItem(HomePage.Id, "Wyloguj się"),
  ]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fGetDefaultAppBar(TripsPage.Title),
      drawer: drawer,
      body: null);
  }
}

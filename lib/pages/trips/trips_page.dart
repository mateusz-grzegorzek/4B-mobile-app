import 'dart:convert';
import 'package:business_mobile_app/pages/trips/schedule/day_tile.dart';
import 'package:business_mobile_app/pages/trips/schedule/event_info.dart';
import 'package:flutter/material.dart';

import 'trip_info.dart';
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
import '../../utils/widgets/app_bar.dart';

final List<TripInfo> gTripsList = List<TripInfo>();
String gAboutCountry;
List<TileInfo> gVisitedPlaces;
List<TileInfo> gImportantInfo;
List<ContactInfo> gTripContacts;

TripInfo gTripInfo;

void fGetTripsFromMemory() {
  String tripsJson = gPrefs.getString(gTripsDatabaseKey);
  if (tripsJson != null) {
    gTripsList.addAll(json.decode(tripsJson).map<TripInfo>((aTripInfo) {
      var tripContacts = List<ContactInfo>();
      if (aTripInfo['mContacts'] != null) {
        aTripInfo['mContacts'].forEach((aTripContacts) {
          tripContacts.add(ContactInfo.fromJson(aTripContacts));
        });
      }
      var dayTiles = List<DayTile>();
      if (aTripInfo['mDayTiles'] != null) {
        aTripInfo['mDayTiles'].forEach((aDayTile) {
          dayTiles.add(DayTile.fromJson(aDayTile));
        });
      }
      return TripInfo(
          aTripInfo['mId'],
          aTripInfo['mTitle'],
          aTripInfo['mUserName'],
          aTripInfo['mPassword'],
          aTripInfo['mAboutCountry'],
          tripContacts,
          aTripInfo['mBackgroundImagePath'],
          dayTiles);
    }).toList());
  }
}

List<dynamic> fSortById(List<dynamic> aList) {
  aList.sort((firstItem, secondItem) {
    if (firstItem.mId > secondItem.mId) {
      return 1;
    } else {
      return -1;
    }
  });
  return aList;
}

List<DayTile> fSortDayTileList(List<DayTile> aDayTiles) {
  aDayTiles = fSortById(aDayTiles);
  aDayTiles.forEach((dayTile) {
    fSortById(dayTile.mEventsList);
  });
  return aDayTiles;
}

void fAddTripToList(aTripId, aTripInfo) {
  int tripId = fGetDatabaseId(aTripId, 2);
  print("FirebaseData:fAddTripToList");
  var tripContacts = List<ContactInfo>();
  aTripInfo["contacts"].forEach((aContactInfoId, aContactInfo) {
    tripContacts.add(ContactInfo(
        int.parse(aContactInfoId),
        aContactInfo['name'],
        aContactInfo['description'],
        aContactInfo['phone_number']));
  });
  var dayTiles = List<DayTile>();
  aTripInfo["schedule"].forEach((aDayTileId, aDayTile) {
    var eventInfoList = List<EventInfo>();
    aDayTile.forEach((aEventId, aEventInfo) {
      eventInfoList.add(EventInfo(
          fGetDatabaseId(aEventId, 2),
          aEventInfo['title'],
          DateTime.parse(aEventInfo["start_time"]),
          DateTime.parse(aEventInfo['end_time'])));
    });
    dayTiles.add(DayTile(fGetDatabaseId(aDayTileId, 2),
        fGetDatabaseId(aDayTileId, 2), eventInfoList));
  });
  dayTiles = fSortDayTileList(dayTiles);
  var tripInfo = TripInfo(
      tripId,
      aTripInfo["title"],
      aTripInfo["user_name"],
      aTripInfo["password"],
      aTripInfo["about_country"],
      tripContacts,
      aTripInfo["background_image_path"],
      dayTiles);
  tripInfo.fLog();
  gTripsList.add(tripInfo);
}

bool fIsTripLoginDataCorrect(String aUserName, String aPassword) {
  if (aUserName.length > 0 && aPassword.length > 0) {
    for (TripInfo tripInfo in gTripsList) {
      if (tripInfo.mUserName == aUserName && tripInfo.mPassword == aPassword) {
        gTripInfo = tripInfo;
        return true;
      }
    }
  }
  return false;
}

class TripsPage extends StatefulWidget {
  static const String Id = "TripsPage";
  static const String Title = "Uczestniku, witamy w aplikacji!";
  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  final drawer = MenuBar(<MenuItem>[
    MenuItem(AboutCountryPage.Id, AboutCountryPage.Title),
    MenuItem(VisitedPlacesPage.Id, VisitedPlacesPage.Title),
    MenuItem(SchedulePage.Id, SchedulePage.Title),
    MenuItem(ImportantInfoPage.Id, ImportantInfoPage.Title),
    MenuItem(NewsPage.Id, NewsPage.Title),
    MenuItem(TripContactPage.Id, TripContactPage.Title),
    MenuItem(HomePage.Id, "Wyloguj się"),
  ]);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: fGetDefaultAppBar(TripsPage.Title),
      drawer: drawer,
      body: new Container(
          decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(gTripInfo.mBackgroundImagePath),
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}

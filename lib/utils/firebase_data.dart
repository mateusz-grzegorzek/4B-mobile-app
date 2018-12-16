import 'dart:async';
import 'dart:convert';
import 'shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import '../pages/about_country/about_country_page.dart';
import '../pages/contact/contact_page.dart';
import '../pages/map/map_page.dart';
import '../pages/schedule/day_events_info.dart';
import '../pages/news/news_page.dart';
import '../pages/schedule/schedule_page.dart';
import '../pages/about_us/about_us_page.dart';
import '../pages/trips/trips_page.dart';
import '../pages/about_city/about_city_page.dart';

const String gNewsDatabaseKey = "news";
const String gScheduleDatabaseKey = "schedule";
const String gPlacesDatabaseKey = "places";
const String gContactsDatabaseKey = "contacts";
const String gLinksDatabaseKey = "links";
const String gAboutUsDatabaseKey = "about_us";
const String gTeamDatabaseKey = "team";
const String gTripsDatabaseKey = "trips";
const String gAboutCountryDatabaseKey = "about_country";
const String gAboutCityDatabaseKey = "about_city";

class FirebaseData {
  StreamController<bool> mStreamController;
  StreamSubscription<Event> mSubscription;
  DatabaseReference mRef;

  FirebaseData(String aDatabaseKey, dynamic aFunction, dynamic globalVariable) {
    mStreamController = new StreamController.broadcast();
    mRef = FirebaseDatabase.instance.reference().child(aDatabaseKey);
    mSubscription = mRef.onValue.listen((Event event) {
      print("FirebaseDataController:fSubscribe:listen:" + aDatabaseKey);
      globalVariable.clear();
      event.snapshot.value.forEach(aFunction);
      String globalVariableJson;
      if (aDatabaseKey != gScheduleDatabaseKey) {
        globalVariableJson = json.encode(globalVariable);
      } else {
        globalVariableJson = json
            .encode(fCreateDayEventsInfoListFromSplayTreeMap(gDayEventsMap));
      }
      gPrefs.setString(aDatabaseKey, globalVariableJson);
      mStreamController.add(true);
    });
  }

  void fClose() {
    mStreamController.close();
    mSubscription.cancel();
  }
}

Map<String, FirebaseData> gFirebaseDataMap = new Map<String, FirebaseData>();

void fInitFirebaseData() {
  gFirebaseDataMap[gNewsDatabaseKey] =
      new FirebaseData(gNewsDatabaseKey, fAddNewsToList, gNewsList);
  gFirebaseDataMap[gScheduleDatabaseKey] =
      new FirebaseData(gScheduleDatabaseKey, fAddEventToList, gDayEventsMap);
  gFirebaseDataMap[gPlacesDatabaseKey] =
      new FirebaseData(gPlacesDatabaseKey, fAddPlaceToList, gPlacesList);
  gFirebaseDataMap[gContactsDatabaseKey] =
      new FirebaseData(gContactsDatabaseKey, fAddContactToList, gContactsList);
  gFirebaseDataMap[gAboutUsDatabaseKey] =
      new FirebaseData(gAboutUsDatabaseKey, fAddAboutUsToList, gAboutUsList);
  gFirebaseDataMap[gTripsDatabaseKey] =
      new FirebaseData(gTripsDatabaseKey, fAddTripToList, gTripsList);
  gFirebaseDataMap[gAboutCountryDatabaseKey] = new FirebaseData(
      gAboutCountryDatabaseKey, fAddAboutCountryToList, gAboutCountryList);
  gFirebaseDataMap[gAboutCityDatabaseKey] = new FirebaseData(
      gAboutCityDatabaseKey, fAddAboutCityToList, gAboutCityList);
}

Stream<bool> fGetStream(String key) {
  return gFirebaseDataMap[key].mStreamController.stream;
}

void fCloseStream(String key) {
  gFirebaseDataMap[key].mStreamController.close();
}

int fGetDatabaseId(dynamic aDatabaseId, int aDecimalsNumber) {
  String databaseIdString = aDatabaseId.toString();
  return int.parse(
      databaseIdString.substring(databaseIdString.length - aDecimalsNumber));
}

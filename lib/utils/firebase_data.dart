import 'dart:async';
import 'dart:convert';
import 'shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import '../pages/home/contact/contact_page.dart';
import '../pages/trips/map/map_page.dart';
import '../pages/trips/schedule/day_events_info.dart';
import '../pages/trips/news/news_page.dart';
import '../pages/trips/schedule/schedule_page.dart';
import '../pages/trips/trips_page.dart';

const String gNewsDatabaseKey = "news";
const String gScheduleDatabaseKey = "schedule";
const String gPlacesDatabaseKey = "places";
const String gContactsDatabaseKey = "contacts";
const String gLinksDatabaseKey = "links";
const String gTeamDatabaseKey = "team";
const String gTripsDatabaseKey = "trips";

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
  gFirebaseDataMap[gTripsDatabaseKey] =
      new FirebaseData(gTripsDatabaseKey, fAddTripToList, gTripsList);
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

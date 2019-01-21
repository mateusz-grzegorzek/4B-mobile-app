import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/generic/contact/contact_page.dart';
import '../pages/trips/map/map_page.dart';
import '../pages/trips/news/news_page.dart';
import '../pages/trips/schedule/schedule_page.dart';
import '../pages/trips/trips_page.dart';

SharedPreferences gPrefs;

Future fInitSharedPreferences() async {
  gPrefs = await SharedPreferences.getInstance();
  fGetNewsFromMemory();
  fGetPlacesFromMemory();
  fGetScheduleFromMemory();
  fGetContactsFromMemory();
  fGetTripsFromMemory();
}

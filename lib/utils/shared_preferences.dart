import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/contact/contact_page.dart';
import '../pages/map/map_page.dart';
import '../pages/news/news_page.dart';
import '../pages/schedule/schedule_page.dart';
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

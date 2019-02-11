import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/home/contact/contact_page.dart';
import '../pages/trips/map/map_page.dart';
import '../pages/trips/news/news_page.dart';
import '../pages/trips/trips_page.dart';

SharedPreferences gPrefs;

Future fInitSharedPreferences() async {
  gPrefs = await SharedPreferences.getInstance();
  if (!Platform.isIOS) {
    // TODO fix platform specific code
    fGetNewsFromMemory();
    fGetPlacesFromMemory();
    fGetContactsFromMemory();
    //fGetTripsFromMemory(); // ToDo: in progress
  }
}

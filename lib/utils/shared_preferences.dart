import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/trips/trips_page.dart';

SharedPreferences gPrefs;

Future fInitSharedPreferences() async {
  gPrefs = await SharedPreferences.getInstance();
  if (!Platform.isIOS) {
    // TODO fix platform specific code
    //fGetNewsFromMemory();
    //fGetContactsFromMemory();
    fGetTripsFromMemory(); // ToDo: in progress
  }
}

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:business_mobile_app/pages/home/contact/contact_page.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';

SharedPreferences gPrefs;

Future fInitSharedPreferences() async {
  gPrefs = await SharedPreferences.getInstance();
  fGetContactsFromMemory();
  fGetTripsFromMemory();
}

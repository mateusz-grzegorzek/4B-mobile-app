import 'package:flutter/material.dart';
import 'utils/firebase_data.dart';
import 'utils/shared_preferences.dart';

import 'pages/home/home_page.dart';
import 'pages/home/about_us/about_us_page.dart';
import 'pages/home/offer/offer_page.dart';
import 'pages/home/login/login_page.dart';
import 'pages/home/contact/contact_page.dart';

import 'pages/trips/trips_page.dart';
import 'pages/trips/about_country/about_country_page.dart';
import 'pages/trips/visited_places/visited_places_page.dart';
import 'pages/trips/schedule/schedule_page.dart';
import 'pages/trips/important_info/important_info_page.dart';
import 'pages/trips/news/news_page.dart';
import 'pages/trips/map/map_page.dart';
import 'pages/trips/contact/contact_page.dart';

void main() {
  fInitSharedPreferences();
  fInitFirebaseData();
  runApp(BusinessMobileApp());
}

class BusinessMobileApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    // HOME
    HomePage.Id: (context) => HomePage(),
    AboutUsPage.Id: (context) => AboutUsPage(),
    OfferPage.Id: (context) => OfferPage(),
    LoginPage.Id: (context) => LoginPage(),
    MainContactPage.Id: (context) => MainContactPage(),
    // TRIPS
    TripsPage.Id: (context) => TripsPage(),
    AboutCountryPage.Id: (context) => AboutCountryPage(),
    VisitedPlacesPage.Id: (context) => VisitedPlacesPage(),
    SchedulePage.Id: (context) => SchedulePage(),
    ImporatantInfoPage.Id: (context) => ImporatantInfoPage(),
    NewsPage.Id: (context) => NewsPage(),
    MapPage.Id: (context) => MapPage(),
    TripContactPage.Id: (context) => TripContactPage(),
  };

  @override
  Widget build(BuildContext context) {
    print("4B Mobile App started");
    return MaterialApp(
        title: '4B Mobile App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: routes);
  }
}

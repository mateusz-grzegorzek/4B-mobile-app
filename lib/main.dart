import 'package:flutter/material.dart';
import 'utils/firebase_data.dart';
import 'utils/firebase_messaging.dart';
import 'utils/shared_preferences.dart';
import 'pages/home/home_page.dart';

void main() async {
  await fInitSharedPreferences();
  fInitFirebaseData();
  fInitFirebaseMessaging();
  runApp(new BusinessMobileApp());
}

class BusinessMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("4B Mobile App started");
    return new MaterialApp(
        title: '4B Mobile App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new HomePageWidget());
  }
}

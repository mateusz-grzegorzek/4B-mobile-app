import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<String> gAboutCityList = new List<String>();

void fGetAboutCityFromMemory() {
  String aboutCityJson = gPrefs.getString(gAboutCityDatabaseKey);
  if (aboutCityJson != null) {
    dynamic tmp = json.decode(aboutCityJson);
    for (var name in tmp) {
      gAboutCityList.add(name);
    }
  }
}

void fAddAboutCityToList(aAboutCityId, aAboutCityInfo) {
  print("FirebaseData:fAddAboutCityToList");
  gAboutCityList.add(aAboutCityInfo);
}

class AboutCityPageWidget extends StatefulWidget {
  static const String Id = "AboutCityPageWidget";
  const AboutCityPageWidget({Key aKey}) : super(key: aKey);
  @override
  AboutCityPage createState() => new AboutCityPage();
}

class AboutCityPage extends State<AboutCityPageWidget> {
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("AboutCity:initState");
    super.initState();
    mStreamSub = fGetStream(gAboutCityDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("AboutCity:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gAboutCityDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gAboutCityList[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gAboutCityList.length,
      ),
    );
  }
}

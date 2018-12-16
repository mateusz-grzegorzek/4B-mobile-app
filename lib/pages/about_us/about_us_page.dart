import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<String> gAboutUsList = new List<String>();

void fGetAboutUsFromMemory() {
  String aboutUsJson = gPrefs.getString(gAboutUsDatabaseKey);
  if (aboutUsJson != null) {
    dynamic tmp = json.decode(aboutUsJson);
    for (var name in tmp) {
      gAboutUsList.add(name);
    }
  }
}

class AboutUsPageWidget extends StatefulWidget {
  static const String Id = "AboutUsPageWidget";
  const AboutUsPageWidget({Key aKey}) : super(key: aKey);
  @override
  AboutUsPage createState() => new AboutUsPage();
}

void fAddAboutUsToList(aAboutUsId, aAboutUsInfo) {
  print("FirebaseData:fAddAboutUsToList");
  gAboutUsList.add(aAboutUsInfo);
}

class AboutUsPage extends State<AboutUsPageWidget> {
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("AboutUs:initState");
    super.initState();
    mStreamSub = fGetStream(gAboutUsDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("AboutUs:dispose");
    super.dispose();
    mStreamSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gAboutUsList[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gAboutUsList.length,
      ),
    );
  }
}

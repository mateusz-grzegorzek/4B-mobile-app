import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

final List<String> gAboutCountryList = new List<String>();

void fGetAboutCountryFromMemory() {
  String aboutCountryJson = gPrefs.getString(gAboutCountryDatabaseKey);
  if (aboutCountryJson != null) {
    dynamic tmp = json.decode(aboutCountryJson);
    for (var name in tmp) {
      gAboutCountryList.add(name);
    }
  }
}

void fAddAboutCountryToList(aAboutCountryId, aAboutCountryInfo) {
  print("FirebaseData:fAddAboutCountryToList");
  gAboutCountryList.add(aAboutCountryInfo);
}

class AboutCountryWidget extends StatefulWidget {
  @override
  AboutCountryPage createState() => new AboutCountryPage();
}

class AboutCountryPage extends State<AboutCountryWidget> {
  static const String Id = "AboutCountryPage";

  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("AboutCountry:initState");
    super.initState();
    mStreamSub = fGetStream(gAboutCountryDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("AboutCountry:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gAboutCountryDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gAboutCountryList[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gAboutCountryList.length,
      ),
    );
  }
}

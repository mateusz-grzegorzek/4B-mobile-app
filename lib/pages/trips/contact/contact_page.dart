import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:business_mobile_app/pages/common/contact/contact_list.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/utils/firebase_data.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/trips_handlers.dart';

class TripContactPage extends StatefulWidget {
  static const String Id = "TripContactPage";
  static const String Title = "Kontakt";
  @override
  _TripContactPageState createState() => new _TripContactPageState();
}

class _TripContactPageState extends State<TripContactPage> {
  StreamSubscription<bool> mStreamSubscription;

  @override
  void initState() {
    print("_NewsPageState:initState");
    super.initState();
    mStreamSubscription = fGetStream(gTripsDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_NewsPageState:dispose");
    super.dispose();
    mStreamSubscription.cancel();
    fCloseStream(gTripsDatabaseKey);
  }

  Widget fBuildContacts(var contacts) {
    if (contacts.length == 0) {
      return Container(
        child: Row(
          children: <Widget>[
            Expanded(child: fPrintText("Informacje zostaną podane wkrótce"))
          ],
        ),
      );
    }
    return ContactListWidget(mContactsList: contacts);
  }

  Widget fBuildHotelInfo() {
    if (isLasVegasTrip()) {
      return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fPrintText("EXCALIBUR HOTEL & CASINO***"),
            fPrintText("3850 S Las Vegas Blvd")
          ],
        ),
        onTap: () => launch("https://goo.gl/maps/p9rh5spB3nk"),
      );
    } else if (isThailandTrip()) {
      return Column(children: <Widget>[
        GestureDetector(
          child: Row(
            children: <Widget>[
              Expanded(child: fPrintText("Bangkok: Hotel Amara 5*"))
            ],
          ),
          onTap: () => launch("https://goo.gl/maps/EdaeRZKBddL2"),
        ),
        Padding(
          padding: EdgeInsets.all(10),
        ),
        GestureDetector(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: fPrintText(
                      "Pattaya: Hotel Ravindra Beach Resort & Spa 4*"))
            ],
          ),
          onTap: () => launch("https://goo.gl/maps/AV65aivaFtz"),
        ),
      ]);
    }
  }

  Widget fBuildBody() {
    var coordinators = fGetContactsList()
        .where((item) => item.mDescription == "coordinator")
        .toList();
    var guides = fGetContactsList()
        .where((item) => item.mDescription == "guide")
        .toList();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10)),
            fPrintHeadingText(TripContactPage.Title),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Koordynatorzy wyjazdu"),
            ),
            fBuildContacts(coordinators),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Przewodnik"),
            ),
            fBuildContacts(guides),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Adres hotelu"),
            ),
            fBuildHotelInfo(),
            Padding(padding: EdgeInsets.only(top: 20))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    var appBarImageAssetPath;
    if (isLasVegasTrip()) {
      appBarImageAssetPath = "assets/images/appbars/trip_contacts.png";
    } else if (isThailandTrip()) {
      appBarImageAssetPath =
          "assets/images/trips/thailand/appbar.jpg";
    }
    return fBuildSilverPage(
        appBarImageAssetPath, fBuildBody(), TripsPage.drawer);
  }
}

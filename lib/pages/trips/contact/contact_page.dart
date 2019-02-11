import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../trips_page.dart';
import '../../common/contact/contact_list.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/widgets/app_bar.dart';

class TripContactPage extends StatefulWidget {
  static const String Id = "TripContactPage";
  static const String Title = "Kontakt";
  @override
  _TripContactPageState createState() => new _TripContactPageState();
}

class _TripContactPageState extends State<TripContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: fGetDefaultAppBar(TripContactPage.Title),
        body: Center(
            child: ListView(
          children: <Widget>[
            ContactListWidget(
              mDatabaseKey: gTripsDatabaseKey,
              mContactsList: gTripContacts,
            ),
            HotelInformationCard()
          ],
        )));
  }
}

class HotelInformationCard extends StatelessWidget {
  final String name = "EXCALIBUR HOTEL & CASINO***";
  final String phoneNumber = "+17025977777";
  final String locationLink = "https://goo.gl/maps/p9rh5spB3nk";
  final List address = [
    "3850 S Las Vegas Blvd, Las Vegas",
    "NV 89109, Stany Zjednoczone"
  ];

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new Column(
      children: <Widget>[
        fBuildHotelName(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[fBuildAddress(), fBuildContactColumn()],
        )
      ],
    ));
  }

  Text fBuildHotelName() {
    return new Text(
      name,
      style: new TextStyle(
          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18.0),
    );
  }

  Container fBuildAddress() {
    return new Container(
      child: new Flexible(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: address.map((item) => new Text(item)).toList()),
      ),
    );
  }

  Container fBuildContactColumn() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.phone),
            onPressed: () => launch("tel://" + phoneNumber),
          ),
          new IconButton(
            icon: Icon(Icons.map),
            onPressed: () => launch(locationLink),
          )
        ],
      ),
    );
  }
}

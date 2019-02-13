import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import '../../../utils/fonts.dart';
import '../../../utils/print.dart';

class TripContactPage extends StatefulWidget {
  static const String Id = "TripContactPage";
  static const String Title = "Kontakt";
  @override
  _TripContactPageState createState() => new _TripContactPageState();
}

class _TripContactPageState extends State<TripContactPage> {
  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage("assets/images/appbars/trip_contacts.png",
        fBuildBody(), TripsPage.drawer);
  }

  Widget fBuildBody() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fPrintHeadingText(TripContactPage.Title),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Koordynatorzy wyjazdu"),
            ),
            fBuildContactInfo("Grzegorz Bartosz", "+48 602 462 677"),
            fBuildContactInfo("Katarzyna Drążek", "+48 796 109 610"),
            Divider(height: 10, color: gBrownColor),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Przewodnik"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: fPrintText("Informacje zostaną podane już wkrótce"),
            ),
            Divider(height: 10, color: gBrownColor),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: fPrintBoldText("Adres hotelu"),
            ),
            GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  fPrintText("EXCALIBUR HOTEL & CASINO***"),
                  fPrintText("3850 S Las Vegas Blvd")
                ],
              ),
              onTap: () => launch("https://goo.gl/maps/p9rh5spB3nk"),
            )
          ],
        ));
  }

  Widget fBuildContactInfo(String name, String phoneNumber) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintText(name, gMenuItemTextStyle),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Row(
                children: <Widget>[
                  fBuildImage("assets/images/contacts/phone.png", 20),
                  Padding(padding: EdgeInsets.only(left: 20.0)),
                  GestureDetector(
                    child: fPrintText("tel. " + phoneNumber),
                    onTap: () => launch("tel://" + phoneNumber),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

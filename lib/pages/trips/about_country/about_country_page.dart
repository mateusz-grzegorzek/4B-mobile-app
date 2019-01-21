import '../trips_page.dart';
import 'package:flutter/material.dart';

class AboutCountryWidget extends StatefulWidget {
  @override
  AboutCountryPage createState() => new AboutCountryPage();
}

class AboutCountryPage extends State<AboutCountryWidget> {
  static const String Id = "AboutCountryPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                child: new Center(
                    child: Column(children: <Widget>[
                  new Text(gAboutCountry,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold))
                ])))));
  }
}

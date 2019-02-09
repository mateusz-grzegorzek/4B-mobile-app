import 'package:flutter/material.dart';
import '../trips_page.dart';
import '../../../utils/widgets/appbars.dart';

class AboutCountryPage extends StatefulWidget {
  static const String Id = "AboutCountryPage";
  static const String Title = "O kraju";
  @override
  _AboutCountryPageState createState() => new _AboutCountryPageState();
}

class _AboutCountryPageState extends State<AboutCountryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(AboutCountryPage.Title),
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

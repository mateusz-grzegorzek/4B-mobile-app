import 'package:business_mobile_app/utils/widgets/appbars.dart';
import 'package:flutter/material.dart';

import 'offer/offer_page.dart';
import 'about_us/about_us_page.dart';
import 'login/login_page.dart';
import 'contact/contact_page.dart';

import '../../utils/widgets/menu_bar.dart';
import '../../utils/fonts.dart';

class HomePage extends StatefulWidget {
  static const String Id = "HomePage";
  static const String Title = "4Business Team";
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext aContext) {
    final body = new Center(
      child: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(40)),
          new Container(
            child: new Image(
              image: AssetImage("assets/images/logo_white.png"),
              width: 150,
            ),
          ),
          new Padding(padding: EdgeInsets.all(40)),
          new Text(
            "Lider wyjazdów w Polsce",
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontFamily: 'Amithen',
                color: gBrownColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    final drawer = new MenuBar(<MenuItem>[
      MenuItem(AboutUsPage.Id, AboutUsPage.Title),
      MenuItem(OfferPage.Id, OfferPage.Title),
      MenuItem(MainContactPage.Id, MainContactPage.Title),
      MenuItem(LoginPage.Id, LoginPage.Title)
    ]);

    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(),
        drawer: drawer,
        body: body);
  }
}

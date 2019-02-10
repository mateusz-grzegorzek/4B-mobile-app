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
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext aContext) {
    final body = Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(40)),
          Container(
            child: Image(
              image: AssetImage("assets/images/logo_white.png"),
              width: 150,
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
          Text(
            "Lider wyjazdów w Polsce",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Amithen',
                color: gBrownColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    final drawer = MenuBar(<MenuItem>[
      MenuItem(AboutUsPage.Id, AboutUsPage.Title),
      MenuItem(OfferPage.Id, OfferPage.Title),
      MenuItem(MainContactPage.Id, MainContactPage.Title),
      MenuItem(LoginPage.Id, LoginPage.Title)
    ]);

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(),
        drawer: drawer,
        body: body);
  }
}

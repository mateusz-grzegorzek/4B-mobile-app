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
    final appBar = new PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/app_bar_image.png"),
            fit: BoxFit.cover,
          )),
          child: AppBar(
            title: new Text(HomePage.Title, style: new TextStyle(color: gGoldColor)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ));

    final body = new Center(
      child: Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(40)),
          new Container(
            child: new Image(image: AssetImage("assets/images/logo_white.png")),
          ),
          new Padding(padding: EdgeInsets.all(40)),
          new Text(
            "Lider wyjazdów w Polsce",
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: gGoldColor, fontSize: 20.0, fontWeight: FontWeight.bold),
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
        appBar: appBar,
        drawer: drawer,
        body: body);
  }
}

import 'dart:async';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:flutter/material.dart';
import '../offer/offer_page.dart';
import '../welcome/welcome_page.dart';
import '../map/map_page.dart';
import '../schedule/schedule_page.dart';
import '../contact/contact_page.dart';
import '../news/news_page.dart';
import '../about_us/about_us_page.dart';
import '../login/login_page.dart';
import '../about_country/about_country_page.dart';
import '../about_city/about_city_page.dart';

HomePage gHomePage = new HomePage();
Color gGoldColor = Color(0xffffd700);

class MenuItem extends StatelessWidget {
  MenuItem(this.mId, this.mTitle, this.mPage, this.mVisibleWhenLogged);
  final String mId;
  final String mTitle;
  final Widget mPage;
  final bool mVisibleWhenLogged;

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new ListTile(
            title: new Text(mTitle,
                style: new TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
            onTap: () {
              gHomePage.fChangePage(mId);
              Navigator.pop(context);
            }));
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  HomePage createState() => gHomePage;
}

class HomePage extends State<HomePageWidget> {
  Map<String, MenuItem> mPageWidgetsMapAll = new Map<String, MenuItem>();
  Map<String, MenuItem> mPageWidgetsMapVisible = new Map<String, MenuItem>();
  bool mIsLogged = false;
  String mTitle;
  Widget mHomePageBody;

  @override
  void initState() {
    print("HomePage:initState");
    super.initState();

    mPageWidgetsMapAll[WelcomePage.Id] = new MenuItem(
        WelcomePage.Id, "4Business Team", new WelcomePageWidget(), false);
    mPageWidgetsMapAll[AboutUsPage.Id] = new MenuItem(
        AboutUsPage.Id, "O 4Business", new AboutUsPageWidget(), false);
    mPageWidgetsMapAll[OfferPage.Id] =
        new MenuItem(OfferPage.Id, "Oferta", new OfferPageWidget(), false);
    mPageWidgetsMapAll[ContactPage.Id] =
        new MenuItem(ContactPage.Id, "Kontakt", new ContactPageWidget(), false);
    mPageWidgetsMapAll[LoginPage.Id] =
        new MenuItem(LoginPage.Id, "Zaloguj się", new LoginPageWidget(), false);

    mPageWidgetsMapAll[SchedulePageWidget.Id] = new MenuItem(
        SchedulePageWidget.Id,
        "Program wyjazdu",
        new SchedulePageWidget(),
        true);
    mPageWidgetsMapAll[AboutCountryPageWidget.Id] = new MenuItem(
        AboutCountryPageWidget.Id,
        "O kraju",
        new AboutCountryPageWidget(),
        true);
    mPageWidgetsMapAll[AboutCityPageWidget.Id] = new MenuItem(
        AboutCityPageWidget.Id, "O mieście", new AboutCityPageWidget(), true);
    mPageWidgetsMapAll[NewsPageWidget.ImpId] = new MenuItem(
        NewsPageWidget.ImpId, "Ważne informacje", new NewsPageWidget(), true);
    mPageWidgetsMapAll[NewsPageWidget.Id] = new MenuItem(
        NewsPageWidget.Id, "Aktualności", new NewsPageWidget(), true);
    mPageWidgetsMapAll[MapPageWidget.Id] =
        new MenuItem(MapPageWidget.Id, "Mapa", new MapPageWidget(), true);
    fSetPage(WelcomePage.Id);
  }

  @override
  void dispose() {
    print("HomePage:dispose");
    super.dispose();
  }

  static Future<Null> fShowAlert(
      BuildContext context, String aTitle, String aBody) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(aTitle),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[new Text(aBody)],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext aContext) {
    print("HomePage:build:mIsLogged=" + mIsLogged.toString());
    mPageWidgetsMapVisible.clear();
    mPageWidgetsMapAll.forEach((id, menuItem) {
      if (mIsLogged == menuItem.mVisibleWhenLogged &&
          mPageWidgetsMapAll[id].mId != WelcomePage.Id) {
        mPageWidgetsMapVisible[id] = menuItem;
      }
    });

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(mTitle),
        ),
        drawer: new Drawer(
          child: new ListView(
              padding: new EdgeInsets.fromLTRB(15.0, 50.0, 50.0, 0.0),
              children: mPageWidgetsMapVisible.values.toList()),
        ),
        body: mHomePageBody);
  }

  void fSetPage(String aId) {
    mTitle = mPageWidgetsMapAll[aId].mTitle;
    mHomePageBody = mPageWidgetsMapAll[aId].mPage;
  }

  void fChangePage(String aId) {
    print("HomePage:fChangePage:aId=" + aId);
    fSetPage(aId);
    setState(() {});
  }

  void fOnLoginSuccess() {
    print("HomePage:fOnLoginSuccess");
    mIsLogged = true;
    fShowAlert(context, "Sukces!", "Zalogowano pomyślnie!");
    fChangePage(TripsPage.Id);
  }
}

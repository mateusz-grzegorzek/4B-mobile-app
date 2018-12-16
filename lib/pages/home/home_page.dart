import 'dart:async';
import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../map/map_page.dart';
import '../schedule/schedule_page.dart';
import '../contact/contact_page.dart';
import '../news/news_page.dart';
import '../about_us/about_us_page.dart';
import '../team/team_page.dart';
import '../trips/trips_page.dart';
import '../login/login_page.dart';
import '../about_country/about_country_page.dart';
import '../about_city/about_city_page.dart';

HomePage gHomePage = new HomePage();

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
  HomePageWidget({Key aKey}) : super(key: aKey);

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

    mPageWidgetsMapAll[LoginPageWidget.Id] = new MenuItem(
        LoginPageWidget.Id, "Zaloguj się", new LoginPageWidget(), false);
    mPageWidgetsMapAll[AboutUsPageWidget.Id] = new MenuItem(
        AboutUsPageWidget.Id, "O nas", new AboutUsPageWidget(), false);
    mPageWidgetsMapAll[TeamPageWidget.Id] =
        new MenuItem(TeamPageWidget.Id, "Zespół", new TeamPageWidget(), false);
    mPageWidgetsMapAll[TripsPageWidget.Id] = new MenuItem(
        TripsPageWidget.Id, "Polecane wyjazdy", new TripsPageWidget(), false);

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
    mPageWidgetsMapAll[ContactPageWidget.Id] = new MenuItem(
        ContactPageWidget.Id, "Kontakt", new ContactPageWidget(), true);
    fSetPage(LoginPageWidget.Id);
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
      if (mIsLogged == menuItem.mVisibleWhenLogged) {
        mPageWidgetsMapVisible[id] = menuItem;
      }
    });
    /*
      w = [
        new MenuItem("Program wyjazdu", mSchedulePageWidget),
        new MenuItem("O kraju", mAboutUsPageWidget),
        new MenuItem("O mieście", mAboutUsPageWidget),
        new MenuItem("Ważne informacje przed wyjazdem", mAboutUsPageWidget),
        new MenuItem("Aktualności", mNewsPageWidget),
        new MenuItem("Mapa", mMapPageWidget),
        new MenuItem("Kontakt", mContactPageWidget),
      ];
      */

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
    fChangePage(SchedulePageWidget.Id);
  }
}

import 'package:business_mobile_app/pages/home/offer/football/football_page.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets/appbars.dart';

class Event {
  Event(this.mWidget, this.mImagePath);
  Widget mWidget;
  String mImagePath;
}

class OfferPage extends StatefulWidget {
  static const String Id = "OfferPage";
  static const String Title = "Oferta";
  @override
  _OfferPageState createState() => new _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  List<Event> mEventImagePathList = [
    new Event(new FootballPageWidget(), "assets/images/sport_events.png"),
    //new Event(new FootballPageWidget(), "assets/images/incentive.png") // TODO Prepare pages for every offer
  ];

  void fShowEvent(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => mEventImagePathList[index].mWidget),
    );
  }

  Widget fBuildEventList() {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          leading:
              Image(image: AssetImage("assets/images/offer/sport_events.png")),
          //title: Image.asset(mEventImagePathList[index].mImagePath),
          onTap: () => fShowEvent(index),
        );
      },
      itemCount: mEventImagePathList.length,
    );
  }

  Column fCreateDivider() {
    return Column(children: <Widget>[
      Divider(height: 0.7, color: gBrownColor),
      Divider(height: 0.7, color: gBrownColor),
      Divider(height: 0.7, color: gBrownColor)
    ]);
  }

  Column fCreateEventRow(String aImagePath, String aImageTitle) {
    return Column(children: <Widget>[
      fCreateDivider(),
      Padding(padding: EdgeInsets.all(10)),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          Image(
            height: 30,
            width: 30,
            image: AssetImage(aImagePath),
          ),
          Padding(padding: EdgeInsets.all(10)),
          fPrintBoldText(aImageTitle)
        ],
      ),
      Padding(padding: EdgeInsets.all(10))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final appBar = new PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/offer/top_image.png"),
            fit: BoxFit.cover,
          )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ));

    return new Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fPrintHeadingText(" Oferta"),
                      Padding(padding: EdgeInsets.all(10)),
                      fCreateEventRow("assets/images/offer/sport_events.png",
                          "Wydarzenia sportowe"),
                      fCreateEventRow(
                          "assets/images/offer/incentive.png", "Incentive"),
                      fCreateEventRow("assets/images/offer/trainings.png",
                          "Konferencje i szkolenia"),
                      fCreateEventRow(
                          "assets/images/offer/events.png", "Eventy"),
                      fCreateEventRow("assets/images/offer/journeys.png",
                          "Aktywne podróże"),
                      fCreateEventRow("assets/images/offer/marketing.png",
                          "Marketing sportowy"),
                      fCreateEventRow(
                          "assets/images/offer/program_for_firms.png",
                          "Program dla firm"),
                    ]))));
  }
}

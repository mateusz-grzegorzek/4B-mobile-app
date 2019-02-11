import 'package:business_mobile_app/pages/home/offer/football/football_page.dart';
import 'package:business_mobile_app/pages/home/offer/incentive/incentive_page.dart';
import 'package:business_mobile_app/pages/home/offer/service_page.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {
  static const String Id = "OfferPage";
  static const String Title = "Oferta";
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  List<ServicePage> mOffers = [
    ServicePage(ServiceInfo(
        "assets/images/offer/sport_events.png",
        "Wydarzenia sportowe",
        gFootballText1,
        false,
        gFootballText2,
        false,
        gFootballOptions,
        gFootballUrlLink,
        gFootballPathToTopImage,
        gFootballPathToMiddleImage)),
    ServicePage(ServiceInfo(
        "assets/images/offer/incentive.png",
        "Incentive",
        gIncentiveText1,
        false,
        gIncentiveText2,
        true,
        gIncentiveOptions,
        gIncentiveUrlLink,
        gIncentivePathToTopImage,
        gIncentivePathToMiddleImage))
  ];

  Column fCreateDivider() {
    return Column(children: <Widget>[
      Divider(height: 0.7, color: gBrownColor),
      Divider(height: 0.7, color: gBrownColor),
      Divider(height: 0.7, color: gBrownColor)
    ]);
  }

  Column fCreateEventRow(ServicePage aServicePage) {
    return Column(children: <Widget>[
      fCreateDivider(),
      Padding(padding: EdgeInsets.all(10)),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => aServicePage),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10)),
            Image(
              height: 30,
              width: 30,
              image: AssetImage(aServicePage.mServiceInfo.mPathToIcon),
            ),
            Padding(padding: EdgeInsets.all(10)),
            fPrintBoldText(aServicePage.mServiceInfo.mHeadingText)
          ],
        ),
      ),
      Padding(padding: EdgeInsets.all(10))
    ]);
  }

  Column fBuildOffers() {
    return Column(
        children: List<Widget>.generate(mOffers.length, (int index) {
      return fCreateEventRow(mOffers[index]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: fBuildAppBar("assets/images/offer/offer_top_image.png"),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fPrintHeadingText(" Oferta"),
                      Padding(padding: EdgeInsets.all(10)),
                      fBuildOffers()
                    ]))));
  }
}

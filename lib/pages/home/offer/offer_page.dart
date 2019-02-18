import 'package:business_mobile_app/pages/home/offer/events_info.dart';
import 'package:business_mobile_app/pages/home/offer/football_info.dart';
import 'package:business_mobile_app/pages/home/offer/incentive_info.dart';
import 'package:business_mobile_app/pages/home/offer/journeys_info.dart';
import 'package:business_mobile_app/pages/home/offer/marketing_info.dart';
import 'package:business_mobile_app/pages/home/offer/program_for_firms_info.dart';
import 'package:business_mobile_app/pages/home/offer/service_page.dart';
import 'package:business_mobile_app/pages/home/offer/trainings_info.dart';
import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
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
        gIncentivePathToMiddleImage)),
    ServicePage(ServiceInfo(
        "assets/images/offer/trainings.png",
        "Konferencje i szkolenia",
        gTrainingsText1,
        true,
        gTrainingsText2,
        true,
        gTrainingsOptions,
        gTrainingsUrlLink,
        gTrainingsPathToTopImage,
        null)),
    ServicePage(ServiceInfo(
        "assets/images/offer/events.png",
        "Eventy",
        gEventsText1,
        true,
        gEventsText2,
        false,
        null,
        gEventsUrlLink,
        gEventsPathToTopImage,
        gEventsPathToMiddleImage)),
    ServicePage(ServiceInfo(
        "assets/images/offer/journeys.png",
        "Aktywne podróże",
        gJourneysText1,
        true,
        gJourneysText2,
        false,
        null,
        gJourneysUrlLink,
        gJourneysPathToTopImage,
        gJourneysPathToMiddleImage)),
    ServicePage(ServiceInfo(
        "assets/images/offer/marketing.png",
        "Marketing sportowy",
        gMarketingText1,
        true,
        gMarketingText2,
        false,
        gMarketingOptions,
        gMarketingUrlLink,
        gMarketingPathToTopImage,
        null)),
    ServicePage(ServiceInfo(
        "assets/images/offer/program_for_firms.png",
        "Program dla firm",
        gProgramForFirmsText1,
        true,
        gProgramForFirmsText2,
        false,
        null,
        gProgramForFirmsUrlLink,
        gProgramForFirmsPathToTopImage,
        null))
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
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => aServicePage),
          );
        },
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10)),
            fBuildImage(aServicePage.mServiceInfo.mPathToIcon, 30),
            Padding(padding: EdgeInsets.all(10)),
            Expanded(
              child: fPrintText(
                aServicePage.mServiceInfo.mHeadingText, gBoldOswaldTextStyle)
            )
          ],
        ),
      )),
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
    return fBuildSilverPage("assets/images/offer/offer_top_image.png",
        fBuildBody(), HomePage.drawer);
  }

  Widget fBuildBody() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              fPrintHeadingText(" Oferta"),
              Padding(padding: EdgeInsets.all(10)),
              fBuildOffers()
            ]));
  }
}

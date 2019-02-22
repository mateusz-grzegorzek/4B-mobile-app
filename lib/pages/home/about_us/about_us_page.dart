import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/home/offer/offer_page.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  static const String Id = "AboutUsPage";
  static const String Title = "O 4Business";

  final mAbout4BusinessPart1 = "Firma ";

  final mAbout4BusinessPart2 = "4Business ";

  final mAbout4BusinessPart3 =
      "została założona w 2005 roku w Krakowie przez dwójkę przyjaciół, "
      "którzy swoją pasją do sportu postanowili zarażać innych. Z początku agencja koncentrowała "
      "się na organizacji wyjazdów sportowych dla mniejszych grup, jednak w krótkim czasie dzięki "
      "wysokiej jakości usług oraz oferowaniu unikalnych i ambitnych programów 4Business "
      "przerodziło się w profesjonalną firmę MICE. Determinacja oraz kreatywność w realizacji "
      "poszczególnych projektów dała możliwość nawiązania współpracy z wieloma firmami, "
      "co zaowocowało licznymi wyjazdami incentive.";

  final mAbout4BusinessTeamPart1 =
      "Zespół 4Business zajmuje się kompleksową organizacją wyjazdów firmowych takich jak:";

  final List<String> mAbout4BusinessTeamOptions = [
    "wyjazdy motywacyjne dla pracowników",
    "firmowe wyjazdy integracyjne",
    "wyjazdy incentive",
    "konferencje",
    "szkolenia"
  ];

  final mAbout4BusinessTeamPart2 =
      "Gwarantujemy doskonałą obsługę i satysfakcję z powierzonych nam zadań!";

  Column fBuildOptions() {
    return Column(
        children: List<Widget>.generate(mAbout4BusinessTeamOptions.length,
            (int index) {
      return fPrintOptionRow(mAbout4BusinessTeamOptions[index]);
    }));
  }

  RichText fBuildAbout4BusinessText() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: mAbout4BusinessPart1),
          TextSpan(
              text: mAbout4BusinessPart2,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: mAbout4BusinessPart3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage("assets/images/about_us_top_image.png",
        fBuildBody(context), HomePage.drawer);
  }

  Widget fBuildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10)),
            fPrintHeadingText(AboutUsPage.Title),
            Padding(padding: EdgeInsets.only(top: 10)),
            fBuildAbout4BusinessText(),
            Padding(padding: EdgeInsets.only(top: 10)),
            Center(
              child: Image(
                alignment: Alignment.center,
                image: AssetImage("assets/images/logo_white.png"),
                width: 150,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            fPrintBoldJustifiedText(mAbout4BusinessTeamPart1),
            Padding(padding: EdgeInsets.only(top: 5)),
            fBuildOptions(),
            fPrintJustifiedText(mAbout4BusinessTeamPart2),
            Padding(padding: EdgeInsets.only(top: 10)),
            fBuildButton(() => fChangePage(context, OfferPage.Id),
                "Sprawdź naszą ofertę"),
            Padding(padding: EdgeInsets.only(top: 20)),
          ],
        ));
  }
}

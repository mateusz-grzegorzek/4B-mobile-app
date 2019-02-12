import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:business_mobile_app/utils/fonts.dart';

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

  // ToDo: Zrobić liste
  final mAbout4BusinessTeamOption1 = "wyjazdy motywacyjne dla pracowników";
  final mAbout4BusinessTeamOption2 = "firmowe wyjazdy integracyjne";
  final mAbout4BusinessTeamOption3 = "wyjazdy incentive";
  final mAbout4BusinessTeamOption4 = "konferencje";
  final mAbout4BusinessTeamOption5 = "szkolenia";

  final mAbout4BusinessTeamPart2 =
      "Gwarantujemy doskonałą obsługę i satysfakcję z powierzonych nam zadań!";

  Widget fBuildOfferButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: gBrownColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () => launch("http://www.4b.com.pl/uslugi/"),
              child: Text(
                'Sprawdź naszą ofertę',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Image(
            image: AssetImage("assets/images/login_arrow.png"),
            width: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/about_us_top_image.png"),
            fit: BoxFit.cover,
          )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ));

    var about4BusinessText = RichText(
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

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(10)),
                fPrintHeadingText(" O 4Business"),
                Padding(padding: EdgeInsets.all(10)),
                about4BusinessText,
                Padding(padding: EdgeInsets.all(10)),
                Center(
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/logo_white.png"),
                    width: 150,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(mAbout4BusinessTeamPart1,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.all(5)),
                fPrintOptionRow(mAbout4BusinessTeamOption1),
                Padding(padding: EdgeInsets.all(5)),
                fPrintOptionRow(mAbout4BusinessTeamOption2),
                Padding(padding: EdgeInsets.all(5)),
                fPrintOptionRow(mAbout4BusinessTeamOption3),
                Padding(padding: EdgeInsets.all(5)),
                fPrintOptionRow(mAbout4BusinessTeamOption4),
                Padding(padding: EdgeInsets.all(5)),
                fPrintOptionRow(mAbout4BusinessTeamOption5),
                Padding(padding: EdgeInsets.all(5)),
                fPrintJustifiedText(mAbout4BusinessTeamPart2),
                Padding(padding: EdgeInsets.all(10)),
                fBuildOfferButton(),
                Padding(padding: EdgeInsets.all(10)),
              ],
            ),
          ),
        ));
  }
}

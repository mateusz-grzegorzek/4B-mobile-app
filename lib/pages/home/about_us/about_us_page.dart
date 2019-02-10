import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import '../../../utils/fonts.dart';
import '../../../utils/widgets/appbars.dart';

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

  final mAbout4BusinessTeamOption1 = "wyjazdy motywacyjne dla pracowników";
  final mAbout4BusinessTeamOption2 = "firmowe wyjazdy integracyjne";
  final mAbout4BusinessTeamOption3 = "wyjazdy incentive";
  final mAbout4BusinessTeamOption4 = "konferencje";
  final mAbout4BusinessTeamOption5 = "szkolenia";

  final mAbout4BusinessTeamPart2 =
      "Gwarantujemy doskonałą obsługę i satysfakcję z powierzonych nam zadań!";

  Padding fPrintText(String text) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ));
  }

  Row fPrintOptionRow(String option) {
    return Row(
      children: <Widget>[
        Image(
          image: AssetImage("assets/images/about_ok_sign.png"),
          width: 25,
        ),
        Padding(padding: EdgeInsets.all(5)),
        Expanded(child: fPrintNormalText(option))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = new PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage("assets/images/about_us_top_image.png"),
            fit: BoxFit.cover,
          )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ));

    var about4BusinessText = new RichText(
      textAlign: TextAlign.justify,
      text: new TextSpan(
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          new TextSpan(text: mAbout4BusinessPart1),
          new TextSpan(
              text: mAbout4BusinessPart2,
              style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: mAbout4BusinessPart3),
        ],
      ),
    );

    return new Scaffold(
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
                fPrintJustifiedText(mAbout4BusinessTeamPart2)
                // ToDo: Sprawdz naszą ofertę (jak starczy czasu)
              ],
            ),
          ),
        ));
  }
}

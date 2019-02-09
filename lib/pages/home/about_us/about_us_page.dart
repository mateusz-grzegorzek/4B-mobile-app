import 'package:flutter/material.dart';
import '../../../utils/fonts.dart';
import '../../../utils/widgets/appbars.dart';

class AboutUsPage extends StatelessWidget {
  static const String Id = "AboutUsPage";
  static const String Title = "O 4Business";

  final mAbout4Business =
      "Firma 4Business została założona w 2005 roku w Krakowie przez dwójkę przyjaciół, "
      "którzy swoją pasją do sportu postanowili zarażać innych. Z początku agencja koncentrowała "
      "się na organizacji wyjazdów sportowych dla mniejszych grup, jednak w krótkim czasie dzięki "
      "wysokiej jakości usług oraz oferowaniu unikalnych i ambitnych programów 4Business "
      "przerodziło się w profesjonalną firmę MICE. Determinacja oraz kreatywność w realizacji "
      "poszczególnych projektów dała możliwość nawiązania współpracy z wieloma firmami, "
      "co zaowocowało licznymi wyjazdami incentive.";

  final mAbout4BusinessTeam = """
Zespół 4Business zajmuje się kompleksową organizacją wyjazdów firmowych takich jak:
- wyjazdy motywacyjne dla pracowników
- firmowe wyjazdy integracyjne
- wyjazdy incentive
- konferencje
- szkolenia

Gwarantujemy doskonałą obsługę i satysfakcję z powierzonych nam zadań!
  """;

  Padding fPrintText(String text) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
              color: gGoldColor, fontSize: 20.0, fontWeight: FontWeight.bold),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(AboutUsPage.Title),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintText(mAbout4Business),
                  fPrintText(mAbout4BusinessTeam)
                ],
              ),
            ),
          ),
        ));
  }
}

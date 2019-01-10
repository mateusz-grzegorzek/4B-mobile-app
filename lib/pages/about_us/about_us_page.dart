import 'package:flutter/material.dart';
import '../home/home_page.dart';

String gAbout4Business =
    "Firma 4Business została założona w 2005 roku w Krakowie przez dwójkę przyjaciół, "
    "którzy swoją pasją do sportu postanowili zarażać innych. Z początku agencja koncentrowała "
    "się na organizacji wyjazdów sportowych dla mniejszych grup, jednak w krótkim czasie dzięki "
    "wysokiej jakości usług oraz oferowaniu unikalnych i ambitnych programów 4Business "
    "przerodziło się w profesjonalną firmę MICE. Determinacja oraz kreatywność w realizacji "
    "poszczególnych projektów dała możliwość nawiązania współpracy z wieloma firmami, "
    "co zaowocowało licznymi wyjazdami incentive.\n\n";

String gAbout4BusinessTeam =
    "Zespół 4Business zajmuje się kompleksową organizacją wyjazdów firmowych takich jak:\n"
    "- wyjazdy motywacyjne dla pracowników,\n"
    "- firmowe wyjazdy integracyjne,\n"
    "- wyjazdy incentive,\n"
    "- konferencje,\n"
    "- szkolenia\n\n"
    "Gwarantujemy doskonałą obsługę i satysfakcję z powierzonych nam zadań!";

class AboutUsWidget extends StatefulWidget {
  @override
  AboutUsPage createState() => new AboutUsPage();
}

class AboutUsPage extends State<AboutUsWidget> {
  static const String Id = "AboutUsPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: new Center(
              child: Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(10)),
                  new Text("O 4Business\n",
                      style: new TextStyle(
                          color: gGoldColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  new Text(gAbout4Business,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  new Text(gAbout4BusinessTeam,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ));
  }
}

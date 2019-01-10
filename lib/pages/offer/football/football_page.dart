import 'package:business_mobile_app/utils/connectivity.dart';
import 'package:flutter/material.dart';

String gAboutFootball1 =
    "Piłka nożna jest niewątpliwie najpopularniejszym sportem na świecie, "
    "więc nasza oferta dotyczącą tej dyscypliny jest niezwykle szeroka. "
    "Oferujemy Państwu obecność na najlepszych światowych stadionach – "
    "Camp Nou w Barcelonie, Old Trafford w Manchesterze, Wembley w Londynie "
    "czy Allianz Arena w Monachium. Gwarantujemy miejsca, które dostarczą wielu "
    "niesamowitych wrażeń, niepowtarzalną atmosferę i przeżycia, które pozostaną "
    "w pamięci przez długie lata!\n";

String gAboutFootball2 =
    "Organizujemy również wyjazdy na wydarzenia związane z innymi "
    "dyscyplinami sportowymi, jak: \n"
    "- Formuła 1\n"
    "- Tenis\n"
    "- NBA / HNL / NFL\n"
    "- Boks\n"
    "- Rugby\n"
    "- Siatkówka\n"
    "Więcej informacji na stronie internetowej: ";

String gAboutFootballUrlLink = ""
    "http://www.4b.com.pl/uslugi/wydarzenia-sportowe/#tab1";

class FootballPageWidget extends StatefulWidget {
  @override
  FootballPage createState() => new FootballPage();
}

class FootballPage extends State<FootballPageWidget> {
  static const String Id = "AboutUsPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Wydarzenia sportowe"),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: new Center(
              child: Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(10)),
                  new Text(gAboutFootball1,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  new Text(gAboutFootball2,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  new InkWell(
                      child: new Text(
                        'Wydarzenia sportowe',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onTap: () => fLaunchURL(gAboutFootballUrlLink)),
                ],
              ),
            ),
          ),
        ));
  }
}

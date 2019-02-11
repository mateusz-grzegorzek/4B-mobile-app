import 'package:business_mobile_app/utils/connectivity.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FootballPageWidget extends StatefulWidget {
  @override
  FootballPage createState() => new FootballPage();
}

class FootballPage extends State<FootballPageWidget> {
  static const String Id = "FootballPage";

  String mAboutFootball1 =
      "Piłka nożna jest niewątpliwie najpopularniejszym sportem na świecie, "
      "więc nasza oferta dotyczącą tej dyscypliny jest niezwykle szeroka. "
      "Oferujemy Państwu obecność na najlepszych światowych stadionach – "
      "Camp Nou w Barcelonie, Old Trafford w Manchesterze, Wembley w Londynie "
      "czy Allianz Arena w Monachium. Gwarantujemy miejsca, które dostarczą wielu "
      "niesamowitych wrażeń, niepowtarzalną atmosferę i przeżycia, które pozostaną "
      "w pamięci przez długie lata!\n";

  String mAboutFootball2 =
      "Organizujemy również wyjazdy na wydarzenia związane z innymi "
      "dyscyplinami sportowymi, jak: ";

  // ToDo: Zrobić liste
  final mSportEventOption1 = "Formuła 1";
  final mSportEventOption2 = "Tenis";
  final mSportEventOption3 = "NBA / HNL / NFL";
  final mSportEventOption4 = "Boks";
  final mSportEventOption5 = "Rugby";
  final mSportEventOption6 = "Siatkówka";

  String mAboutFootball3 = "Więcej informacji na stronie internetowej: ";
  String mAboutFootballUrlLink = ""
      "http://www.4b.com.pl/uslugi/wydarzenia-sportowe/#tab1";

  Widget fBuildWebPageButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
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
              onPressed: () => launch(mAboutFootballUrlLink),
              child: Text(
                'Przejdź do strony internetowej',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    final appBar = new PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new AssetImage(
                "assets/images/offer/football/football_top_image.png"),
            fit: BoxFit.cover,
          )),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ));

    return Scaffold(
        appBar: appBar,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintHeadingText("Wydarzenia sportowe"),
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintJustifiedText(mAboutFootball1),
                  Image(
                    image: AssetImage(
                        "assets/images/offer/football/football_middle_image.png"),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintJustifiedText(mAboutFootball2),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption1),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption2),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption3),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption4),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption5),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mSportEventOption6),
                  Padding(padding: EdgeInsets.all(5)),
                  fBuildWebPageButton()
                ],
              ),
            ),
          ),
        ));
  }
}

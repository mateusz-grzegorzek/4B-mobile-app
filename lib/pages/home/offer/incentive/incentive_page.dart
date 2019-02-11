import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IncentivePageWidget extends StatefulWidget {
  @override
  IncentivePage createState() => new IncentivePage();
}

class IncentivePage extends State<IncentivePageWidget> {
  static const String Id = "IncentivePage";

  String mText1 =
      "Na wyjazdy firmowe w szczególności polecamy destynacje egzotyczne. "
      "Podróż w odległy zakątek świata jest wyjątkową formą motywacji lub nagrody. "
      "Uczestnicy wyjazdu nie tylko mogą poznać odmienne kultury i ich zwyczaje, "
      "zobaczyć przepiękne krajobrazy, ale także zaskakiwani są wspaniałymi "
      "atrakcjami i programem, który niedostępny jest dla wszystkich turystów. "
      "Organizowane przez nas wyjazdy należą do kategorii luksusowych i zapewniają unikatowe wrażenia.\n";

  String mText2 = "Szczególnie rekomendowane przez nas kierunki to: ";

  // ToDo: Zrobić liste
  final mOption1 = "Indie";
  final mOption2 = "Las Vegas i dzikie okolice Światowego Centrum Rozrywki";
  final mOption3 = "Malezja – Tropikalne Emocje";
  final mOption4 = "Mauritius – Niebiańska Wyspa";
  final mOption5 = "Rosja";
  final mOption6 = "Tajlandia";

  String mUrlText = "Więcej informacji na stronie internetowej: ";
  String mUrlLink = ""
      "http://www.4b.com.pl/uslugi/incentive/#tab1";

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
              onPressed: () => launch(mUrlLink),
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
                "assets/images/offer/incentive/incentive_top_image.png"),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintHeadingText(" Incentive"),
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintJustifiedText(mText1),
                  Image(
                    image: AssetImage(
                        "assets/images/offer/incentive/incentive_middle_image.png"),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  fPrintJustifiedText(mText2),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption1),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption2),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption3),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption4),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption5),
                  Padding(padding: EdgeInsets.all(5)),
                  fPrintOptionRow(mOption6),
                  Padding(padding: EdgeInsets.all(5)),
                  fBuildWebPageButton()
                ],
              ),
            ),
          ),
        ));
  }
}

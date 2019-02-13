import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places_page.dart';

class AboutCountryPage extends StatelessWidget {
  static const String Id = "AboutCountryPage";
  static const String Title = "O kraju";

  final mAboutCountryIntro =
      "Stany Zjednoczone to kraj nieograniczonych możliwości, niesamowitej różnorodności krajobrazów oraz wielokulturowych miast, które sprawiają, iż spędzenie wakacji właśnie tam jest marzeniem niejednego z nas.";

  final mAboutCountryPart1 =
      "Czwarte największe państwo świata, pozostaje nadal jednym z najmniej zaludnionych krajów na świecie. Rozległe lasy, góry, stepy i pustynie oraz gigantyczne pola uprawne, sprawiły, iż ¾ ludności skupiła się głównie wokół wielkich aglomeracji na atrakcyjnym wschodnim oraz zachodnim wybrzeżu kraju, podczas gdy ogromna część terytoriów do dziś pozostaje dzika i zdumiewająca.";

  final mAboutCountryPart2 =
      "Poprzecinany pasami wysokiej jakości autostrad, łączących 50 stanów, Meksyk z Kanadą oraz Ocean Atlantycki ze Spokojnym, USA jest jednym z najlepiej rozwiniętych krajów na świecie. Amerykański styl życia, Hollywood oraz pop kultura przyciągają turystów z całego świata do jego wielkich miast, neonów, centrów rozrywki, sportu i hazardu w poszukiwaniu nowych przeżyć i emocji. Na top liście znajdują się błyszczące kasyna Las Vegas, Manhattan (Nowy Jork), Beverly Hills i Aleja Gwiazd (Los Angeles), Disney Word (Orlando Floryda) czy słoneczne Hawaje, oraz dobrze nam znane z produkcji hollywoodzkich symbole Ameryki takie jak: Statua Wolności, Central Park (Nowy Jork), Opera Narodowa Kennediego  i Biały Dom (Waszyngton DC), Golden Gate Bridge i Alcatraz (San Francisco).";

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage(
        "assets/images/appbars/about_country.png", fBuildBody(context));
  }

  Widget fBuildBody(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10)),
                fPrintHeadingText(AboutCountryPage.Title),
                Padding(padding: EdgeInsets.only(top: 10)),
                fPrintBoldText(mAboutCountryIntro),
                Padding(padding: EdgeInsets.only(top: 10)),
                fPrintText(mAboutCountryPart1),
                Padding(padding: EdgeInsets.only(top: 10)),
              ],
            ),
          ),
          Image.asset("assets/images/trips/las_vegas/about_country.png"),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    fPrintText(mAboutCountryPart2),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    fBuildButton(
                        () => fChangePage(context, VisitedPlacesPage.Id),
                        "Zobacz odwiedzane miejsca"),
                    Padding(padding: EdgeInsets.only(top: 10)),
                  ]))
        ]);
  }
}

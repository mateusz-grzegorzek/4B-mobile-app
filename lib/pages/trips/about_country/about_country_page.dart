import 'package:flutter/material.dart';

import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/pages/trips/visited_places/visited_places_page.dart';

import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/trips_handlers.dart';

class AboutCountryPage extends StatelessWidget {
  static const String Id = "AboutCountryPage";
  static const String Title = "O kraju";

  Widget fBuildContentForLV(BuildContext context) {
    final mAboutCountryIntro =
        "Stany Zjednoczone to kraj nieograniczonych możliwości, niesamowitej różnorodności krajobrazów oraz wielokulturowych miast, które sprawiają, iż spędzenie wakacji właśnie tam jest marzeniem niejednego z nas.";
    final mAboutCountryPart1 =
        "Czwarte największe państwo świata, pozostaje nadal jednym z najmniej zaludnionych krajów na świecie. Rozległe lasy, góry, stepy i pustynie oraz gigantyczne pola uprawne, sprawiły, iż ¾ ludności skupiła się głównie wokół wielkich aglomeracji na atrakcyjnym wschodnim oraz zachodnim wybrzeżu kraju, podczas gdy ogromna część terytoriów do dziś pozostaje dzika i zdumiewająca.";
    final mAboutCountryPart2 =
        "Poprzecinany pasami wysokiej jakości autostrad, łączących 50 stanów, Meksyk z Kanadą oraz Ocean Atlantycki ze Spokojnym, USA jest jednym z najlepiej rozwiniętych krajów na świecie. Amerykański styl życia, Hollywood oraz pop kultura przyciągają turystów z całego świata do jego wielkich miast, neonów, centrów rozrywki, sportu i hazardu w poszukiwaniu nowych przeżyć i emocji. Na top liście znajdują się błyszczące kasyna Las Vegas, Manhattan (Nowy Jork), Beverly Hills i Aleja Gwiazd (Los Angeles), Disney Word (Orlando Floryda) czy słoneczne Hawaje, oraz dobrze nam znane z produkcji hollywoodzkich symbole Ameryki takie jak: Statua Wolności, Central Park (Nowy Jork), Opera Narodowa Kennediego  i Biały Dom (Waszyngton DC), Golden Gate Bridge i Alcatraz (San Francisco).";

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    fPrintText(mAboutCountryPart2),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    fBuildButton(
                        () => fChangePage(context, VisitedPlacesPage.Id),
                        "Zobacz odwiedzane miejsca"),
                    Padding(padding: EdgeInsets.only(top: 20)),
                  ]))
        ]);
  }

  Widget fBuildContentForThailand(BuildContext context) {
    final mAboutCountryIntro =
        "Tajlandia jest jednym z najchętniej odwiedzanych krajów Azji, popularnym celem wakacyjnych wyjazdów, wypraw trampingowych, czy podróży poślubnych. Od lat nieustannie przyciąga tłumy turystów z całego świata, spragnionych słońca i egzotycznych doświadczeń.";
    final mAboutCountryPart1 =
        "Tajlandia ma bardzo dużo do zaoferowania turystom. Przede wszystkim wspaniałą, bagatą i egzotyczną kulturę. Setki stup i świątyń zachwycają niemal na każdym kroku, a ruiny pradawnych miast mają niesamowity klimat. W dżungli żyje wiele półdzikich plemion mniejszości etnicznych, każde ze swoją oryginalną kulturą i zwyczajami. Niektóre plemiona można odwiedzić.";
    final mAboutCountryPart2 =
        "Wielkim magnesem przyciągającym turystów do Tajlandii są również, a może przede wszystkim, plaże, ciepły klimat oraz tropikalna przyroda. Dziesiątki wysp i wysepek, setki bajecznych plaż, wszechobecne palmy kokosowe, turkusowa woda oraz kolorowa, pełna życia rafa koralowa stanowią prawdziwy raj dla miłośników słońca, plażowego lenistwa i pluskania się w ciepłej jak zupa wodzie. Poza wodą są jeszcze malownicze poletka ryżowe, góry oraz tropikalna dżungla, idealne do uprawiania trekkingu, przejażdżek na słoniach oraz raftingu.";
    final mAboutCountryPart3 =
        "Wielu turystów ceni Tajlandię również za sympatycznych, uśmiechniętych mieszkańców, doskonałe jedzenie oraz niskie ceny.";
    final mAboutCountryPart4 =
        "Tajlandia jako jedyny kraj w regionie, nie uległa kolonizacji, wolna od obcych, europejskich wpływów, mogła nieprzerwanie, bez przeszkód kultywować własną tradycję.";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                ])),
        Image.asset("assets/images/trips/thailand/about_country/body1.jpg"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              fPrintText(mAboutCountryPart2),
              Padding(padding: EdgeInsets.only(top: 10)),
              fPrintText(mAboutCountryPart3),
              Padding(padding: EdgeInsets.only(top: 10)),
              fPrintText(mAboutCountryPart4),
              Padding(padding: EdgeInsets.only(top: 20)),
              fBuildButton(() => fChangePage(context, VisitedPlacesPage.Id),
                  "Zobacz odwiedzane miejsca"),
              Padding(padding: EdgeInsets.only(top: 20)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBarImageAssetPath;
    var body;
    if (isLasVegasTrip()) {
      appBarImageAssetPath = "assets/images/appbars/about_country.png";
      body = fBuildContentForLV(context);
    } else if (isThailandTrip()) {
      appBarImageAssetPath =
          "assets/images/trips/thailand/appbar.jpg";
      body = fBuildContentForThailand(context);
    }

    return fBuildSilverPage(appBarImageAssetPath, body, TripsPage.drawer);
  }
}

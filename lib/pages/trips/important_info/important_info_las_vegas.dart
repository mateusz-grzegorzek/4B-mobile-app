import 'package:business_mobile_app/pages/trips/important_info/important_info.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const List<List<String>> gAirConnectionBody = [
  gAirConnectionBodyContent1,
  gAirConnectionBodyContent2,
  gAirConnectionBodyContent3
];
const List<String> gAirConnectionBodyContent1 = [
  "AF 1247 L 23FEB WAW - CDG 06:35 - 09:10",
  "AF 066 V 23FEB CDG - LAX 10:20 - 13:05",
  "AF 065 V 28FEB LAX - CDG 15:30 - 11:15 (+1)",
  "AF 1046 L 01MAR CDG - WAW 14:10 - 16:25"
];
const List<String> gAirConnectionBodyContent2 = [
  "KL1362 L 23FEB WAW - AMS 06:05 - 08:15",
  "KL 601 L 23FEB AMS - LAX 09:55 - 11:55",
  "DL5828 K 23FEB LAX - LAS 15:00 - 16:14",
  "DL2651 T 28FEB LAS - LAX 11:04 - 12:14",
  "KL 602 N 28FEB LAX - AMS 13:50 - 09:05 (+1)",
  "KL 1363 L 01MAR AMS - WAW 10:05 - 12:00"
];
const List<String> gAirConnectionBodyContent3 = [
  "KL 1362 L 23FEB WAW - AMS 06:05 - 08:15",
  "DL 143 L 23FEB AMS - SEA 09:50 - 11:18",
  "DL 1743 T 23FEB SEA - LAS 16:00 - 18:36",
  "DL 2211 T 28FEB LAS - ATL 14:07 - 21:00",
  "KL 622 N 28FEB ATL - AMS 22:25 - 12:25 (+1)",
  "KL 1365 L 01MAR AMS - WAW 14:20 - 16:10"
];

const List<String> gAirLineBody = ["Air France", "KLM i Delta", "KLM i Delta"];

const String gTravelLuggageTitle = "Bagaż podróżny";
const String gTravelLuggageBody1 = "Bagaż główny: ";
const String gTravelLuggageBody2 =
    "1 x bagaż rejestrowany max łącznie 158cm 23 kg";
const String gTravelLuggageBody3 = "Bagaż podręczny: ";
const String gTravelLuggageBody4 =
    "1 x bagaż podręczy max 55 x 35 x 25 cm 12 kg";

const String gInsuranceTitle = "Ubezpieczenie";
const String gInsuranceBody1 =
    "Są Państwo ubezpieczeni w Signal Iduna standardowym ubezpieczeniem nie obejmującym chorób przewlekłych. "
    "Ubezpieczenie nie działa kiedy klient jest pod wpływem "
    "alkoholu lub/i narkotyków - wtedy nie ma zwrotu z polisy.";
const String gInsuranceBody2 = "Suma ubezpieczenia w poszczególnych ryzykach: ";
const String gInsuranceBody3 = "Koszty leczenia - 30 000 EUR,";
const String gInsuranceBody4 = "NNW - 16 000 PLN,";
const String gInsuranceBody5 = "Bagaż podręczny - 1 800 PLN.";
const String gInsuranceBody6 =
    "W przypadku wyjazdu do USA z wybranej sumy ubezpieczenia na leczenie ambulatoryjne, "
    "zakup lekarstw i środków opatrunkowych przepisanych przez lekarza "
    "nie może być wykorzystane więcej niż równowartość 2.000 EUR w złotych polskich.";

const String gSafetyTitle = "Bezpieczeństwo";
const String gSafetyBody =
    "Przypominamy o konieczności zabrania dowodu osobistego - "
    "paszport zamykamy w sejfie, a po mieście poruszamy się z dowodem.";

const String gPhonesTitle = "Telefony";
const String gPhonesBody =
    "Koniecznym jest uruchomienie roamingu - prosimy o kontakt z operatorem";

const String gRoomsTitle = "Zakwaterowanie i pokoje";
const String gRoomsBody1 = "EXCALIBUR HOTEL & CASINO***";
const String gRoomsBody2 =
    " - Hotel i kasyno w Las Vegas z 3991 pokojami. Położony jest po zachodniej stronie bulwaru Las Vegas Strip. "
    "Stylizowany na bajkowy zamek. Nazwa pochodzi od legendarnego miecza króla Artura. Grupa zostanie ulokowana "
    "w pokojach wyposażonych w telewizor, łazienkę z prysznicem, suszarką do włosów, dwa łóżka, zegar z alarmem "
    "i wejściem na iPoda, żelazko, telefon (rozmowy lokalne bezpłatne).";

const String gHotelRestaurantTitle = "Godziny otwarcia hotelowej restauracji";
const String gHotelRestaurantBody = """ŚNIADANIE: 07:00 - 11:00
LUNCH: 11:00 - 16:00
KOLACJA: 16:00 - 22:00""";

const String gTempTitle = "Temperatury";
const String gTempBody =
    "Średnia temperatura w Las Vegas w lutym to: 20℃ (dzień), 7℃ (noc).";

const String gMoneyTitle = "Pieniądze";
const String gMoneyBody =
    "Trudno określić ich ilość na dzień, ale żeby dobrze się bawić, "
    "pograć potrzeba ok. 150-200 USD na dzień- Las Vegas wchłonie każdą ilość. "
    "Na napiwki dla kelnerów, kierowców, pokojówek ok. 30-50 USD. "
    "W sklepach, barach można płacić bez problemu kartami VISA, MASTERCARD, "
    "zarówno debetowymi jak i kredytowymi, do wynajmu samochodu konieczna karta kredytowa, "
    "wypłata gotówki z bankomatu (ATM) nie stanowi problemu- opłata ok. 3-5 USD. "
    "Wyjście do dyskoteki to koszt ok. 50 USD wstęp + 1-2 drinki), ceny alkoholi w sklepach "
    "zbliżone do cen w Polsce, w barach, knajpach- piwo ok. 2-8 USD, drink 8-15 USD";

const String gTimeTitle = "Czas";
const String gTimeBody1 = "Różnica czasu: ";
const String gTimeBody2 = "9 godzin";

const String gVoltageTitle = "Napięcie";
const String gVoltageBody1 =
    "W USA napięcie to 110 V i inny typ wtyczek- z dwoma płaskimi bolcami, ";
const String gVoltageBody2 = "konieczne jest zabranie  ze sobą adaptera. ";
const String gVoltageBody3 = "Cena w Las Vegas to ok. 10-25 USD";

const String gOutfitTitle = "Ubiór";
const List<String> gOutfitBody1 = [
  "Biorąc pod uwagę prognozę pogody rekomendujemy zabrać ze sobą ciepłe rzeczy wraz z zimowym obuwiem, przystosowanym do trekkingu – wycieczka na Grand Canyon. Dodatkowo zalecamy zabrać ze sobą nakrycia głowy oraz okulary przeciwsłoneczne.",
  "Biorąc pod uwagę prognozę pogody rekomendujemy zabrać ze sobą ciepłe rzeczy wraz z zimowym obuwiem, przystosowanym do trekkingu – wycieczka do Zion Park. Dodatkowo zalecamy zabrać ze sobą nakrycia głowy oraz okulary przeciwsłoneczne.",
  "Biorąc pod uwagę prognozę pogody rekomendujemy zabrać ze sobą ciepłe rzeczy wraz z zimowym obuwiem, przystosowanym do trekkingu – wycieczka do Zion Park. Dodatkowo zalecamy zabrać ze sobą nakrycia głowy oraz okulary przeciwsłoneczne."
];
const String gOutfitBody2 =
    "Jeśli planują Państwo wizyty w nocnych klubach, dyskotece czy eleganckich restauracjach rekomendujemy zabrać ze sobą ubrania typu SMART CASUAL np. długie spodnie, koszula, marynarka, pełne buty - nie sportowe. Biorąc pod uwagę prognozę pogody rekomendujemy zabrać ze sobą ciepłe rzeczy, w szczególności podczas wycieczki do Parków Narodowych, gdzie, jak również nakrycia głowy na wycieczki czy okulary przeciwsłoneczne.";

const String gShoppingTitle = "Zakupy";
const String gShoppingBody1 =
    "Aby ułatwić Państwu sprawne poruszanie się po sklepach, "
    "sugerujemy zapoznanie się ze stronami galerii handlowych przed wyjazdem: ";
const String gShoppingBody2 = "PREMIUM OUTLET";
const String gShoppingBody2Url =
    "http://www.premiumoutlets.com/outlets/outlet.asp?id=58";
const String gShoppingBody3 = "TOWN SQUARE";
const String gShoppingBody3Url = "http://www.townsquarelasvegas.com/";
const String gShoppingBody4 = "LAS VEGAS OUTLET CENTRE";
const String gShoppingBody4Url =
    "http://www.premiumoutlets.com/outlets/outlet.asp?id=61";

const String gFreeTimeTitle = "W czasie wolnym";
const String gFreeTimeBody1 = "THE ROLLER COASTER ";
const String gFreeTimeBody2 =
    "w kasynie NEW YORK kolejka górska z wagonikami stylizowanymi na taksówki nowojorskie- "
    "rozrywka dla odważnych- mknie z prędkością ponad 100 km na godzinę po torach spadających kilkadziesiąt metrów w dół, "
    "obracając się o 180 stopni!";
const String gFreeTimeBody3 = "EIFFEL TOWER ";
const String gFreeTimeBody4 =
    "w kasynie PARIS replika wieży Eiffla tyle, że mniejsza o połowę, "
    "z góry wspaniały widok na Las Vegas- szczególnie na fontanny w Bellagio(fontanny czynne codziennie od 15:00 do 23.00)";
const String gFreeTimeBody5 = "MIRACLE MILE SHOP ";
const String gFreeTimeBody6 =
    "galeria handlowa w kasynie Planet Hollywood mieszcząca ponad 170 sklepów";
const String gFreeTimeBody7 = "HOUSE OF BLUES ";
const String gFreeTimeBody8 =
    "Music Hall w kasynie MANDALAY BAY codzienne koncerty rock, blues, reggae, wstęp wolny od 20.00,"
    "luźna atmosfera- godne polecenia miejsce na wieczór";
const String gFreeTimeBody9 = "COYOTE UGLY ";
const String gFreeTimeBody10 =
    "w kasynie NEW YORK sieciowa knajpa wzorowana na barze nowojorskim uwiecznionym "
    "w filmie pod tym samym tytułem, barmanki zabawiające publiczność śpiewem i tańcem na barze.";
const String gFreeTimeBody11 = "Więcej informacji o atrakcjach w Las Vegas: ";
const String gFreeTimeBodyUrl = "http://www.lasvegas.com";

const List<String> gImportantInfoGroups = [
  "LasVegas1",
  "LasVegas2",
  "LasVegas3"
];

class ImportantInfoLasVegasWidget extends ImportantInfoWidget {
  List<Widget> fBuildAirConnectionTile(int groupIndex) {
    return List<Widget>.from(gAirConnectionBody[groupIndex]
        .map((flight) => fBuildInsuranceRow(flight)));
  }

  List<Widget> fBuildTravelLuggageTile() {
    var travelLuggageTileRow1 = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTravelLuggageBody1,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTravelLuggageBody2),
        ],
      ),
    );

    var travelLuggageTileRow2 = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTravelLuggageBody3,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTravelLuggageBody4),
        ],
      ),
    );

    return <Widget>[
      Column(
        children: <Widget>[
          Row(children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.only(left: 15)),
            Expanded(child: travelLuggageTileRow1)
          ]),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.only(left: 15)),
            Expanded(child: travelLuggageTileRow2)
          ]),
        ],
      ),
    ];
  }

  List<Widget> fBuildInsuranceTile() {
    return <Widget>[
      Column(children: <Widget>[
        fPrintText(gInsuranceBody1),
        Padding(padding: EdgeInsets.only(top: 10)),
        fPrintBoldText(gInsuranceBody2),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody3),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody4),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody5),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody6)
      ])
    ];
  }

  List<Widget> fBuildSafetyTile() {
    return <Widget>[fPrintText(gSafetyBody)];
  }

  List<Widget> fBuildPhonesTile() {
    return <Widget>[fPrintText(gPhonesBody)];
  }

  List<Widget> fBuildRoomsTile() {
    var roomsTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gRoomsBody1, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gRoomsBody2),
        ],
      ),
    );

    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: roomsTileRow),
        ],
      )
    ];
  }

  List<Widget> fBuildTempTile() {
    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: fPrintText(gTempBody)),
        ],
      )
    ];
  }

  List<Widget> fBuildMoneyTile() {
    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: fPrintText(gMoneyBody)),
        ],
      )
    ];
  }

  List<Widget> fBuildTimeTile() {
    var timeTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTimeBody1, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTimeBody2),
        ],
      ),
    );

    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: timeTileRow),
        ],
      )
    ];
  }

  List<Widget> fBuildVoltageTile() {
    var voltageTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: gVoltageBody1),
          TextSpan(
              text: gVoltageBody2,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gVoltageBody3),
        ],
      ),
    );

    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: voltageTileRow),
        ],
      )
    ];
  }

  List<Widget> fBuildOutfitTile(int groupIndex) {
    return <Widget>[
      Column(
        children: <Widget>[
          fPrintText(gOutfitBody1[groupIndex]),
          fPrintText(""),
          fPrintText(gOutfitBody2),
        ],
      )
    ];
  }

  List<Widget> fBuildShoppingTile() {
    return <Widget>[
      Column(
        children: <Widget>[
          fPrintText(gShoppingBody1),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody2, gShoppingBody2Url),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody3, gShoppingBody3Url),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody4, gShoppingBody4Url),
        ],
      )
    ];
  }

  List<Widget> fBuildFreeTimeTile() {
    return <Widget>[
      Column(
        children: <Widget>[
          fBuildFreeTimeRow(gFreeTimeBody1, gFreeTimeBody2),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody3, gFreeTimeBody4),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody5, gFreeTimeBody6),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody7, gFreeTimeBody8),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody9, gFreeTimeBody10),
          Padding(padding: EdgeInsets.only(top: 10)),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: gFreeTimeBody11,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch(gFreeTimeBodyUrl),
                  text: gFreeTimeBodyUrl,
                  style: TextStyle(
                      color: gBrownColor,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      )
    ];
  }

  Column fBuildInfoTiles() {
    mExpansionTileKeyList.clear();

    int groupIndex =
        gImportantInfoGroups.indexOf(gTripsList[gCurrentTripIndex].mUserName);
    if (groupIndex == -1) {
      groupIndex = 0;
    }
    fAddExpansionTileToList(
        gAirConnectionTitle, fBuildAirConnectionTile(groupIndex));
    fAddExpansionTileToList(
        gAirLineTitle, fBuildSimpleTextTile(gAirLineBody[groupIndex]));
    fAddExpansionTileToList(gTravelLuggageTitle, fBuildTravelLuggageTile());
    fAddExpansionTileToList(gInsuranceTitle, fBuildInsuranceTile());
    fAddExpansionTileToList(gSafetyTitle, fBuildSafetyTile());
    fAddExpansionTileToList(gPhonesTitle, fBuildPhonesTile());
    fAddExpansionTileToList(gRoomsTitle, fBuildRoomsTile());
    fAddExpansionTileToList(
        gHotelRestaurantTitle, fBuildSimpleTextTile(gHotelRestaurantBody));
    fAddExpansionTileToList(gTempTitle, fBuildTempTile());
    fAddExpansionTileToList(gMoneyTitle, fBuildMoneyTile());
    fAddExpansionTileToList(gTimeTitle, fBuildTimeTile());
    fAddExpansionTileToList(gVoltageTitle, fBuildVoltageTile());
    fAddExpansionTileToList(gOutfitTitle, fBuildOutfitTile(groupIndex));
    fAddExpansionTileToList(gShoppingTitle, fBuildShoppingTile());
    fAddExpansionTileToList(gFreeTimeTitle, fBuildFreeTimeTile());

    return Column(children: mExpansionTileList);
  }
}

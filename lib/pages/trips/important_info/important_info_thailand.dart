import 'package:flutter/material.dart';
import 'package:business_mobile_app/pages/trips/important_info/important_info.dart';

const List<String> gAirConnectionBodyContent = [
  "24.02.2019 Warszawa – Dubaj 13:25-22:05           Dubaj – Bangkok 03:05-12:05 (+1)",
  "03.03.2019 Bangkok – Dubaj 02:00-06:00 	        Dubaj – Warszawa 08:05-11:20"
];
const String gAirLineBody = "Emirates Airline";

const String gTravelLuggageTitle = "Limity bagażowe";
const List<String> gTravelLuggageBody = [
  "20 kg bagaż rejestrowany",
  "5 kg bagaż podręczny (55 x 38 x 20 cm)"
];

const String gAccommodationTitle = "Zakwaterowanie";
const List<String> gAccommodationBody = [
  "Bangkok: Hotel Amara 5*",
  "Pattaya: Hotel Ravindra Beach Resort & Spa 4*"
];

const String gWisaTitle = "Wiza";
const String gWisaBody = "Według aktualnych informacji ze strony Ambasady Tajlandii w Warszawie, od 11 sierpnia 2011 roku posiadacze polskich paszportów mogą podróżować do Tajlandii w celach turystycznych do 30 dni pobytu bez konieczności ubiegania się o wizę.";

const String gWelcomeTitle = "CO TRZEBA POSIADAĆ PRZY WJEŹDZIE DO TAJLANDII";
const List<String> gWelcomeBody = [
  "Paszport ważny minimum 6 miesięcy w momencie przyjazdu",
  "Bilet potwierdzający opuszczenie terytorium Tajlandii w ciągu 30 dni"
];

const String gClimateTitle = "Klimat";
const String gClimateBody = "Tajlandia położona jest w strefie klimatu zwrotnikowego monsunowego, z wyjątkiem południowej części, czyli Półwyspu Malajskiego, który położony jest w strefie klimatu równikowego. W Tajlandii można wyróżnić trzy pory roku:  gorącą, deszczową i chłodną. Najlepszą porą na podróż do Tajlandii są miesiące od listopada do kwietnia – temperatura ok. 30 °C.";

const String gCurrencyTitle = "Waluta";
const String gCurrencyBody = "Waluta Tajlandii to Bat (THB). Nie ma możliwości wymiany polskiego złotego na Baty, dlatego z Polski najlepiej wziąć ze sobą dolary lub Euro i te wymienić w Tajlandii. 1 USD = ok. 36 THB, a 1 EUR = ok. 41 BHT.";

const String gATMTitle = "Bankomaty";
const String gATMBody = "Przy każdej wypłacie gotówki z bankomatu zostanie potrącona prowizja w wysokości 200-250 THB. Tej opłaty niestety nie da się uniknąć, dlatego warto jednorazowo wyciągać większe kwoty. Uwaga! Wiele osób jest przekonanych, że uniknie płacenia powyższej prowizji, skoro ma w swoim banku „darmowe wypłaty z bankomatów na całym świecie”. Owszem, jeśli jest włączona taką opcję, to bank nie pobierze (polskiej) prowizji za pobranie pieniędzy, ale nie pokrywa kosztów prowizji tajlandzkiego operatora bankomatu.";

const String gShoppingTitle = "Zakupy";
const String gShoppingBody = "W Tajlandii cenę towaru określa zwykle sprzedawca i turysta z Europy musi liczyć się z tym, że zapłaci nieco więcej, niż miejscowy nabywca. Produkty tajskie nie są drogie, zwłaszcza świeże owoce, warzywa, ryby i mięso, natomiast za towary, które są sprowadzane z Europy, trzeba zapłacić znacznie więcej.";

const String gTimeTitle = "Czas";
const String gTimeBody = "W Tajlandii czas różni się od czasu środkowoeuropejskiego o 5 godzin w lecie oraz 6 godzin podczas Polskiej zimy.";

const String gElectricityTitle = "Elektryczność";
const String gElectricityBody = "Napięcie w gniazdkach wynosi 220 V. Większość gniazdek nadaje się zarówno do wtyczek z okrągłymi bolcami jak i płaskimi. Dzięki temu zazwyczaj nie są potrzebne adaptery.";

const String gCultureTitle = "Kultura";
const String gCultureBody = """Na co zwrócić szczególną uwagę? Na postać króla! Tajowie z ogromnym szacunkiem odnoszą się do rodziny królewskiej. Wokół króla zbudowano potężny kult jednostki. Król Tajlandii umarł 13 października 2016r. w Bangkoku, był najdłużej panującym monarchą na świecie. Przez minione 70 lat król stał się najwyższym autorytetem moralnym i ucieleśnieniem wszystkiego, co tajskie. Osiągnął on pozycję, jaką nie może poszczycić się żaden monarcha konstytucyjny na świecie. Był półbogiem, nie figurantem, symbolem zamierzchłej tradycji jak monarchowie Wielkiej Brytanii czy Holandii. Dlatego w kraju ogłoszono roczną żałobę dla urzędników państwowych, ale zwykli obywatele także pogrążyli się w smutku. Prosimy więc zwrócić szczególną uwagę na tajską kulturę i przestrzeganie zasad zachowania. Sytuację konfliktową może spowodować każde, nawet nieumyślne zlekceważenie majestatu króla Tajlandii, jego rodziny i dworu królewskiego (np. publiczne zniszczenie banknotu, na którym znajduje się wizerunek władcy). 

Każdy posąg Buddy jest uważany za święty. Nie należy np. wspinać się na posąg, 
aby zrobić zdjęcie, ani też w jakikolwiek inny sposób okazywać braku szacunku. Odwiedzając świątynie lub inne miejsca kultu religijnego, trzeba być stosownie ubranym (odkryte ramiona, szorty, czy klapki są niedozwolone). Nie na miejscu jest dyskutowanie podniesionym głosem lub kłócenie się, np. o cenę towaru podczas negocjacji. 
""";

const String gReligionTitle = "Religia";
const String gReligionBody = "Dominująca religia w Tajlandii to buddyzm. Jak wskazują źródła, około 92% całej populacji to wyznawcy właśnie tej religii. 5% mieszkańców to z kolei muzułmanie. Pozostały procent, stanowią: chrześcijanie, hinduiści oraz sikhowie.";

const String gOutfitTitle = "Ubiór";
const String gOutfitBody = "Należy zabrać ze sobą lekkie, przewiewne ubranie na co dzień. Szorty nie zakrywające kolan, koszulki bez rękawów oraz inne ubrania w stylu plażowym są uważane za nieodpowiednie, jeśli noszone są poza terenem resortu lub plaży. W związku z wysoką temperaturą rekomendujemy zabrać ze sobą także nakrycie głowy, okulary przeciwsłoneczne oraz kremy z wysokim filtrem UV.";

const String gSafetyTitle = "Bezpieczeństwo";
const String gSafetyBody = "Tajlandia jest krajem na ogół bezpiecznym. Jak w każdym kraju, głównie w turystycznych miejscach, należy być czujnym na tzw. kieszonkowców. Prosimy pilnować swoich wartościowych rzeczy. Warto w razie czego mieć przy sobie, lub zapamiętać numer telefonu na policję, która obsługuje turystów w języku angielskim: 1155.";

const String gVaccinationsTitle = "Szczepienia";
const String gVaccinationsBody1 = """Obowiązkowe szczepienia przy podróży z Polski – nie obowiązują.

Szczepienia zalecane – przeciwko następującym chorobom:""";
const List<String> gVaccinationsBody2 = [
  "wirusowe zapalenie wątroby typu A",
  "wirusowe zapalenie wątroby typu B",
  "tężec + błonica",
  "choroba Heinego-Medina (inaczej: poliomyelitis)",
  "dur brzuszny",
  "japońskie zapalenie mózgu",
  "inne według zaleceń lekarza w bardzo rzadkich sytuacjach"
];

const String gSouvenirsTitle = "Pamiątki";
const String gSouvenirsBody = "Warto przywieźć z Tajlandii oryginalne wyroby rzemieślnicze oraz rękodzielnicze, które będą stanowiły cenną pamiątkę z pobytu w tym niezwykłym kraju. Tajskie stragany są pełne przeróżnych ciekawych produktów.";

const String gForbiddenSouvenirsTitle = "Zabronione pamiątki";
const String gForbiddenSouvenirsBody = "Zabroniony jest wywóz statuetek oraz wizerunków Buddy, na których wywóz musimy mieć pozwolenie Ministerstwa Sztuki. Przepis ten nie dotyczy małych figurek noszonych przy sobie.";

const String gInsuranceTitle = "Ubezpieczenie";
const String gInsuranceBody = "Są Państwo ubezpieczeni w Signal Iduna standardowym ubezpieczeniem nie obejmującym chorób przewlekłych. Ubezpieczenie nie obowiązuje w momencie, gdy klient jest pod wpływem alkoholu lub/i narkotyków - wtedy nie ma zwrotu z polisy.";

const String gSumTitle = "Suma ubezpieczenia w poszczególnych ryzykach";
const List<String> gSumBody = [
  "Koszty leczenia - 30 000 EUR",
  "NNW - 16 000 PLN",
  "Bagaż podręczny - 1 800 PLN"
];

const String gAmbassyTitle = "Ambasada Rzeczypospolitej Polskiej w Królestwie Tajlandii";
const String gAmbassyBody = """Ambasador: Waldemar Dubaniowski
Unit 605-607, 6th Floor, Athenee Tower,
Wireless Road, Lumpini, Pathumwan,
Bangkok. 10330, Thailand
Tel.: +66 2 079 7300
Tel. alarmowy: : +66 819 364 618
""";


class ImportantInfoThailandWidget extends ImportantInfoWidget {
  List<Widget> fBuildListOfItemsTile(List<String> items) {
    return List<Widget>.from(
        items.map((item) => fBuildInsuranceRow(item)));
  }

  List<Widget> fBuildAccommodationTile() {
    return List<Widget>.from(gAccommodationBody.map((hotel) {
      return Row(
        children: <Widget>[
          Expanded(
              child: RichText(
            text: TextSpan(
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: hotel.split(":")[0],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ":"),
                  TextSpan(text: hotel.split(":")[1])
                ]),
          ))
        ],
      );
    }));
  }

  List<Widget> fBuildVaccinationsTile() {
    List<Widget> items = fBuildSimpleTextTile(gVaccinationsBody1);
    items.add(Padding(padding: EdgeInsets.symmetric(vertical: 10)));
    items.addAll(gVaccinationsBody2.map((item) => fBuildInsuranceRow(item)));
    return items;
  }

  Column fBuildInfoTiles() {
    mExpansionTileKeyList.clear();

    fAddExpansionTileToList(gAirConnectionTitle, fBuildListOfItemsTile(gAirConnectionBodyContent));
    fAddExpansionTileToList(gAirLineTitle, fBuildSimpleTextTile(gAirLineBody));
    fAddExpansionTileToList(gTravelLuggageTitle, fBuildListOfItemsTile(gTravelLuggageBody));
    fAddExpansionTileToList(gAccommodationTitle, fBuildAccommodationTile());
    fAddExpansionTileToList(gWisaTitle, fBuildSimpleTextTile(gWisaBody));
    fAddExpansionTileToList(gWelcomeTitle, fBuildListOfItemsTile(gWelcomeBody));
    fAddExpansionTileToList(gClimateTitle, fBuildSimpleTextTile(gClimateBody));
    fAddExpansionTileToList(gCurrencyTitle, fBuildSimpleTextTile(gCurrencyBody));
    fAddExpansionTileToList(gATMTitle, fBuildSimpleTextTile(gATMBody));
    fAddExpansionTileToList(gShoppingTitle, fBuildSimpleTextTile(gShoppingBody));
    fAddExpansionTileToList(gTimeTitle, fBuildSimpleTextTile(gTimeBody));
    fAddExpansionTileToList(gElectricityTitle, fBuildSimpleTextTile(gElectricityBody));
    fAddExpansionTileToList(gCultureTitle, fBuildSimpleTextTile(gCultureBody));
    fAddExpansionTileToList(gReligionTitle, fBuildSimpleTextTile(gReligionBody));
    fAddExpansionTileToList(gOutfitTitle, fBuildSimpleTextTile(gOutfitBody));
    fAddExpansionTileToList(gSafetyTitle, fBuildSimpleTextTile(gSafetyBody));
    fAddExpansionTileToList(gVaccinationsTitle, fBuildVaccinationsTile());
    fAddExpansionTileToList(gSouvenirsTitle, fBuildSimpleTextTile(gSouvenirsBody));
    fAddExpansionTileToList(gForbiddenSouvenirsTitle, fBuildSimpleTextTile(gForbiddenSouvenirsBody));
    fAddExpansionTileToList(gInsuranceTitle, fBuildSimpleTextTile(gInsuranceBody));
    fAddExpansionTileToList(gSumTitle, fBuildListOfItemsTile(gSumBody));
    fAddExpansionTileToList(gAmbassyTitle, fBuildSimpleTextTile(gAmbassyBody));

    return Column(children: mExpansionTileList);
  }
}

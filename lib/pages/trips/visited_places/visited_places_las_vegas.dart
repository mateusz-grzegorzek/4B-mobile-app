import 'package:business_mobile_app/pages/trips/visited_places/visited_place.dart';

const String gVisitedPlace1ImagePath =
    "assets/images/trips/las_vegas/places/place_1.png";
const String gVisitedPlace1Title = "Santa Monica ";
const String gVisitedPlace1Body =
    "Nadbrzeżne miasto w Stanach Zjednoczonych położone w zachodniej części hrabstwa i metropolii Los Angeles, "
    "w amerykańskim stanie Kalifornia. Miasto znane jest w Los Angeles z życia nocnego, "
    "wielu atrakcji oraz lokali i punktów handlowych zwłaszcza 3rd Street Promenade oraz molo – "
    "słynny Santa Monica Pier, który powstał w 1909 roku. Santa Monica słynie jako ośrodek turystyczny "
    "w południowej Kalifornii ze względu na śródziemnomorski klimat oraz położenie. "
    "Znana jest również z wielu drogich dzielnic zamieszkiwanych przez artystów oraz ludzi związanych z show biznesem. "
    "Obecnie Santa Monica przeżywa okres gwałtownego rozwoju i ekspansji, również jest jednym z modniejszych miejsc do bywania w południowej Kalifornii.";

const String gVisitedPlace2ImagePath =
    "assets/images/trips/las_vegas/places/place_2.png";
const String gVisitedPlace2Title = "Los Angeles ";
const String gVisitedPlace2Body =
    "Los Angeles nazywane jest Miastem Aniołów (City of Angels). "
    "Jest największym i najbardziej znanym miastem na Zachodnim Wybrzeżu USA. "
    "Miasto to stanowi światowe centrum biznesu, handlu międzynarodowego, rozrywki, "
    "kultury, mediów, mody, nauki, sportu, technologii i edukacji. "
    "Niedawno zostało uznane za 3. najbogatsze oraz 5. najbardziej wpływowe miasto świata. "
    "Ponieważ Los Angeles jest siedzibą Hollywood, zyskało przydomek „Światowej Stolicy Rozrywki”, "
    "przodując w produkcji filmów, programów telewizyjnych, sztuk scenicznych, gier wideo oraz muzyki. "
    "Ze względu na to, miasto zamieszkuje szerokie grono słynnych osób powiązanych z tymi branżami.";

const String gVisitedPlace3ImagePath =
    "assets/images/trips/las_vegas/places/place_3.png";
const String gVisitedPlace3Title = "Las Vegas ";
const String gVisitedPlace3Body =
    "Las Vegas trudno porównać do jakiegokolwiek innego miasta. "
    "I nie jest to tylko slogan speców od marketingu, ale najświętsza prawda o tym najmniej świętym ze wszystkich miast. "
    "Położone w najbardziej pustynnym ze stanów – Nevadzie, jeszcze sto lat temu było wypaloną słońcem kupą cegieł, "
    "rozrzuconych w pobliżu jedynej na trasie Los Angeles–Salt Like City kępy trzciny (Las Vegas to po hiszpańsku właśnie trzciny). "
    "Te rośliny na pustyni zwiastują wodę, w tym przypadku były zapowiedzią czegoś więcej. "
    "W ciągu wieku Las Vegas zmieniło się z przeciętnej mieściny w pełną przepychu, zalaną światłami i hektolitrami alkoholu świątynię hazardu. "
    "Miejsce „bardzo lekkich obyczajów”, wielkich pieniędzy i licznych afer towarzyskich. A wszystko to przez pewnego Żyda polskiego pochodzenia, "
    "który w 1911 roku wraz z rodziną wylądował w Nowym Świecie.";

const String gVisitedPlace4ImagePath =
    "assets/images/trips/las_vegas/places/place_4.png";
const String gVisitedPlace4Title = "Grand Canyon ";
const String gVisitedPlace4Body =
    "Wielki Kanion to głęboki jar w środkowym biegu rzeki Kolorado, "
    "położony na wyżynie o tej samej nazwie, w północnej części amerykańskiego stanu Arizona. "
    "Długi na 446 kilometrów, powstał w wyniku erozji rzeki, która doprowadziła do rozcięcia powierzchni "
    "wyżyny złożonej ze skał pamiętających jeszcze czasy mezozoiku, paleozoiku, a nawet prekambru. "
    "Wielki Kanion jest jednym z najwspanialszych cudów natury na ziemi, Stanąć na jego krawędzi i podziwiać jego ogrom "
    "i oszałamiające piękno to niezapomniane przeżycie, szczególnie na Skywalk!";

const String gVisitedPlace5ImagePath =
    "assets/images/trips/las_vegas/places/place_5.png";
const String gVisitedPlace5Title = "Tama Hoovera ";
const String gVisitedPlace5Body =
    "To niezwykła konstrukcja architektoniczna o wysokości prawie 250 metrów. "
    "Charakterystyczna, betonowa ściana spiętrzająca rzekę Kolorado to ni tylko jeden z symboli Stanów Zjednoczonych. "
    "Konstrukcja, wzniesiona w czasach wielkiego kryzysu jest zarazem dowodem kunsztu inżynierów, a przy okazji miejscem, "
    "które przyczyniło się do śmierci wielu swoich budowniczych.";

final place1 = VisitedPlace(
    gVisitedPlace1Title, gVisitedPlace1Body, gVisitedPlace1ImagePath);
final place2 = VisitedPlace(
    gVisitedPlace2Title, gVisitedPlace2Body, gVisitedPlace2ImagePath);
final place3 = VisitedPlace(
    gVisitedPlace3Title, gVisitedPlace3Body, gVisitedPlace3ImagePath);
final place4 = VisitedPlace(
    gVisitedPlace4Title, gVisitedPlace4Body, gVisitedPlace4ImagePath);
final place5 = VisitedPlace(
    gVisitedPlace5Title, gVisitedPlace5Body, gVisitedPlace5ImagePath);

List<VisitedPlace> gVisitedPlacesLasVegas = [
  place1,
  place2,
  place3,
  place4,
  place5
];

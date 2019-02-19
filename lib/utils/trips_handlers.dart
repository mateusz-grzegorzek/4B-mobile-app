import 'package:business_mobile_app/pages/trips/trips_page.dart';

bool isLasVegasTrip() {
  if (gTripsList[gCurrentTripIndex].mUserName.contains("LasVegas")) {
    return true;
  } else {
    return false;
  }
}

bool isThailandTrip() {
  if (gTripsList[gCurrentTripIndex].mUserName == "Mitsubishi") {
    return true;
  } else {
    return false;
  }
}

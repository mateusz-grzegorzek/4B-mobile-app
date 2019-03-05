import 'package:business_mobile_app/pages/trips/trips_page.dart';

bool isLasVegasTrip() {
  if (gTripsList[gCurrentTripIndex].mUserName.contains("LasVegas")) {
    return true;
  } else {
    return false;
  }
}

bool isThailandTrip() {
  if (gTripsList[gCurrentTripIndex].mUserName == "Mitsubishi" ||
      gTripsList[gCurrentTripIndex].mUserName == "Essilor1" ||
      gTripsList[gCurrentTripIndex].mUserName == "Essilor2") {
    return true;
  } else {
    return false;
  }
}

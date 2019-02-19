import 'package:business_mobile_app/pages/trips/important_info/important_info.dart';
import 'package:flutter/material.dart';

const List<String> gAirConnectionBodyContent = [
  "24.02.2019 Warszawa – Dubaj 13:25-22:05           Dubaj – Bangkok 03:05-12:05 (+1)",
  "03.03.2019 Bangkok – Dubaj 02:00-06:00 	        Dubaj – Warszawa 08:05-11:20"
];

class ImportantInfoThailandWidget extends ImportantInfoWidget {
  List<Widget> fBuildAirConnectionTile() {
    return List<Widget>.from(
        gAirConnectionBodyContent.map((flight) => fBuildInsuranceRow(flight)));
  }

  Column fBuildInfoTiles() {
    mExpansionTileKeyList.clear();

    fAddExpansionTileToList(gAirConnectionTitle, fBuildAirConnectionTile());

    return Column(children: mExpansionTileList);
  }
}

import 'package:business_mobile_app/pages/trips/important_info/important_info_las_vegas.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';
import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/trips_handlers.dart';
import 'package:business_mobile_app/utils/widgets/expand_all_tiles.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

List<Widget> fBuildImportantInfoWidget(
    List<GlobalKey<AppExpansionTileState>> aExpansionTileKeyList,
    Widget aInfoTiles) {
  return <Widget>[
    fPrintHeadingText(" Ważne informacje"),
    Padding(padding: EdgeInsets.all(5)),
    ExpandAllTilesWidget(aExpansionTileKeyList),
    Padding(padding: EdgeInsets.all(5)),
    aInfoTiles
  ];
}

class ImportantInfoPage extends StatefulWidget {
  static const String Id = "ImporatantInfoPage";
  static const String Title = "Ważne informacje";
  @override
  _ImportantInfoPageState createState() => _ImportantInfoPageState();
}

class _ImportantInfoPageState extends State<ImportantInfoPage> {
  var mImportantInfoLasVegasWidget = ImportantInfoLasVegasWidget();

  Widget fBuildBody() {
    var importantInfoTiles;
    if (isLasVegasTrip()) {
      importantInfoTiles = mImportantInfoLasVegasWidget.fBuild();
    } else {
      importantInfoTiles = fBuildNullWidget(); // ToDo: Add Thailand
    }

    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: importantInfoTiles),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage(
        "assets/images/imp_info_top_image.png", fBuildBody(), TripsPage.drawer);
  }
}

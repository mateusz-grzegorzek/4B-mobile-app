import '../trips_page.dart';
import 'package:flutter/material.dart';

class ImporatantInfoWidget extends StatefulWidget {
  @override
  ImporatantInfoPage createState() => new ImporatantInfoPage();
}

class ImporatantInfoPage extends State<ImporatantInfoWidget> {
  static const String Id = "ImporatantInfoPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemCount: gImportantInfo.length,
        itemBuilder: (BuildContext context, int index) =>
          gImportantInfo[index].fGetTileCard()
      )
    );
  }
}

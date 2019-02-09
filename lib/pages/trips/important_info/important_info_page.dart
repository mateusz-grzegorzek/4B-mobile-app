import 'package:flutter/material.dart';
import '../trips_page.dart';
import '../../../utils/widgets/appbars.dart';

class ImporatantInfoPage extends StatefulWidget {
  static const String Id = "ImporatantInfoPage";
  static const String Title = "Ważne informacje przed wyjazdem";
  @override
  _ImporatantInfoPageState createState() => new _ImporatantInfoPageState();
}

class _ImporatantInfoPageState extends State<ImporatantInfoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: fGetDefaultAppBar(ImporatantInfoPage.Title),
      body: ListView.builder(
        itemCount: gImportantInfo.length,
        itemBuilder: (BuildContext context, int index) =>
          gImportantInfo[index].fGetTileCard()
      )
    );
  }
}

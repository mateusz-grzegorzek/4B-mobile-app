import '../trips_page.dart';
import 'package:flutter/material.dart';

class ImporatantInfoPage extends StatefulWidget {
  static const String Id = "ImporatantInfoPage";
  @override
  _ImporatantInfoPageState createState() => new _ImporatantInfoPageState();
}

class _ImporatantInfoPageState extends State<ImporatantInfoPage> {
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

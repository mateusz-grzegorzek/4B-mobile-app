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
        itemBuilder: (BuildContext context, int index) => new ListTile(
                title: new Text(
              gImportantInfo[index],
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            )),
        itemCount: gImportantInfo.length,
      ),
    );
  }
}

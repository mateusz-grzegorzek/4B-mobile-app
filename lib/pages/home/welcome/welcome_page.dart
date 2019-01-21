import 'package:flutter/material.dart';
import '../../home/home_page.dart';

class WelcomePageWidget extends StatefulWidget {
  @override
  WelcomePage createState() => new WelcomePage();
}

class WelcomePage extends State<WelcomePageWidget> {
  static const String Id = "WelcomePage";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(40)),
              new Container(
                child: new Image(
                    image: AssetImage("assets/images/logo_white.png")),
              ),
              new Padding(padding: EdgeInsets.all(40)),
              new Text(
                "Lider wyjazdów w Polsce",
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: gGoldColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}

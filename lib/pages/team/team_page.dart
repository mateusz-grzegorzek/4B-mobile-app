import 'package:flutter/material.dart';
import '../../utils/firebase_data.dart';
import '../../utils/shared_preferences.dart';

String gTeam = "Nasz zespół";

void fGetAboutUsFromMemory() {
  gTeam = gPrefs.getString(gTeamDatabaseKey);
}

class TeamPageWidget extends StatefulWidget {
  static const String Id = "TeamPageWidget";
  const TeamPageWidget({Key aKey}) : super(key: aKey);
  @override
  TeamPage createState() => new TeamPage();
}

class TeamPage extends State<TeamPageWidget> {
  @override
  void initState() {
    print("TeamPage:initState");
    super.initState();
  }

  @override
  void dispose() {
    print("TeamPage:dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Card(
            child: new ListTile(
                title: new Column(
      children: <Widget>[
        new Padding(padding: EdgeInsets.all(5.0)),
        new Text(
          gTeam,
          style: new TextStyle(
              color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    ))));
  }
}

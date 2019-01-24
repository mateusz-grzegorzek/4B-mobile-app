import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/contact/contact_info.dart';
import '../../common/contact/contact_list.dart';

import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';

List<ContactInfo> gContactsList = new List<ContactInfo>();

void fGetContactsFromMemory() {
  String contactsJson = gPrefs.getString(gContactsDatabaseKey);
  if (contactsJson != null) {
    gContactsList
        .addAll(json.decode(contactsJson).map<ContactInfo>((contactInfo) {
      return new ContactInfo(
          contactInfo['mId'],
          contactInfo['mName'],
          contactInfo['mDescription'],
          contactInfo['mPhoneNumber'],
          contactInfo['mEmail']);
    }).toList());
  }
}

void fAddContactToList(aContactId, aContactInfo) {
  print("fAddContactToList");
  ContactInfo contactInfo = new ContactInfo(
      fGetDatabaseId(aContactId, 2),
      aContactInfo["name"],
      aContactInfo["description"],
      aContactInfo['phone_number'],
      aContactInfo['email']);
  contactInfo.log();
  gContactsList.add(contactInfo);
}

class MainContactWidget extends StatefulWidget {
  @override
  MainContactPage createState() => new MainContactPage();
}

class MainContactPage extends State<MainContactWidget> {
  static const String Id = "MainContactPage";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child: new ListView(
        children: <Widget>[
          fBuildSocialMediaRow(),
          fBuildCompanyName(),
          fBuildAddressWidget(),
          new ContactListWidget(
              mDatabaseKey: gContactsDatabaseKey, mContactsList: gContactsList)
        ],
      )),
    );
  }

  Widget fBuildSocialMediaRow() {
    return new Container(
      padding: EdgeInsets.all(10.0),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Image.asset(
            "assets/social_media/facebook.png",
            height: 50.0,
          ),
          onPressed: () => launch("https://www.facebook.com/4BusinessTeam/"),
        ),
        IconButton(
          icon: Image.asset(
            "assets/social_media/instagram.png",
            height: 50.0,
          ),
          onPressed: () => launch("https://www.instagram.com/4business_team/"),
        ),
        IconButton(
          icon: Image.asset(
            "assets/social_media/linkedin.png",
            height: 50.0,
          ),
          onPressed: () => launch("https://www.linkedin.com/company/3297050"),
        )
      ],
    ));
  }

  Widget fBuildCompanyName() {
    return new Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "4BUSINESS TEAM SP. Z O.O.",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget fBuildAddressWidget() {
    String address = """
    ul. Wieniawskiego 66/31
    31-436 Kraków
    """;
    String tel = "+48124100440";
    String telText = "tel/fax +48 12 410 04 40";
    String email = "biuro@4b.com.pl";

    TextStyle textStyle = new TextStyle(color: Colors.grey, fontSize: 16.0);

    return new Container(
      padding: EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(address, style: textStyle, textAlign: TextAlign.center),
          new FlatButton(
            padding: EdgeInsets.all(0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () => launch("tel://" + tel),
            child: new Text(telText, style: textStyle),
          ),
          new FlatButton(
            padding: EdgeInsets.all(0),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () => launch("mailto://" + email),
            child: new Text(email, style: textStyle),
          )
        ],
      ),
    );
  }
}

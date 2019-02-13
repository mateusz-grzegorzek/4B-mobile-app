import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/contact/contact_info.dart';
import '../../common/contact/contact_list.dart';

import '../../../utils/print.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';
import '../../../utils/widgets/app_bar.dart';

List<ContactInfo> gContactsList = new List<ContactInfo>();

void fGetContactsFromMemory() {
  String contactsJson = gPrefs.getString(gContactsDatabaseKey);
  if (contactsJson != null) {
    gContactsList
        .addAll(json.decode(contactsJson).map<ContactInfo>((aContactInfo) {
      return ContactInfo.fromJson(aContactInfo);
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

class MainContactPage extends StatefulWidget {
  static const String Id = "MainContactPage";
  static const String Title = "Kontakt";
  @override
  _MainContactPageState createState() => new _MainContactPageState();
}

class _MainContactPageState extends State<MainContactPage> {
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    super.initState();
    mStreamSub = fGetStream(gContactsDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gContactsDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          fBuildSilverAppBar("assets/images/appbars/main_contacts.png"),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return fBuildBody();
            }, childCount: 1),
          )
        ],
      ),
    );
  }

  Widget fBuildBody() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            fPrintHeadingText(MainContactPage.Title),
            fBuildSocialMediaRow(),
            fBuildAddressWidget(),
            new ContactListWidget(
                mDatabaseKey: gContactsDatabaseKey,
                mContactsList: gContactsList)
          ],
        ));
  }

  Widget fBuildSocialMediaRow() {
    double iconSize = 70.0;

    return new Container(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            fBuildImageButton("assets/social_media/facebook.png", iconSize,
                "https://www.facebook.com/4BusinessTeam/"),
            fBuildImageButton("assets/social_media/instagram.png", iconSize,
                "https://www.instagram.com/4business_team/"),
            fBuildImageButton("assets/social_media/linkedin.png", iconSize,
                "https://www.linkedin.com/company/3297050"),
          ],
        ));
  }

  Widget fBuildAddressWidget() {
    String companyName = "4BUSINESS TEAM SP. Z O.O.";
    String address = """
ul. Wieniawskiego 66/31
31-436 Kraków""";
    String tel = "+48124100440";
    String telText = "tel/fax +48 12 410 04 40";
    String email = "biuro@4b.com.pl";

    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintBoldText(companyName),
          fPrintBoldText(address),
          GestureDetector(
            child: fPrintBoldText(telText),
            onTap: () => launch("tel://" + tel),
          ),
          GestureDetector(
            child: fPrintBoldText(email),
            onTap: () => launch("mailto://" + email),
          ),
        ],
      ),
    );
  }
}

import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'offer/offer_page.dart';
import 'about_us/about_us_page.dart';
import 'login/login_page.dart';
import 'contact/contact_page.dart';

import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/menu_bar.dart';
import '../../utils/fonts.dart';

const String gPrivacyPolicyLink = ""
    "https://firebasestorage.googleapis.com/v0/b/business-mobile-app-afe2b.appspot.com/o/4business_mobile_app_privacy_policy.html?alt=media&token=6beccc50-53bf-4f79-b78f-f358bcae86b9";

void fChangePage(BuildContext aContext, String aPageId) {
  Navigator.pop(aContext);
  Navigator.of(aContext).pushNamed(aPageId);
}

class HomePage extends StatelessWidget {
  static const String Id = "HomePage";
  static const String Title = "4Business Team";

  static MenuBar drawer = MenuBar(<MenuItem>[
    MenuItem(AboutUsPage.Id, AboutUsPage.Title),
    MenuItem(OfferPage.Id, OfferPage.Title),
    MenuItem(MainContactPage.Id, MainContactPage.Title),
    MenuItem(LoginPage.Id, LoginPage.Title)
  ]);

  @override
  Widget build(BuildContext aContext) {
    final body = Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(40)),
          Container(
            child: Image(
              image: AssetImage("assets/images/logo_white.png"),
              width: 150,
            ),
          ),
          Padding(padding: EdgeInsets.all(40)),
          Text(
            "Lider wyjazdów w Polsce",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Amithen',
                color: gBrownColor,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: fBuildButton(() => launch(gPrivacyPolicyLink),
                      "Zobacz politykę prywatności."))),
        ],
      ),
    );

    Widget fBuildPage() {
      return Scaffold(
          backgroundColor: Colors.black,
          appBar: fGetDefaultAppBar(),
          drawer: HomePage.drawer,
          body: body);
    }

    return fBuildWillPopScope(fBuildPage());
  }
}

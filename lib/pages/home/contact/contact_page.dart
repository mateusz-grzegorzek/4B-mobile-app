import 'package:business_mobile_app/pages/common/contact/contact_info.dart';
import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/contact/contact_info.dart';
import '../../common/contact/contact_list.dart';
import '../../../utils/print.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';

class MainContactPage extends StatelessWidget {
  static const String Id = "MainContactPage";
  static const String Title = "Kontakt";

  final List<ContactInfo> mContactInfoList = [
    ContactInfo(0, "Grzegorz Bartosz", "Prezes Zarządu", "+48 602 462 677",
        "gb@4b.com.pl"),
    ContactInfo(1, "Michał Kobylarczyk", "Wiceprezes Zarządu",
        "+48 602 50 60 90", "mk@4b.com.pl"),
    ContactInfo(2, "Karolina Lapczyk", "Specjalista ds. Incentive",
        "+48 606 712 444", "karolina@4b.com.pl"),
    ContactInfo(3, "Katarzyna Drążek", "Event Manager", "+48 796 109 610",
        "katarzyna@4b.com.pl"),
    ContactInfo(4, "Damian Urbaniec", "Manager ds. Sponsoringu",
        "+48 733 777 777", "sport@4b.com.pl")
  ];

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage("assets/images/appbars/main_contacts.png",
        fBuildBody(), HomePage.drawer);
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
            ContactListWidget(mContactsList: mContactInfoList)
          ],
        ));
  }

  Widget fBuildSocialMediaRow() {
    double iconSize = 70.0;

    return Container(
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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_info.dart';

import '../../../utils/fonts.dart';
import '../../../utils/print.dart';
import '../../../utils/firebase_data.dart';

class ContactListWidget extends StatefulWidget {
  static const String Id = "ContactListPage";
  final List<ContactInfo> mContactsList;
  final String mDatabaseKey;

  const ContactListWidget({Key key, this.mContactsList, this.mDatabaseKey})
      : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactListWidget> {
  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("ContactListPage:initState");
    super.initState();
    mStreamSub = fGetStream(widget.mDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("ContactListPage:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(widget.mDatabaseKey);
  }

  void fSortContactList() {
    widget.mContactsList.sort((firstContact, secondContact) {
      if (firstContact.mId > secondContact.mId) {
        return 1;
      } else {
        return -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ContactListPage:build:mContactsList.length=" +
        widget.mContactsList.length.toString());
    fSortContactList();
    return Column(
        children: widget.mContactsList
            .map((item) => _ContactListItem(item))
            .toList());
  }
}

class _ContactListItem extends ListTile {
  final ContactInfo contactInfo;

  _ContactListItem(this.contactInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(height: 15, color: gBrownColor),
          fPrintText(contactInfo.mName, gMenuItemTextStyle),
          Padding(padding: EdgeInsets.only(top: 5.0)),
          fBuildDescriptionRow(),
          fBuildTelRow(),
          (contactInfo.mEmail != "")
              ? fBuildEmailRow()
              : fBuildNullWidget(),
        ],
      ),
    );
  }

  Widget fBuildDescriptionRow() {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            fBuildImageWidget("assets/images/contacts/person.png", 20),
            Padding(padding: EdgeInsets.only(left: 20.0)),
            fPrintText(contactInfo.mDescription)
          ],
        ));
  }

  Widget fBuildTelRow() {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            fBuildImageWidget("assets/images/contacts/phone.png", 20),
            Padding(padding: EdgeInsets.only(left: 20.0)),
            GestureDetector(
              child: fPrintText("tel. " + contactInfo.mPhoneNumber),
              onTap: () => launch("tel://" + contactInfo.mPhoneNumber),
            ),
          ],
        ));
  }

  Widget fBuildEmailRow() {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            fBuildImageWidget("assets/images/contacts/email.png", 20),
            Padding(padding: EdgeInsets.only(left: 20.0)),
            GestureDetector(
                child: fPrintText(contactInfo.mEmail),
                onTap: () => launch("mailto://" + contactInfo.mEmail))
          ],
        ));
  }
}

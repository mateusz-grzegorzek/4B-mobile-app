import 'dart:convert';
import 'package:flutter/material.dart';

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
    return new ContactWidget(mDatabaseKey: gContactsDatabaseKey,mContactsList: gContactsList);
  }
}

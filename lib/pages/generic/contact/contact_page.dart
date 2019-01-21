import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';
import 'contact_info.dart';

List<ContactInfo> gContactsList = new List<ContactInfo>();

void fGetContactsFromMemory() {
  String contactsJson = gPrefs.getString(gContactsDatabaseKey);
  if (contactsJson != null) {
    gContactsList
        .addAll(json.decode(contactsJson).map<ContactInfo>((contactInfo) {
      return new ContactInfo(contactInfo['mId'], contactInfo['mName'],
          contactInfo['mDescription'], contactInfo['mPhoneNumber']);
    }).toList());
  }
}

void fAddContactToList(aContactId, aContactInfo) {
  print("fAddContactToList");
  ContactInfo contactInfo = new ContactInfo(
      fGetDatabaseId(aContactId, 2),
      aContactInfo["name"],
      aContactInfo["description"],
      aContactInfo['phone_number']);
  contactInfo.log();
  gContactsList.add(contactInfo);
}

class ContactWidget extends StatefulWidget {
  @override
  ContactPage createState() => new ContactPage();
}

class ContactPage extends State<ContactWidget> {
  static const String Id = "ContactPage";

  StreamSubscription<bool> mStreamSub;

  @override
  void initState() {
    print("ContactPage:initState");
    super.initState();
    mStreamSub = fGetStream(gContactsDatabaseKey).listen((aContactInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("ContactPage:dispose");
    super.dispose();
    mStreamSub.cancel();
    fCloseStream(gContactsDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    print("ContactPage:build:gContactsList.length=" +
        gContactsList.length.toString());
    gContactsList.sort((firstContact, secondContact) {
      if (firstContact.mId > secondContact.mId) {
        return 1;
      } else {
        return -1;
      }
    });
    return new Scaffold(
        body: new ListView.builder(
            itemCount: gContactsList.length,
            padding: const EdgeInsets.all(6.0),
            itemBuilder: (context, index) {
              return new Card(
                child: new ListTile(
                  leading: new Icon(Icons.person),
                  title: new Column(
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.all(5.0)),
                      new Text(
                        gContactsList[index].mName,
                        style: new TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  subtitle: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(padding: EdgeInsets.all(5.0)),
                      new Text(
                        gContactsList[index].mDescription,
                        style: new TextStyle(color: Colors.blueAccent),
                      ),
                      new Padding(padding: EdgeInsets.all(5.0)),
                      new Text(gContactsList[index].mPhoneNumber),
                      new Padding(padding: EdgeInsets.all(5.0)),
                    ],
                  ),
                  trailing: new Icon(Icons.phone),
                  onTap: () =>
                      launch("tel://" + gContactsList[index].mPhoneNumber),
                ),
              );
            }));
  }
}

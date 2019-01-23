import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_info.dart';

import '../../../utils/firebase_data.dart';


class ContactListWidget extends StatefulWidget {
  final List<ContactInfo> mContactsList;
  final String mDatabaseKey;

  const ContactListWidget({Key key, this.mContactsList, this.mDatabaseKey}): super(key: key);

  @override
  ContactListPage createState() => new ContactListPage();
}

class ContactListPage extends State<ContactListWidget> {
  static const String Id = "ContactListPage";

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

  void fsortContactList() {
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
    fsortContactList();
    return new Scaffold(
        body: new ListView.builder(
            itemCount: widget.mContactsList.length,
            padding: const EdgeInsets.all(6.0),
            itemBuilder: (context, index) {
              return new Card(
                  child: new _ContactListItem(widget.mContactsList[index]));
            }));
  }
}

class _ContactListItem extends ListTile {
  _ContactListItem(ContactInfo contactInfo)
      : super(
          leading: new Container(child: new Icon(Icons.person)),
          title: new Container(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text(contactInfo.mName,
                  style: new TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0))
            ],
          )),
          subtitle: new Container(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[new Text(contactInfo.mDescription)],
          )),
          trailing: new Container(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                (contactInfo.mEmail != "") ? new IconButton(
                  icon: Icon(Icons.email),
                  onPressed: () => launch("mailto://" + contactInfo.mEmail)
                ) : new Container(width: 0, height: 0),
                new IconButton(
                    icon: Icon(Icons.phone),
                    padding: new EdgeInsets.all(1.0),
                    onPressed: () => launch("tel://" + contactInfo.mPhoneNumber))
              ],
            ),
          ),
        );    
}

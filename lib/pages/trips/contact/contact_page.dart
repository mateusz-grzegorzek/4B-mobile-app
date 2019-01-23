import 'package:flutter/material.dart';

import '../trips_page.dart';
import '../../common/contact/contact_list.dart';
import '../../../utils/firebase_data.dart';

class TripContactWidget extends StatefulWidget {
  @override
  TripContactPage createState() => new TripContactPage();
}

class TripContactPage extends State<TripContactWidget> {
  static const String Id = "TripContactPage";

  @override
  Widget build(BuildContext context) {
    return new ContactListWidget(
      mDatabaseKey: gTripsDatabaseKey,
      mContactsList: gTripContacts,
    );
  }
}

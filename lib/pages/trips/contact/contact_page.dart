import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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
    return new Scaffold(
      body: Center(
        child: new ListView(
          children: <Widget>[
            new ContactListWidget(
              mDatabaseKey: gTripsDatabaseKey,
              mContactsList: gTripContacts,
            ),
            new HotelInformationCard()
          ],
        )
      )
    );
  }
}

class HotelInformationCard extends StatelessWidget {
  final String name = "EXCALIBUR HOTEL & CASINO***";
  final String phoneNumber = "+17025977777";
  final String locationLink = "https://goo.gl/maps/p9rh5spB3nk";
  final List address = ["3850 S Las Vegas Blvd, Las Vegas", "NV 89109, Stany Zjednoczone"];

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          fBuildHotelName(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              fBuildAddress(),
              fBuildContactColumn()
            ],
          )
        ],
      )
    );
  }

  Text fBuildHotelName() {
    return new Text(
      name,
      style: new TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 18.0
      ),
    );
  }

  Container fBuildAddress() {
    return new Container(
      child: new Flexible(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: address.map((item) => new Text(item)).toList()
        ),
      ),
    );
  }

  Container fBuildContactColumn() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.phone),
            onPressed: () =>
                launch("tel://" + phoneNumber),
          ),
          new IconButton(
            icon: Icon(Icons.map),
            onPressed: () =>
                launch(locationLink),
          )
        ],
      ),
    );
  }
}

// TODO Map Box can be placed in hotel address
// https://medium.com/flutter-io/google-maps-and-flutter-cfb330f9a245
class _Map extends StatelessWidget {
  const _Map({
    @required this.center,
    @required this.mapController,
    @required this.onMapCreated,
    Key key,
  })  : assert(center != null),
        assert(onMapCreated != null),
        super(key: key);

  final LatLng center;
  final GoogleMapController mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4.0,
      child: SizedBox(
        width: 340.0,
        height: 240.0,
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 16.0,
          ),
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../map/map_page.dart';
import '../map/map_place.dart';
import 'event_info.dart';

class EventDetailsPageWidget extends StatefulWidget {
  EventDetailsPageWidget(this.eventInfo);
  final EventInfo eventInfo;

  @override
  EventDetailsPage createState() => new EventDetailsPage();
}

class EventDetailsPage extends State<EventDetailsPageWidget> {
  @override
  Widget build(BuildContext aContext) {
    EventInfo eventInfo = widget.eventInfo;
    MapPlace eventPlace = fGetPlaceById(eventInfo.mPlaceId);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Event details"),
        ),
        body: new Card(
          margin: EdgeInsets.all(6.0),
          child: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Center(
                  child: new Column(
                    children: <Widget>[
                      new Text(
                          new DateFormat.Hm().format(eventInfo.mStartTime) +
                              " - " +
                              new DateFormat.Hm().format(eventInfo.mEndTime),
                          style: new TextStyle(
                              color: Colors.blue, fontSize: 20.0)),
                      new Padding(padding: EdgeInsets.all(5.0)),
                      new Divider(color: Colors.blue),
                      new Text(
                        eventInfo.mTitle,
                        style: new TextStyle(fontSize: 30.0),
                      ),
                      new Divider(color: Colors.blue)
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.all(5.0)),
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new Text(eventInfo.mBody),
                ),
                new Padding(padding: EdgeInsets.all(5.0)),
                new Divider(color: Colors.blue),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(Icons.pin_drop, size: 150.0),
                    new Expanded(
                      child: new Center(
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Padding(padding: EdgeInsets.all(10.0)),
                              new Text(
                                eventPlace.mName,
                                textAlign: TextAlign.center,
                                style: new TextStyle(fontSize: 20.0),
                              ),
                              new Padding(padding: EdgeInsets.all(5.0)),
                              new Text(
                                eventPlace.mAddress,
                                textAlign: TextAlign.center,
                                style: new TextStyle(fontSize: 20.0),
                              ),
                              new Padding(padding: EdgeInsets.all(5.0)),
                              new SizedBox(
                                width: 150.0,
                                height: 50.0,
                                child: new RaisedButton(
                                  color: Colors.blue,
                                  child: new Text("Show on map"),
                                  onPressed: () => MapPage.fNavigateTo(
                                      eventPlace.mCoordX, eventPlace.mCoordY),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

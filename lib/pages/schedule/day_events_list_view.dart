import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'event_info.dart';
import 'favourite_button.dart';
import 'event_details_page.dart';

class DayEventsListView extends ListView {
  final List<EventInfo> mEventInfoList = new List<EventInfo>();

  @override
  Widget build(BuildContext aContext) {
    print("DayEventsListView:build");
    return new ListView.builder(
      itemCount: mEventInfoList.length,
      itemBuilder: (BuildContext context, int index) {
        EventInfo eventInfo = mEventInfoList[index];
        Color eventColor;
        if (DateTime.now().difference(eventInfo.mStartTime).isNegative) {
          eventColor = Colors.white;
        } else {
          eventColor = Colors.grey[400];
        }
        return new Card(
          color: eventColor,
          child: new ListTile(
            leading: new FavoriteButtonWidget(eventInfo.mId, eventInfo.mTitle,
                eventInfo.mBody, eventInfo.mStartTime),
            title: new Text(
              new DateFormat.Hm().format(eventInfo.mStartTime) +
                  " - " +
                  new DateFormat.Hm().format(eventInfo.mEndTime),
              style: new TextStyle(color: Colors.blue),
            ),
            subtitle: new Text(eventInfo.mTitle),
            trailing: new Icon(Icons.arrow_forward),
            onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          new EventDetailsPageWidget(eventInfo)),
                ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../utils/shared_preferences.dart';
//import '../../utils/notification.dart';

class FavoriteButtonWidget extends StatefulWidget {
  FavoriteButtonWidget(this.mNotificationId, this.mNotificationTitle,
      this.mNotificationBody, this.mNotificationTime);
  final int mNotificationId;
  final String mNotificationTitle;
  final String mNotificationBody;
  final DateTime mNotificationTime;

  @override
  FavoriteButton createState() =>
      new FavoriteButton("favourite:" + mNotificationId.toString());
}

class FavoriteButton extends State<FavoriteButtonWidget> {
  FavoriteButton(this.mNotificationIdKeyInShared);
  String mNotificationIdKeyInShared;

  void fOnFavouriteButtonClick() async {
    bool isFavourite = gPrefs.getBool(mNotificationIdKeyInShared) ?? false;
    print("FavoriteButton:fOnFavouriteButtonClick:isFavourite=$isFavourite");
    if (!isFavourite) {
      gPrefs.setBool(mNotificationIdKeyInShared, true);
      /* ToDo: Write implementation for iOS */
      /*
      await fScheduleNotification(
          widget.mNotificationId,
          widget.mNotificationTitle,
          widget.mNotificationBody,
          widget.mNotificationTime.add(new Duration(minutes: -1)));
      */
    } else {
      gPrefs.setBool(mNotificationIdKeyInShared, false);
      /* ToDo: Write implementation for iOS */
      //fCancelNotification(widget.mNotificationId);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext aContext) {
    Icon favouriteIcon;
    bool isFavourite = gPrefs.getBool(mNotificationIdKeyInShared) ?? false;
    print("FavoriteButton:build:isFavourite=$isFavourite");
    if (!isFavourite) {
      favouriteIcon = new Icon(Icons.star_border);
    } else {
      favouriteIcon = new Icon(Icons.star, color: Colors.yellow);
    }
    return new IconButton(
        icon: favouriteIcon, onPressed: fOnFavouriteButtonClick);
  }
}

import 'dart:async';

import 'package:business_mobile_app/utils/firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/trips_handlers.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/pages/trips/news/news_info.dart';
import 'package:business_mobile_app/pages/trips/trips_page.dart';

class NewsPage extends StatefulWidget {
  static const String Id = "NewsPage";
  static const String Title = "Aktualności";
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  StreamSubscription<bool> mStreamSubscription;

  @override
  void initState() {
    print("_NewsPageState:initState");
    super.initState();
    mStreamSubscription = fGetStream(gTripsDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_NewsPageState:dispose");
    super.dispose();
    mStreamSubscription.cancel();
    fCloseStream(gTripsDatabaseKey);
  }

  Widget fBuildBody() {
    List<Widget> items = [
      Padding(padding: EdgeInsets.only(top: 10)),
      fPrintHeadingText(NewsPage.Title),
      Padding(padding: EdgeInsets.only(top: 10)),
    ];
    items.addAll(fGetNewsList().map((item) => _NewsItem(item)));
    items.add(Padding(padding: EdgeInsets.only(top: 20)));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: items),
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBarImageAssetPath;
    if (isLasVegasTrip()) {
      appBarImageAssetPath = "assets/images/appbars/news.png";
    } else if (isThailandTrip()) {
      appBarImageAssetPath =
          "assets/images/trips/thailand/appbar.jpg";
    }
    return fBuildSilverPage(
        appBarImageAssetPath, fBuildBody(), TripsPage.drawer);
  }
}

class _NewsItem extends StatelessWidget {
  final NewsInfo newsItem;

  _NewsItem(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              fPrintText(newsItem.mDate, gMenuItemTextStyle),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              Expanded(
                  child: Container(
                color: gBrownColor,
                height: 1,
              ))
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          fPrintBoldText(newsItem.mTitle),
          Padding(padding: EdgeInsets.only(top: 10)),
          fPrintText(newsItem.mBody)
        ],
      ),
    );
  }
}

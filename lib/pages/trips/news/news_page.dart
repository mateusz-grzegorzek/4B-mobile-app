import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/pages/trips/news/news_info.dart';
import '../../../utils/firebase_data.dart';
import '../../../utils/shared_preferences.dart';

final List<NewsInfo> gNewsList = new List<NewsInfo>();

void fGetNewsFromMemory() {
  String newsJson = gPrefs.getString(gNewsDatabaseKey);
  if (newsJson != null) {
    gNewsList.addAll(json.decode(newsJson).map<NewsInfo>((aNewsInfo) {
      return NewsInfo.fromJson(aNewsInfo);
    }).toList());
  }
}

void fAddNewsToList(aNewsId, aNewsInfo) {
  int newsId = fGetDatabaseId(aNewsId, 3);
  print("FirebaseData:fAddNewsToList");
  NewsInfo newsInfo = NewsInfo(newsId, aNewsInfo["title"], aNewsInfo["body"], aNewsInfo["date"]);
  newsInfo.fLog();
  gNewsList.add(newsInfo);
}

class NewsPage extends StatefulWidget {
  static const String Id = "NewsPage";
  static const String Title = "Aktualności";
  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  StreamSubscription<bool> mNewsStreamSubscription;

  @override
  void initState() {
    print("_NewsPageState:initState");
    super.initState();
    mNewsStreamSubscription = fGetStream(gNewsDatabaseKey).listen((aNewsInfo) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    print("_NewsPageState:dispose");
    super.dispose();
    mNewsStreamSubscription.cancel();
    fCloseStream(gNewsDatabaseKey);
  }

  @override
  Widget build(BuildContext context) {
    print(
        "_NewsPageState:build:gNewsList.length=" + gNewsList.length.toString());
    gNewsList.sort((firstNews, secondNews) {
      if (firstNews.mId > secondNews.mId) {
        return 1;
      } else {
        return -1;
      }
    });

    return Scaffold(
        body: fBuildSilverPage("assets/images/appbars/news.png", fBuildBody()));
  }

  Widget fBuildBody() {
    List<Widget> items = [
      fPrintHeadingText(NewsPage.Title),
      Padding(padding: EdgeInsets.only(top: 10)),
    ];
    items.addAll(gNewsList.map((item) => _NewsItem(item)));
    return Container(
      padding: EdgeInsets.all(10),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: items),
    );
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
              Padding(padding: EdgeInsets.only(left: 10),),
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

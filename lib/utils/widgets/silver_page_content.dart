import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/app_bar.dart';

CustomScrollView fBuildSilverPage(String appBarImagePath, Widget body) {
  return CustomScrollView(
    slivers: <Widget>[
      fBuildSilverAppBar(appBarImagePath),
      SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return body;
        },
        childCount: 1),
      )
    ],
  );
}
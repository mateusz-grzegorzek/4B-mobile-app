import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/app_bar.dart';
import 'package:business_mobile_app/utils/widgets/menu_bar.dart';

Scaffold fBuildSilverPage(String appBarImagePath, Widget body,
    [MenuBar drawer]) {

  CustomScrollView fBuildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        fBuildSilverAppBar(appBarImagePath),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return body;
          }, childCount: 1),
        )
      ],
    );
  }

  if (drawer != null) {
    return Scaffold(
      drawer: drawer,
      body: fBuildBody(),
    );
  }
  else {
    return Scaffold(
      body: fBuildBody(),
    );
  }
}

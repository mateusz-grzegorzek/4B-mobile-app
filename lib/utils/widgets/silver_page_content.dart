import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/widgets/app_bar.dart';
import 'package:business_mobile_app/utils/widgets/menu_bar.dart';

StatefulWidget fBuildSilverPage(String appBarImagePath, Widget body,
    [MenuBar drawer, bool withPopScope=true]) {
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

  Scaffold fBuildPage() {
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
  
  if (withPopScope) {
    return fBuildWillPopScope(fBuildPage());
  }
  else {
    return fBuildPage();
  }
}

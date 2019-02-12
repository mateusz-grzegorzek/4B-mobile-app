import 'package:flutter/material.dart';
import '../fonts.dart';

AppBar fGetDefaultAppBar([String title = ""]) {
  return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: gBrownColor,
      title: Text(title, style: TextStyle(fontSize: 17, color: Colors.black)));
}

PreferredSize fBuildAppBar(String aPathToImage) {
  return PreferredSize(
      preferredSize: Size.fromHeight(150.0),
      child: Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage(aPathToImage),
          fit: BoxFit.cover,
        )),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ));
}

SliverAppBar fBuildSilverAppBar(String aPathToImage) {
  return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 200.0,
      floating: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(aPathToImage,
              fit: BoxFit.cover)));
}

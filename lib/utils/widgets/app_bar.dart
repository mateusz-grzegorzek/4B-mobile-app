import 'dart:math';
import 'package:flutter/material.dart';
import '../fonts.dart';

AppBar fGetDefaultAppBar([String title = ""]) {
  return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: gBrownColor,
      title: Text(title,
          style: TextStyle(
              fontSize: 17, color: Colors.black, fontFamily: 'Oswald')));
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

Builder fBuildSilverAppBar(String aPathToImage, [bool withPopScope = true]) {
  return Builder(builder: (context) {
    print(MediaQuery.of(context).size.height * 0.3);
    return SliverAppBar(
        leading: Container(
          color: gBrownColor,
          child: IconButton(
              icon: Icon(
                withPopScope ? Icons.menu : Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
              onPressed: () {
                if (withPopScope) {
                  Scaffold.of(context).openDrawer();
                } else {
                  Navigator.pop(context);
                }
              }),
        ),
        backgroundColor: Colors.transparent,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
          aPathToImage,
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        )));
  });
}

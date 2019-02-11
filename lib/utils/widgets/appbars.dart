import 'package:flutter/material.dart';
import '../fonts.dart';

AppBar fGetDefaultAppBar([String title = ""]) {
  return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: gBrownColor,
      title: Text(title, style: TextStyle(color: Colors.black)));
}

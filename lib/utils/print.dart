import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const TextStyle gSuperscriptTextStyle =
    TextStyle(fontSize: 11.0, color: Colors.black, fontWeight: FontWeight.bold);

const TextStyle gNormalTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

const TextStyle gBoldTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

const TextStyle gMenuItemTextStyle =
    TextStyle(fontSize: 20.0, color: gBrownColor, fontWeight: FontWeight.bold);

const TextStyle gHeadingTextStyle =
    TextStyle(fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold);

Text fPrintSuperscriptText(String aText,
    [TextStyle aTextStyle = gSuperscriptTextStyle,
    TextAlign aTextAlign = TextAlign.left]) {
  return Text(aText, style: aTextStyle, textAlign: aTextAlign);
}

Text fPrintText(String aText,
    [TextStyle aTextStyle = gNormalTextStyle,
    TextAlign aTextAlign = TextAlign.left]) {
  return Text(aText, style: aTextStyle, textAlign: aTextAlign);
}

Text fPrintBoldText(String aText) {
  return fPrintText(aText, gBoldTextStyle);
}

Text fPrintJustifiedText(String aText) {
  return fPrintText(aText, gNormalTextStyle, TextAlign.justify);
}

Text fPrintBoldJustifiedText(String aText) {
  return fPrintText(aText, gBoldTextStyle, TextAlign.justify);
}

Text fPrintHeadingText(String aText) {
  return fPrintText(aText, gHeadingTextStyle);
}

Image fPrintOkSign() {
  return Image(
    image: AssetImage("assets/images/about_ok_sign.png"),
    width: 25,
  );
}

Column fPrintOptionRow(String aOption) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          fPrintOkSign(),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(child: fPrintText(aOption))
        ],
      ),
      Padding(padding: EdgeInsets.all(5)),
    ],
  );
}

Widget fBuildNullWidget() {
  return Container(width: 0, height: 0);
}

Image fBuildImage(String aPath, double aWidth, [double aHeight]) {
  aHeight = (aHeight != null) ? aHeight : aWidth;
  return Image(
    width: aWidth,
    height: aHeight,
    image: AssetImage(aPath),
  );
}

Widget fBuildImageButton(
    String aImagePath, double aImageSize, String aUrlPath) {
  return IconButton(
    iconSize: aImageSize,
    icon: Image.asset(
      aImagePath,
    ),
    onPressed: () => launch(aUrlPath),
  );
}

Widget fBuildExpansionTile(
    dynamic aKey, String aTitle, List<Widget> aChildrens) {
  return AppExpansionTile(
      key: aKey, title: fPrintBoldText(aTitle), children: aChildrens);
}

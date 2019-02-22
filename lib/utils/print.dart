import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const gSuperscriptTextStyle =
    TextStyle(fontSize: 11.0, color: Colors.black, fontWeight: FontWeight.bold);

const gNormalTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

const gBoldTextStyle =
    TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

const gBoldOswaldTextStyle = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Oswald');

const gMenuItemTextStyle = TextStyle(
    fontSize: 20.0,
    color: gBrownColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Oswald');

const gHeadingTextStyle = TextStyle(
    fontSize: 33.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Oswald');

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

Widget fBuildButton(VoidCallback aCallback, String aText) {
  return GestureDetector(
    onTap: aCallback,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: gBrownColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            aText,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Oswald'),
          ),
          Padding(padding: EdgeInsets.only(left: 20)),
          Image(
            image: AssetImage("assets/images/login_arrow.png"),
            width: 20,
          ),
        ],
      ),
    ),
  );
}

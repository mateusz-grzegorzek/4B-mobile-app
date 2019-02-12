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

Column fPrintOptionRow(String option) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          fPrintOkSign(),
          Padding(padding: EdgeInsets.all(5)),
          Expanded(child: fPrintText(option))
        ],
      ),
      Padding(padding: EdgeInsets.all(5)),
    ],
  );
}

Widget fBuildNullWidget() {
  return Container(width: 0, height: 0);
}

Widget fBuildImageWidget(String path, double width, [double height]) {
  height = (height != null) ? height : width;
  return Container(
    width: width,
    height: height,
    child: Image.asset(path),
  );
}

Widget fBuildImageButton(String imagePath, double imageSize, String urlPath) {
  return IconButton(
    iconSize: imageSize,
    icon: Image.asset(
      imagePath,
    ),
    onPressed: () => launch(urlPath),
  );
}

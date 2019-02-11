import 'package:flutter/material.dart';

TextStyle g4BussinessNormalTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black,
);

Text fPrintNormalText(String text) {
  return Text(text, style: g4BussinessNormalTextStyle);
}

Text fPrintJustifiedText(String text) {
  return Text(text,
      textAlign: TextAlign.justify, style: g4BussinessNormalTextStyle);
}

Text fPrintBoldText(String text, [Color color=Colors.black]) {
  return Text(text,
      style: TextStyle(
          color: color, fontSize: 20.0, fontWeight: FontWeight.bold));
}

Text fPrintHeadingText(String text, [Color color=Colors.black]) {
  return Text(text,
      style: TextStyle(
          color: color, fontSize: 33.0, fontWeight: FontWeight.bold));
}

Row fPrintOptionRow(String option) {
  return Row(
    children: <Widget>[
      Image(
        image: AssetImage("assets/images/about_ok_sign.png"),
        width: 25,
      ),
      Padding(padding: EdgeInsets.all(5)),
      Expanded(child: fPrintNormalText(option))
    ],
  );
}

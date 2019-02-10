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

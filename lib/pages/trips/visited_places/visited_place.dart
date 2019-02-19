import 'package:flutter/material.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/fonts.dart';

class VisitedPlace extends StatelessWidget {
  final String mTitle;
  final String mBody;
  final String mImageAssetPath;

  const VisitedPlace(this.mTitle, this.mBody, this.mImageAssetPath);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage(mImageAssetPath),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                fPrintText(
                    mTitle,
                    TextStyle(
                        color: gBrownColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald')),
                fPrintJustifiedText(mBody)
              ]),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
      ],
    );
  }
}

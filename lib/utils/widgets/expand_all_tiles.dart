import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';

class ExpandAllTilesWidget extends StatefulWidget {
  ExpandAllTilesWidget(this.mExpansionTileList);

  final List<GlobalKey<AppExpansionTileState>> mExpansionTileList;

  @override
  _ExpandAllTilesWidgetState createState() => _ExpandAllTilesWidgetState();
}

class _ExpandAllTilesWidgetState extends State<ExpandAllTilesWidget> {
  bool mExpanded = false;
  var mText = "Rozwiń wszystkie informacje";

  @override
  Widget build(BuildContext aContext) {
    return GestureDetector(
      onTap: () {
        widget.mExpansionTileList.forEach((expansionTile) {
          if (mExpanded) {
            expansionTile.currentState.collapse();
          } else {
            expansionTile.currentState.expand();
          }
        });
        if (mExpanded) {
          mExpanded = false;
          setState(() {
            mText = "Rozwiń wszystkie informacje";
          });
        } else {
          mExpanded = true;
          setState(() {
            mText = "Zwiń wszystkie informacje";
          });
        }
      },
      child: Container(
          height: 52,
          decoration: BoxDecoration(
            border: Border.all(
              color: gBrownColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 10)),
            fPrintBoldText(mText),
            Padding(padding: EdgeInsets.only(left: 5)),
            Spacer(),
            Image(
                image: AssetImage("assets/images/expand_arrows.png"),
                height: 20),
            Padding(padding: EdgeInsets.only(left: 10)),
          ])),
    );
  }
}

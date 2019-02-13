import 'package:business_mobile_app/pages/trips/important_info/important_info.dart';
import 'package:business_mobile_app/pages/trips/schedule/schedule_page.dart';
import 'package:business_mobile_app/utils/expansion_tile.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/widgets/app_bar.dart';

class ImportantInfoPage extends StatefulWidget {
  static const String Id = "ImporatantInfoPage";
  static const String Title = "Ważne informacje";
  @override
  _ImportantInfoPageState createState() => _ImportantInfoPageState();
}

class _ImportantInfoPageState extends State<ImportantInfoPage> {
  var mExpansionTileList = List<GlobalKey<AppExpansionTileState>>();

  Row fBuildInsuranceRow(String aText) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      fPrintOkSign(),
      Padding(padding: EdgeInsets.only(left: 15)),
      Expanded(child: fPrintText(aText))
    ]);
  }

  Row fBuildShoppingRow(String aText, String aUrl) {
    return Row(
      children: <Widget>[
        fPrintOkSign(),
        Padding(padding: EdgeInsets.only(left: 15)),
        GestureDetector(
            onTap: () => launch(aUrl),
            child: Text(
              aText,
              style: TextStyle(
                  color: gBrownColor,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            )),
      ],
    );
  }

  Row fBuildFreeTimeRow(String aTitle, String aBody) {
    return Row(
      children: <Widget>[
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: aTitle,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: aBody),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _handleTap(BuildContext aContext, String aUrl) {
    launch(aUrl);
  }

  Column fBuildInfoTiles() {
    mExpansionTileList.clear();

    // Air Connection
    mExpansionTileList.add(GlobalKey());
    var airConnectionTile = fBuildExpansionTile(
        mExpansionTileList[0], gAirConnectionTitle, <Widget>[
      fPrintText(gAirConnectionBody),
    ]);

    // Travel Luggage
    mExpansionTileList.add(GlobalKey());
    var travelLuggageTileRow1 = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTravelLuggageBody1,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTravelLuggageBody2),
        ],
      ),
    );

    var travelLuggageTileRow2 = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTravelLuggageBody3,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTravelLuggageBody4),
        ],
      ),
    );

    var travelLuggageTile = fBuildExpansionTile(
        mExpansionTileList[1], gTravelLuggageTitle, <Widget>[
      Column(
        children: <Widget>[
          Row(children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.only(left: 15)),
            Expanded(child: travelLuggageTileRow1)
          ]),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(children: <Widget>[
            fPrintOkSign(),
            Padding(padding: EdgeInsets.only(left: 15)),
            Expanded(child: travelLuggageTileRow2)
          ]),
        ],
      ),
    ]);

    // Insurance
    mExpansionTileList.add(GlobalKey());
    var insuranceTile =
        fBuildExpansionTile(mExpansionTileList[2], gInsuranceTitle, <Widget>[
      Column(children: <Widget>[
        fPrintText(gInsuranceBody1),
        Padding(padding: EdgeInsets.only(top: 10)),
        fPrintBoldText(gInsuranceBody2),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody3),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody4),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody5),
        Padding(padding: EdgeInsets.only(top: 10)),
        fBuildInsuranceRow(gInsuranceBody6)
      ])
    ]);

    // Safety
    mExpansionTileList.add(GlobalKey());
    var safetyTile = fBuildExpansionTile(
        mExpansionTileList[3], gSafetyTitle, <Widget>[fPrintText(gSafetyBody)]);

    // Phones
    mExpansionTileList.add(GlobalKey());
    var phonesTile = fBuildExpansionTile(
        mExpansionTileList[4], gPhonesTitle, <Widget>[fPrintText(gPhonesBody)]);

    // Rooms
    mExpansionTileList.add(GlobalKey());

    var roomsTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gRoomsBody1, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gRoomsBody2),
        ],
      ),
    );

    var roomsTile =
        fBuildExpansionTile(mExpansionTileList[5], gRoomsTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: roomsTileRow),
        ],
      )
    ]);

    // Temperatures
    mExpansionTileList.add(GlobalKey());

    var tempTile =
        fBuildExpansionTile(mExpansionTileList[6], gTempTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: fPrintText(gTempBody)),
        ],
      )
    ]);

    // Money
    mExpansionTileList.add(GlobalKey());

    var moneyTile =
        fBuildExpansionTile(mExpansionTileList[7], gMoneyTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: fPrintText(gMoneyBody)),
        ],
      )
    ]);

    // Time
    mExpansionTileList.add(GlobalKey());

    var timeTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: gTimeBody1, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gTimeBody2),
        ],
      ),
    );

    var timeTile =
        fBuildExpansionTile(mExpansionTileList[8], gTimeTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: timeTileRow),
        ],
      )
    ]);

    // Voltage
    mExpansionTileList.add(GlobalKey());

    var voltageTileRow = RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: gVoltageBody1),
          TextSpan(
              text: gVoltageBody2,
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: gVoltageBody3),
        ],
      ),
    );

    var voltageTile =
        fBuildExpansionTile(mExpansionTileList[9], gVoltageTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: voltageTileRow),
        ],
      )
    ]);

    // Outfit
    mExpansionTileList.add(GlobalKey());

    var outfitTile =
        fBuildExpansionTile(mExpansionTileList[10], gOutfitTitle, <Widget>[
      Row(
        children: <Widget>[
          Expanded(child: fPrintText(gOutfitBody)),
        ],
      )
    ]);

    // Shopping
    mExpansionTileList.add(GlobalKey());

    var shoppingTile =
        fBuildExpansionTile(mExpansionTileList[11], gShoppingTitle, <Widget>[
      Column(
        children: <Widget>[
          fPrintText(gShoppingBody1),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody2, gShoppingBody2Url),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody3, gShoppingBody3Url),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildShoppingRow(gShoppingBody4, gShoppingBody4Url),
        ],
      )
    ]);

    // FreeTime
    mExpansionTileList.add(GlobalKey());

    var freeTimeTile =
        fBuildExpansionTile(mExpansionTileList[12], gFreeTimeTitle, <Widget>[
      Column(
        children: <Widget>[
          fBuildFreeTimeRow(gFreeTimeBody1, gFreeTimeBody2),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody3, gFreeTimeBody4),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody5, gFreeTimeBody6),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody7, gFreeTimeBody8),
          Padding(padding: EdgeInsets.only(top: 10)),
          fBuildFreeTimeRow(gFreeTimeBody9, gFreeTimeBody10),
          Padding(padding: EdgeInsets.only(top: 10)),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: gFreeTimeBody11,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launch(gFreeTimeBodyUrl),
                  text: gFreeTimeBodyUrl,
                  style: TextStyle(
                      color: gBrownColor,
                      fontSize: 20,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      )
    ]);

    return Column(children: [
      airConnectionTile,
      travelLuggageTile,
      insuranceTile,
      safetyTile,
      phonesTile,
      roomsTile,
      tempTile,
      moneyTile,
      timeTile,
      voltageTile,
      outfitTile,
      shoppingTile,
      freeTimeTile
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          fBuildSilverAppBar("assets/images/imp_info_top_image.png"),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    fPrintHeadingText(" Ważne informacje"),
                    Padding(padding: EdgeInsets.all(5)),
                    fBuildExpandAllTiles(mExpansionTileList),
                    Padding(padding: EdgeInsets.all(5)),
                    fBuildInfoTiles()
                  ],
                ),
              );
            }, childCount: 1),
          )
        ],
      ),
    );
  }
}

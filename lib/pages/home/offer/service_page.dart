import 'package:business_mobile_app/utils/fonts.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:business_mobile_app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceInfo {
  final String mPathToIcon;
  final String mHeadingText;
  final String mText1;
  final bool mIsText1Bold;
  final String mText2;
  final bool mIsText2Bold;
  final List<String> mOptions;
  final String mMoreInfoUrlLink;
  final String mPathToTopImage;
  final String mPathToMiddleImage;

  ServiceInfo(
      this.mPathToIcon,
      this.mHeadingText,
      this.mText1,
      this.mIsText1Bold,
      this.mText2,
      this.mIsText2Bold,
      this.mOptions,
      this.mMoreInfoUrlLink,
      this.mPathToTopImage,
      this.mPathToMiddleImage);
}

class ServicePage extends StatefulWidget {
  final ServiceInfo mServiceInfo;

  ServicePage(this.mServiceInfo);

  @override
  _FootballPageState createState() => _FootballPageState(mServiceInfo);
}

class _FootballPageState extends State<ServicePage> {
  ServiceInfo mServiceInfo;
  String mMoreInfoText = "Więcej informacji na stronie internetowej: ";

  _FootballPageState(this.mServiceInfo);

  Widget fBuildWebPageButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: gBrownColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () => launch(mServiceInfo.mMoreInfoUrlLink),
              child: Text(
                'Przejdź do strony internetowej',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
          Image(
            image: AssetImage("assets/images/login_arrow.png"),
            width: 20,
          ),
        ],
      ),
    );
  }

  Column fBuildOptions() {
    return Column(
        children:
            List<Widget>.generate(mServiceInfo.mOptions.length, (int index) {
      return fPrintOptionRow(mServiceInfo.mOptions[index].toString());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: fBuildAppBar(mServiceInfo.mPathToTopImage),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                children: <Widget>[
                  fPrintHeadingText(mServiceInfo.mHeadingText),
                  Padding(padding: EdgeInsets.all(5)),
                  (mServiceInfo.mIsText1Bold)
                      ? fPrintBoldText(mServiceInfo.mText1)
                      : fPrintJustifiedText(mServiceInfo.mText1),
                  (mServiceInfo.mPathToMiddleImage != null)
                      ? Image(
                          image: AssetImage(mServiceInfo.mPathToMiddleImage),
                        )
                      : null,
                  Padding(padding: EdgeInsets.all(5)),
                  (mServiceInfo.mIsText2Bold)
                      ? fPrintBoldText(mServiceInfo.mText2)
                      : fPrintText(mServiceInfo.mText2),
                  Padding(padding: EdgeInsets.all(5)),
                  fBuildOptions(),
                  fPrintBoldText(mMoreInfoText),
                  Padding(padding: EdgeInsets.all(5)),
                  fBuildWebPageButton()
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:business_mobile_app/utils/widgets/silver_page_content.dart';
import 'package:business_mobile_app/utils/print.dart';
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
  _ServicePageState createState() => _ServicePageState(mServiceInfo);
}

class _ServicePageState extends State<ServicePage> {
  ServiceInfo mServiceInfo;
  String mMoreInfoText = "Więcej informacji na stronie internetowej: ";

  _ServicePageState(this.mServiceInfo);

  Column fBuildOptions() {
    return Column(
        children:
            List<Widget>.generate(mServiceInfo.mOptions.length, (int index) {
      return fPrintOptionRow(mServiceInfo.mOptions[index].toString());
    }));
  }

  Widget fBuildTop() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          fPrintHeadingText(mServiceInfo.mHeadingText),
          Padding(padding: EdgeInsets.all(5)),
          (mServiceInfo.mIsText1Bold)
              ? fPrintBoldJustifiedText(mServiceInfo.mText1)
              : fPrintJustifiedText(mServiceInfo.mText1),
          Padding(padding: EdgeInsets.all(5)),
        ],
      ),
    );
  }

  Widget fBuildMiddleImage() {
    return (mServiceInfo.mPathToMiddleImage != null)
        ? Column(
            children: <Widget>[
              Image(
                image: AssetImage(mServiceInfo.mPathToMiddleImage),
              ),
              Padding(padding: EdgeInsets.all(5)),
            ],
          )
        : fBuildNullWidget();
  }

  Widget fBuildBottom() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (mServiceInfo.mIsText2Bold)
                  ? fPrintBoldText(mServiceInfo.mText2)
                  : fPrintJustifiedText(mServiceInfo.mText2),
              Padding(padding: EdgeInsets.all(5)),
              (mServiceInfo.mOptions != null)
                  ? fBuildOptions()
                  : fBuildNullWidget(),
              fPrintBoldText(mMoreInfoText),
              Padding(padding: EdgeInsets.all(5)),
              fBuildButton(() => launch(mServiceInfo.mMoreInfoUrlLink),
                  "Przejdź do strony internetowej"),
              Padding(padding: EdgeInsets.only(top: 10))
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return fBuildSilverPage(mServiceInfo.mPathToTopImage, fBuildBody());
  }

  Widget fBuildBody() {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[fBuildTop(), fBuildMiddleImage(), fBuildBottom()],
        ),
      ),
    );
  }
}

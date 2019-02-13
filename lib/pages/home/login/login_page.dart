import 'package:business_mobile_app/pages/home/home_page.dart';
import 'package:business_mobile_app/utils/print.dart';
import 'package:flutter/material.dart';

import '../../trips/trips_page.dart';

import '../../../utils/shared_preferences.dart';
import '../../../utils/widgets/app_bar.dart';

class LoginPage extends StatefulWidget {
  static const String Id = "LoginPage";
  static const String Title = "Zaloguj się";
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mUserNameTextEditingController =
      TextEditingController();
  TextEditingController mPasswordTextEditingController =
      TextEditingController();

  Widget mWrongCredentialsWindow = fBuildNullWidget();

  void fLogin() async {
    print("LoginPage::fLogin");
    String userName = mUserNameTextEditingController.text;
    String password = mPasswordTextEditingController.text;
    if (fIsTripLoginDataCorrect(userName, password)) {
      gPrefs.setString("login_user_name", userName);
      gPrefs.setString("login_password", password);
      Navigator.pop(context);
      Navigator.of(context).pushNamed(TripsPage.Id);
    } else {
      mWrongCredentialsWindow = fBuildWrongCredentialsWindow();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    mUserNameTextEditingController.text =
        gPrefs.getString("login_user_name") ?? "";
    mPasswordTextEditingController.text =
        gPrefs.getString("login_password") ?? "";
  }

  Widget fBuildTextField(TextEditingController aController, String aHintText,
      {aObscureText = false}) {
    return Container(
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: TextField(
              controller: aController,
              obscureText: aObscureText,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: aHintText),
            ),
          ),
        ));
  }

  Widget fBuildWrongCredentialsWindow() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20)),
        Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.red,
          ),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: fPrintBoldText("Wprowadzono błędną nazwę lub hasło.")),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(LoginPage.Title),
        drawer: HomePage.drawer,
        body: new Container(
            padding: EdgeInsets.all(25.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                fPrintText("Nazwa:", gMenuItemTextStyle),
                Padding(padding: EdgeInsets.only(top: 5)),
                fBuildTextField(
                    mUserNameTextEditingController, 'Proszę, wprowadź nazwę'),
                Padding(padding: EdgeInsets.only(top: 10)),
                fPrintText("Hasło:", gMenuItemTextStyle),
                Padding(padding: EdgeInsets.only(top: 5)),
                fBuildTextField(
                    mPasswordTextEditingController, 'Proszę, wprowadź hasło',
                    aObscureText: true),
                mWrongCredentialsWindow,
                Padding(padding: EdgeInsets.only(top: 20)),
                fBuildButton(() => fLogin(), 'Zaloguj się')
              ],
            )));
  }
}

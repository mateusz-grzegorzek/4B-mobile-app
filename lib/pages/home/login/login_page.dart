import 'package:business_mobile_app/pages/trips/trip_info.dart';
import 'package:business_mobile_app/utils/firebase_data.dart';
import 'package:business_mobile_app/utils/fonts.dart';
import 'package:flutter/material.dart';

import '../../trips/trips_page.dart';

import '../../../utils/shared_preferences.dart';
import '../../../utils/alerts.dart';
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

  void fLogin() async {
    print("LoginPage::fLogin");
    String userName = mUserNameTextEditingController.text;
    String password = mPasswordTextEditingController.text;
    if (userName.length > 0 && password.length > 0) {
      if (fIsTripLoginDataCorrect(userName, password)) {
        gPrefs.setString("login_user_name", userName);
        gPrefs.setString("login_password", password);
        await fShowAlert(context, "Sukces!", "Zalogowano pomyślnie!");
        Navigator.pop(context);
        Navigator.of(context).pushNamed(TripsPage.Id);
      } else {
        await fShowAlert(
            context, "Błąd!", "Niepoprawna nazwa użytkownia lub hasło!");
      }
    } else {
      await fShowAlert(
          context, "Błąd!", "Proszę podaj nazwę użytkownika oraz hasło!");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
        appBar: fGetDefaultAppBar(LoginPage.Title),
        body: new Container(
            padding: EdgeInsets.all(25.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Nazwa:",
                  style: TextStyle(
                      color: gBrownColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: TextField(
                          controller: mUserNameTextEditingController,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Proszę, wprowadź nazwę'),
                        ),
                      ),
                    )),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Hasło:",
                  style: TextStyle(
                      color: gBrownColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: TextField(
                          controller: mPasswordTextEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Proszę, wprowadź hasło'),
                        ),
                      ),
                    )),
                Padding(padding: EdgeInsets.all(20.0)),
                GestureDetector(
                  onTap: () {
                    fLogin();
                  },
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
                          'Zaloguj się',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(20.0)),
                        Image(
                          image: AssetImage("assets/images/login_arrow.png"),
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}

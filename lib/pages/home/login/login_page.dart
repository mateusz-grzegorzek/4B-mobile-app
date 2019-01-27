import 'package:flutter/material.dart';
import '../../home/home_page.dart';
import '../../trips/trips_page.dart';
import '../../../utils/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  static const String Id = "LoginPage";
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
        gHomePage.fOnLoginSuccess();
      } else {
        HomePage.fShowAlert(
            context, "Błąd!", "Niepoprawna nazwa użytkownia lub hasło!");
      }
    } else {
      HomePage.fShowAlert(
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
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: new ListTile(
                leading: const Icon(Icons.email),
                title: new TextField(
                  controller: mUserNameTextEditingController,
                  decoration: new InputDecoration(
                    hintText: "Nazwa użytkownika",
                  ),
                ),
              ),
            ),
            new SizedBox(
              width: 250.0,
              height: 60.0,
              child: new ListTile(
                  leading: const Icon(Icons.security),
                  title: new TextField(
                    controller: mPasswordTextEditingController,
                    obscureText: true,
                    decoration: new InputDecoration(
                      hintText: "Hasło",
                    ),
                  )),
            ),
            new Padding(padding: new EdgeInsets.all(10.0)),
            new RaisedButton(child: new Text("Zaloguj się"), onPressed: fLogin),
          ],
        )));
  }
}

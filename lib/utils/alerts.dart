import 'package:flutter/material.dart';

Future<void> fShowAlert(BuildContext context, String aTitle, String aBody) async {
  print("fShowAlert::title=$aTitle,body=$aBody");
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(aTitle),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text(aBody)],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

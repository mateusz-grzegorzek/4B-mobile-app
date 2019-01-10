import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

Future<bool> fIsConnectedToInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {}
  return false;
}

void fLaunchURL(String aUrl) async {
  if (await canLaunch(aUrl)) {
    await launch(aUrl);
  } else {
    throw 'Could not launch $aUrl';
  }
}

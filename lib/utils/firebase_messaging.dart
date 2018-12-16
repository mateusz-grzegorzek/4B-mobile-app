import 'package:firebase_messaging/firebase_messaging.dart';
//import 'notification.dart';

final FirebaseMessaging gFirebaseMessaging = new FirebaseMessaging();

void fInitFirebaseMessaging() {
  gFirebaseMessaging.requestNotificationPermissions();
  gFirebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) {
      print("onMessage: $message");
      if (message['title'] != null && message['body'] != null) {
        /* ToDo: Write implementation for iOS */
        //fShowNotification(message['title'], message['body']);
      }
    },
    onLaunch: (Map<String, dynamic> message) {
      print("onLaunch: $message");
    },
    onResume: (Map<String, dynamic> message) {
      print("onResume: $message");
    },
  );
}

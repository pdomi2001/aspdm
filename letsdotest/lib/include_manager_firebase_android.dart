import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:letsdotest/models/project.dart';
import 'package:letsdotest/routes.dart';

const AndroidNotificationChannel mainChannel = AndroidNotificationChannel(
    'main_notification_channel',
    'Notifiche di lets do test',
    'Notifiche degli eventi di letsdotest',
    importance: Importance.max
);


Future _backgroundMessage(RemoteMessage message) {
  debugPrint('On background message ' + message.toString());
}

BuildContext _extcontext;
Project _project;

void setContextForNotifications(BuildContext extcontext) {
  _extcontext = extcontext;
}

void setProjectForNotifications(Project project) {
  _project = project;
  debugPrint("Setting project for Notifications");
//  debugPrint(project.toString());
}

Future Gestione_Local_Notifications() async {
  if (Platform.isAndroid) {
    final local = FlutterLocalNotificationsPlugin();
    final InitializationSettings initializationSettingsAndroid =
      InitializationSettings(
        android: AndroidInitializationSettings(
            '@mipmap/ic_launcher'
        )
    );
    await local.initialize(initializationSettingsAndroid,
        onSelectNotification: selectNotification);
    // await local.initialize();
    final android = local.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await android.createNotificationChannel(
        mainChannel); // creo il canale delle notifiche

  }
}

Future selectNotification(String payload) async {
  debugPrint("selectNotification:" + payload);
  // some action...
}

Future Gestione_Firebase() async {

  debugPrint("Gestione Firebase con Android");
  //_extcontext = context;
  debugPrint(_extcontext.toString());
  // Gestione notifiche di Firebase
  await Firebase.initializeApp();
  debugPrint("Firebase inizializzato");

  final firebase = FirebaseMessaging.instance;
  await firebase.requestPermission();

  final token = await firebase.getToken();
  debugPrint("Il token è " + token);

  // Attiva quando il messaggio arriva con l'applicazione in background ma attiva
  FirebaseMessaging.onMessage.listen((event) {
    debugPrint("Firebase onMessage");
    debugPrint(event.toString());
    // debugPrint(_extcontext.toString());
    debugPrint(ModalRoute.of(_extcontext).settings.name.toString());
    // debugPrint(_project.toString());
    //if (ModalRoute.of(_extcontext).settings.name == '/waitfortestpage')
    {
      _project.setCurrentTestIdx(3);
      return Navigator.of(_extcontext)?.pushNamed(
          RouteGenerator.executeTestPage);
      // Navigator.of(_extcontext).pushNamed(RouteGenerator.aboutPage);
    }
  });

  // applicazione in standby
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    debugPrint("Firebase onMessageOpenedApp");
    debugPrint(event.toString());

    _project.setCurrentTestIdx(3);
    return Navigator.of(_extcontext)?.pushNamed(
        RouteGenerator.executeTestPage);

  });

  // applicazione chiusa.
  FirebaseMessaging.onBackgroundMessage( _backgroundMessage);


}

Future ShowLocalNotification_() async {
  final local = FlutterLocalNotificationsPlugin();
  local.show(
      123,
      'Titolo notifica',
      'Corspo del testo da mostrare nella notifica',
      NotificationDetails(
          android: AndroidNotificationDetails(
              mainChannel.id,
              mainChannel.name,
              mainChannel.description
          )
      )
  );
}

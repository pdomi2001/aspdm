import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform; // estraggo solo Platform dal pacchetto

const AndroidNotificationChannel mainChannel = AndroidNotificationChannel(
    'main_notification_channel',
    'Notifiche di lets do test',
    'Notifiche degli eventi di letsdotest',
  importance: Importance.max
);

Future _backgroundMessage(RemoteMessage message) {
  debugPrint('On background message ' + message.toString());
}

class NotificationManager {
  NotificationManager._();

  static final NotificationManager _singleton = NotificationManager._();

  factory NotificationManager() => _singleton;

  bool _initialize = false;

  Future init() async {
    if (_initialize) {
      return;
    }

    final local = FlutterLocalNotificationsPlugin();
    await local.initialize(InitializationSettings(
        android: AndroidInitializationSettings(
            '@mipmap/ic_launcher'
        )
    ));
    if (Platform.isAndroid) {
      final android = local.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      await android.createNotificationChannel(
          mainChannel); // creo il canale delle notifiche
    }

    debugPrint("Gestione Firebase");
    // Gestione notifiche di Firebase
    await Firebase.initializeApp();
    debugPrint("Firebase inizializzato");

    final firebase = FirebaseMessaging.instance;
    await firebase.requestPermission();

    final token = await firebase.getToken();
    debugPrint("Il token è " + token);

    //
    FirebaseMessaging.onMessage.listen((event) {
      debugPrint("Firebase onMessage ${event.toString()}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("Firebase onMessageOpenedApp ${event.toString()}");
    });

    FirebaseMessaging.onBackgroundMessage( _backgroundMessage);


    _initialize = true;
  }

  Future ShowLocalNotification() async {
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

}
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

    // Gestione notifiche di Firebase
    Firebase.initializeApp();
    final firebase = FirebaseMessaging.instance;
    await firebase.requestPermission();

    final token = await firebase.getToken();
    debugPrint("Il token è " + token);



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
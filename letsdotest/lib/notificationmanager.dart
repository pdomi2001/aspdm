import 'include_manager_stub.dart'
  if (dart.library.js) 'include_manager_firebase_web.dart'
  if (dart.library.io) 'include_manager_firebase_android.dart';
// import 'package:firebase_messaging/firebase_messaging.dart'
//  if (dart.library.js) "include_manager_firebase_web.dart";
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:io' show Platform; // estraggo solo Platform dal pacchetto



class NotificationManager {
  NotificationManager._();

  static final NotificationManager _singleton = NotificationManager._();

  factory NotificationManager() => _singleton;

  bool _initialize = false;

  Future init() async {
    if (_initialize) {
      return;
    }

    Gestione_Local_Notifications();

    Gestione_Firebase();

    _initialize = true;
  }

  Future ShowLocalNotification() async {
    await ShowLocalNotification_();
  }
}

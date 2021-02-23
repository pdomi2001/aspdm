
import 'package:flutter/material.dart';

import 'models/project.dart';

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
  debugPrint("Local notifications con web");

}

Future Gestione_Firebase() {
  debugPrint("Firebase con web");
}

Future ShowLocalNotification_() async {
  debugPrint("Show LocalNotification con web");
}
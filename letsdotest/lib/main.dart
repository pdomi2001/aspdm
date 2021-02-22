import 'package:flutter/material.dart';
import 'package:letsdotest/notificationmanager.dart';

import 'package:letsdotest/routes.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'models/project.dart';

void main() {
  runApp(ProviderApp());
}

class NotificationWidget extends StatefulWidget {
  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    debugPrint("NotificationWidgetState:context = " + _context.toString());
    return MyApp();
  }

  @override
  void initState() {
    initStateAsync();
  }

  Future initStateAsync() async {
    await NotificationManager().init(_context);
  }
}


class ProviderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Project(),
        child: NotificationWidget()

    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteGenerator.homePage,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'LetsDoTests App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

      ),

      home: MyHomePage(title: "Let's do Tests")
    );
  }
}


import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letsdotest/models/prj_import.dart';
import 'package:letsdotest/notificationmanager.dart';
import 'package:letsdotest/routes.dart';
import 'package:provider/provider.dart';

import 'models/project.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.project}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Project project;

  Project get myproject => project;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final Project project;
  //int _counter = 0;

  //_MyHomePageState(this.project);
  /*
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    debugPrint(
        "screen w:${MediaQuery.of(context)?.size.width} h: ${MediaQuery.of(context)?.size.height}");
    NotificationManager().setContext(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Test notifica"),
              onTap: () {
                NotificationManager().ShowLocalNotification();
              }),
          ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About"),
              onTap: () {
                return Navigator.of(context)
                    ?.pushNamed(RouteGenerator.aboutPage);
              }),
          ListTile(
              leading: const Icon(Icons.close),
              title: const Text("Chiudi Applicazione"),
              enabled: kIsWeb ? false : true,
              onTap: () {
                if (kIsWeb) {
                  debugPrint("Web");
                } else {
                  // debugPrint("Operating system: ${Platform.environment.toString()}");
                  if (Platform.isWindows ||
                      Platform.isLinux ||
                      Platform.isMacOS ||
                      Platform.isIOS) {
                    debugPrint("Win/Linux/Macos/IOS");
                    exit(0);
                  } else {
                    if (Platform.isAndroid ||
                        Platform.isFuchsia
                    ) {
                      debugPrint("android/fuchsia");
                      SystemNavigator.pop();
                    }
                  }
                }
                /* ????? */
              }),
        ]),
      ),
      // endDrawer: Drawer(),

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: context.read<Project>().LoadProjectListFromWeb(),
          builder: (context, AsyncSnapshot<ProjectImportList> snapshot) {
            if (snapshot.hasData) {
              NotificationManager().setProject(context.read<Project>());
              return Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("myassets/images/sfondo1.jpg"),
                          fit: MediaQuery.of(context)?.size.width <
                                  MediaQuery.of(context)?.size.height
                              ? BoxFit.fitHeight
                              : BoxFit.fitWidth)),
                  child: Column(
                    // Column is also a layout widget. It takes a list of children and
                    // arranges them vertically. By default, it sizes itself to fit its
                    // children horizontally, and tries to be as tall as its parent.
                    //
                    // Invoke "debug painting" (press "p" in the console, choose the
                    // "Toggle Debug Paint" action from the Flutter Inspector in Android
                    // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                    // to see the wireframe for each widget.
                    //
                    // Column has various properties to control how it sizes itself and
                    // how it positions its children. Here we use mainAxisAlignment to
                    // center the children vertically; the main axis here is the vertical
                    // axis because Columns are vertical (the cross axis would be
                    // horizontal).
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 100,
                        // width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                              ),
                              onPressed: () {
                                return Navigator.of(context)
                                    ?.pushNamed(RouteGenerator.selectTestPage);
                              },
                              child: const Text(
                                  "Seleziona un test da svolgere autonomamente")),
                        ),
                      ),
                      Container(
                        height: 100,
                        //width: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                              onPressed: () {
                                // debugPrint(context.read<Project>().getTestName(0));
                                // debugPrint(context.read<Project>().getElencoProgettiPerDebug());
                                //context.read<Project>().setCurrentTestIdx(0);
                                return Navigator.of(context)?.pushNamed(
                                    RouteGenerator.waitForTestPage);
                                /*
                          return Navigator.of(context)
                              ?.pushNamed(RouteGenerator.selectTestPage);
                           */
                              },
                              child: const Text(
                                  "Entra in modalità test interattivo")),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
       */
    );
  }
}

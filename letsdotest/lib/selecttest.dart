import 'package:flutter/material.dart';
import 'package:letsdotest/routes.dart';
import 'project.dart';
import 'package:provider/provider.dart';

class SelectTest extends StatefulWidget {
  @override
  _SelectTestState createState() => _SelectTestState();
}

class _SelectTestState extends State<SelectTest> {
  // Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.blue,
        child: Container(
          color: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container()),
              Container(
                  alignment: Alignment.center,
                  color: Colors.red,
                  padding: EdgeInsets.all(20),
                  //height: 100,
                  child: Text("Scegliere il test da eseguire")
              ),
              Expanded(
                flex: 10,
                child: Container(
                      alignment: Alignment.center,
                      color: Colors.lightGreen,
                      padding: const EdgeInsets.all(20),
                      child: Consumer<Project>(
                        builder: (context, prj, child) {
                          debugPrint("Consumer");
                          return ListView.builder(
                            itemCount: prj.getNumTests(),
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                  onPressed: () {
                                    return Navigator.of(context)?.pushNamed(RouteGenerator.executeTestPage);
                                  },
                                  child: Text(prj.getTest(index).name));
                            },
                          );
                        },
                  ),
                ),
              ),
              // Text("Ci sono ${context.watch<Project>().getNumTests()}"),
              /*
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Project>(
                  builder: (context, prj, child) {
                    debugPrint("Consumer");
                    return Text("numero di progetti: ${prj.getNumTests()}");
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.watch<Project>().addTest();
                  },
                  child: Text("Cambia nome")),

               */
              Expanded(
                  flex: 1,
                  child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

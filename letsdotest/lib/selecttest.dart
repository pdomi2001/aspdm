import 'package:flutter/material.dart';
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
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    child: Text("testo 1")
                ),
              ),
              Expanded(
                child: Container(
                      alignment: Alignment.center,
                      color: Colors.lightGreen,
                      child: Consumer<Project>(
                        builder: (context, prj, child) {
                          debugPrint("Consumer");
                          return ListView.builder(
                            itemCount: prj.getNumTests(),
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                  onPressed: () {},
                                  child: Text(prj.getTest(index).name));
                            },
                          );
                        },
                  ),
                ),
              ),
              // Text("Ci sono ${context.watch<Project>().getNumTests()}"),
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
                  child: Text("Cambia nome"))
            ],
          ),
        ),
      ),
    );
  }
}

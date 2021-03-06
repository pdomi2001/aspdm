import 'package:flutter/material.dart';
import 'package:letsdotest/routes.dart';
import 'models/project.dart';
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
        color: Colors.black,
        child: Container(
          color: Colors.white24,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Container()),
              Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  //height: 100,
                  child: Text("Scegliere il test da eseguire")),
              Expanded(
                flex: 10,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  padding: const EdgeInsets.all(20),
                  child: Selector<Project, int>(
                    selector: (builContext,  prj) => prj.getNumTests(),

                    builder: (context, numTests, child) {
                      debugPrint("SelectTest: Selector");
                        // Project prj = context.watch<Project>();
                        final project = Provider.of<Project>(context, listen: false);
                        return ListView.builder(
                        itemCount: numTests,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  project.setCurrentTestIdx(index);
                                  return Navigator.of(context)?.pushNamed(
                                      RouteGenerator.executeTestPage);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Tooltip(
                                      message: project.getTest(index).description,
                                      child: Text(project.getTestName(index))),
                                )),
                          );
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
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

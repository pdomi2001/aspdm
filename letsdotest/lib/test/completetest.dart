import 'package:flutter/material.dart';
import 'package:letsdotest/models/prj_import.dart';
import 'package:letsdotest/models/project.dart';
import 'package:letsdotest/test/pagedtest.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class CompleteTest extends StatefulWidget {
  @override
  _CompleteTestState createState() => _CompleteTestState();
}

class _CompleteTestState extends State<CompleteTest> {
  @override
  Widget build(BuildContext context) {
    PagedTest _testPaged = PagedTest();

    return Scaffold(
      // appBar: AppBar(),
      body: FutureBuilder(
          future: context.watch<Project>().LoadProjectFromWeb(),
          builder: (context, AsyncSnapshot<ProjectImport> snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Esecuzione test completo"),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: _testPaged,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint(
                                        "Precedente domanda cliccata ${_testPaged
                                            .getPageController()}");
                                    _testPaged.getPageController().previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear,
                                    );
                                  },
                                  child: Icon(Icons.arrow_back, size: 32)),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                  onPressed: () {
                                    return Navigator.of(context)?.pushNamed(RouteGenerator.resultPage);
                                  },
                                  child: Text(
                                    "Consegna test",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      //backgroundColor: Colors.yellow,
                                        color: Colors.yellow),
                                  ))),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    debugPrint("Prossima domanda cliccata");
                                    _testPaged.getPageController().nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear,

                                    );
                                  },
                                  child: Icon(Icons.arrow_forward, size: 32)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}

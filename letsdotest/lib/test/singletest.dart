import 'package:flutter/material.dart';
import 'package:letsdotest/project.dart';
import 'package:provider/provider.dart';

class SingleTestWidget extends StatefulWidget {
  int livello;

  @override
  _SingleTestWidgetState createState() => _SingleTestWidgetState();
}

class _SingleTestWidgetState extends State<SingleTestWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Project>(
      builder: (context, prj, child) {
        debugPrint(
            "Numero risposte: ${prj.getCurrentTest().contenutoTest.getNumRisposte()}");
        debugPrint("Domanda: ${prj.getCurrentTest().contenutoTest.domanda}");
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ]),
                  // color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${prj.getCurrentTest().contenutoTest.domanda}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                  )),
            ),
            const Divider(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: prj.getCurrentTest().contenutoTest.getNumRisposte(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                          value: prj.getCurrentTestRisposta(index),
                          onChanged: (bool newValue) {
                            prj.setCurrentTestRisposta(index, newValue);
                            // prj.getCurrentTest().SetRisposta(index, newValue);
                            debugPrint(
                                "Changed checkbox ${index} to ${newValue}");
                            // notifyListeners();
                          }),
                      Text(
                          "${prj.getCurrentTest().contenutoTest.getRisposta(index).risposta}"),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

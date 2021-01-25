import 'package:flutter/material.dart';
import 'package:letsdotest/project.dart';
import 'package:letsdotest/test/test_element.dart';
import 'package:provider/provider.dart';

class SingleTest {
  String _name = "";
  TestElement contenutoTest;

  SingleTest(String titolo) {
    _name = titolo;
    contenutoTest = new TestElement("titolo",
        "domanda asdf as df asd fa sd fa sd fa sd f asdfasdfasdf asd afs df a sd f  sdfasd fa s df a sdf asdfa");
    for (int i = 0; i < 40; i++) {
      contenutoTest.AddRisposta("Risposta ${i + 1}", 0);
    }
    contenutoTest.AddRisposta("Risposta ok", 1);
  }

  String get name => _name;

  void set name(String valore) {
    _name = valore;
  }
}

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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.black26,
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
            Expanded(
              child: ListView.builder(
                itemCount: prj.getCurrentTest().contenutoTest.getNumRisposte(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool newValue) {}),
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

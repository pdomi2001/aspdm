import 'package:flutter/material.dart';
import 'package:letsdotest/models/test_element.dart';

class SingleTest {
  String _name = "";

  List<SingleTestPage> _domandeTest = [];

  SingleTest(String titolo) {
    _name = titolo;
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
  }

    void AddDomanda(SingleTestPage testPage) {
    _domandeTest.add(testPage);
  }

  String get name => _name;

  void set name(String valore) {
    _name = valore;
  }

  SingleTestPage getDomanda(int index) => _domandeTest[index];

  int getNumDomande() => _domandeTest.length;

}

class SingleTestPage {
  TestElement _contenutoTest;

  var _risposte = new List.filled(1000, false);


  SingleTestPage() {
    _contenutoTest = new TestElement("titolo",
        "domanda asdf as df asd fa sd fa sd fa sd f asdfasdfasdf asd afs df a sd f  sdfasd fa s df a sdf asdfa");
    for (int i = 0; i < 40; i++) {
      _contenutoTest.AddRisposta("Risposta ${i + 1}", 0);
    }
    _contenutoTest.AddRisposta("Risposta ok", 1);
  }


  void SetRisposta(index, value) {
    _risposte[index] = value;
    debugPrint("SetRisposta");
  }

  bool GetRisposta(index) {
    return _risposte[index];
  }

  TestElement getContenutoTest() => _contenutoTest;
}



import 'package:flutter/material.dart';
import 'package:letsdotest/models/test_element.dart';

class SingleTest {
  String _name = "";
  TestElement contenutoTest;

  var _risposte = new List.filled(1000, false);


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

  void SetRisposta(index, value) {
    _risposte[index] = value;
    debugPrint("SetRisposta");
  }

  bool GetRisposta(index) {
    return _risposte[index];
  }

}



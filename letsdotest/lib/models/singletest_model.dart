import 'package:flutter/material.dart';
import 'package:letsdotest/models/test_element.dart';

class SingleTest {
  String _name = "";
  String _description = "";
  String _filepath = "";

  List<SingleTestPage> _domandeTest = [];

  SingleTest(this._name, this._description, this._filepath) {

/*
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());
    AddDomanda(SingleTestPage());

 */
  }

    void AddDomanda(SingleTestPage testPage) {
    _domandeTest.add(testPage);
  }

  String get name => _name;
  String get description => _description;
  String get filepath => _filepath;

  void set name(String valore) {
    _name = valore;
  }

  void set description(String valore) {
    _description = valore;
  }

  void set filepath(String valore) {
    _filepath = valore;
  }

  SingleTestPage getDomanda(int index) => _domandeTest[index];

  int getNumDomande() => _domandeTest.length;

  void ClearTest() {
    _name = "";
    _description = "";
    _filepath = "";
    _domandeTest.clear();

  }

}

class SingleTestPage {
  TestElement _contenutoTest;

  var _risposte = new List.filled(1000, false);


  SingleTestPage(String titolo, String descrizione) {
    _contenutoTest = new TestElement(titolo, descrizione);
    /*
      _contenutoTest = new TestElement("titolo",
        "domanda asdf as df asd fa sd fa sd fa sd f asdfasdfasdf asd afs df a sd f  sdfasd fa s df a sdf asdfa");

     */
    /*
    for (int i = 0; i < 40; i++) {
      _contenutoTest.AddRisposta("Risposta ${i + 1}", 0);
    }
    _contenutoTest.AddRisposta("Risposta ok", 1);

     */
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



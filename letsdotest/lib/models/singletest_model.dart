
import 'package:flutter/material.dart';
import 'package:letsdotest/models/test_element.dart';

class SingleTest  {
  String _name = "";
  String _description = "";
  String _filepath = "";

  List<SingleTestPage> _domandeTest = [];

  SingleTest(this._name, this._description, this._filepath) {
    debugPrint("SingleTest: SingleTest ${name},  ${description},  ${filepath}");

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
    debugPrint("SingleTest: set name ${_name} => ${valore}");
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
    _name = "a";
    _description = "";
    _filepath = "";
    _domandeTest.clear();

  }

  bool getRisposta(index, numDomanda) {
    return getDomanda(numDomanda).GetRisposta(index);
  }

  void setRisposta(index, numDomanda, value) {
    getDomanda(numDomanda).SetRisposta(index, value);
    debugPrint("Singletest: setRisposta");
    // notifyListeners();
  }
/*
  @override
  bool operator ==(Object other) {
    int i;
    for (i = 0; i < _domandeTest.length; i++) {
      if (_domandeTest[i] == other[i]);
    }
  }
  */

}

class SingleTestPage {
  TestElement _contenutoTest;

  // var _risposte = new List.filled(1000, false);
  var _risposte = [];


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

  void AddRispostaToPage(String testorisposta, String valorerisposta) {
    _contenutoTest.AddRisposta(testorisposta, double.parse(valorerisposta));
    debugPrint("SingleTestPage:AddRispostaToPage");
    _risposte.add(false);
  }

  void SetRisposta(index, value) {
    // Se può essere una sola tolgo le altre prima di impostarla
    if (_contenutoTest.tipoRipostaAmmessa == TipoRipostaAmmessa.checkSingle) {
      for (int i = 0; i < _risposte.length; i++) {
        _risposte[index] = false;
      }
    }
    _risposte[index] = value;
    debugPrint("SetRisposta");
  }

  bool GetRisposta(index) {
    return _risposte[index];
  }

  double GetPunteggio()  {
    int i;
    double punteggio = 0;

    for (i = 0; i < _risposte.length; i++) {
      if (_risposte[i] == true) {
        punteggio = punteggio + _contenutoTest.getRisposta(i).valoreRisposta;
      }
    }
    return punteggio;
  }

  double GetPunteggioMassimo()  {
    int i;
    double punteggio = 0;

    for (i = 0; i < _risposte.length; i++) {
      punteggio = punteggio + _contenutoTest.getRisposta(i).valoreRisposta;
    }
    return punteggio;
  }

  TestElement getContenutoTest() => _contenutoTest;
}



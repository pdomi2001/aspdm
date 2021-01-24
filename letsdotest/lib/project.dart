

import 'package:flutter/cupertino.dart';

class SingleTest {
  String _name = "";

  SingleTest(String titolo) {
    _name = titolo;
  }

  String get name => _name;

  void set name(String valore) {
    _name = valore;
  }
}

class Project extends ChangeNotifier {
  List<SingleTest> _elencoProgetti = [];

  Project() {
    debugPrint("Creazione Project");
    /* */
    _elencoProgetti.add(SingleTest("Test inglese"));
    _elencoProgetti.add(SingleTest("Test Francese"));
    _elencoProgetti.add(SingleTest("Test Tedesco"));
    _elencoProgetti.add(SingleTest("Test Spagnolo"));

    /* */
    debugPrint("Fine Creazione Project");
  }

  SingleTest getTest(int idx) {
    return _elencoProgetti[idx];
  }

  void setTestName(int idx, String newname) {
    _elencoProgetti[idx].name = newname;
    notifyListeners();
  }

  int getNumTests() {
    return _elencoProgetti.length;
  }

  void addTest(){
    _elencoProgetti.add(SingleTest("Test Nuovo"));
  }
}

import 'package:flutter/material.dart';
import 'singletest_model.dart';

class Project extends ChangeNotifier {
  int _currentSelectedProject = 0;

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

  SingleTest getCurrentTest() {
    return _elencoProgetti[_currentSelectedProject];
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

  void setCurrentTestIdx(int idx) {
    _currentSelectedProject = idx;
  }

  int getCurrentTestIdx() {
    return _currentSelectedProject;
  }

  bool getCurrentTestRisposta(index, numDomanda) {
    return getCurrentTest().getDomanda(numDomanda).GetRisposta(index);
  }

  void setCurrentTestRisposta(index, numDomanda, value) {
    getCurrentTest().getDomanda(numDomanda).SetRisposta(index, value);
    notifyListeners();
  }
}


import 'dart:math';

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

class Project {
  int _numTests = 0;

  List<SingleTest> _elencoProgetti = new List<SingleTest>();

  Project() {
    _elencoProgetti.add(SingleTest("Test inglese"));
    _elencoProgetti.add(SingleTest("Test Francese"));
    _elencoProgetti.add(SingleTest("Test Tedesco"));
    _elencoProgetti.add(SingleTest("Test Spagnolo"));
  }

  SingleTest getTest(int idx) {
    return _elencoProgetti[idx];
  }

  int getNumTests() {
    return _numTests;
  }
}
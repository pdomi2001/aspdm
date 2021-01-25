
class TestElementRisposta {
  final String risposta;
  final double valoreRisposta;

  TestElementRisposta(this.risposta, this.valoreRisposta);
}

class TestElement {
  final String titolo;
  final String domanda;

  List<TestElementRisposta> _risposte = [];

  TestElement(this.titolo, this.domanda);

  void AddRisposta(String testoRisposta, double valoreRisposta) {
    _risposte.add(TestElementRisposta(testoRisposta, valoreRisposta));
  }

  TestElementRisposta getRisposta(int index) {
    return _risposte[index];
  }

  int getNumRisposte() {
    return _risposte.length;
  }
}

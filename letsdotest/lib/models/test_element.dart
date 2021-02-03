
class TestElementRisposta {
  final String risposta;
  final double valoreRisposta;

  TestElementRisposta(this.risposta, this.valoreRisposta);
}

enum TipoRipostaAmmessa { checkSingle, checkMultiple }

class TestElement {
  final String titolo;
  final String domanda;
  final TipoRipostaAmmessa tipoRipostaAmmessa;

  List<TestElementRisposta> _risposte = [];

  TestElement(this.titolo, this.domanda, {this.tipoRipostaAmmessa = TipoRipostaAmmessa.checkSingle});

  void AddRisposta(String testoRisposta, double valoreRisposta) {
    _risposte.add(TestElementRisposta(testoRisposta, valoreRisposta));
  }

  TestElementRisposta getRisposta(int index) => _risposte[index];

  int getNumRisposte() => _risposte.length;

  TipoRipostaAmmessa GetTipoRispostaAmessa() => tipoRipostaAmmessa;
}

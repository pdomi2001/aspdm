import 'package:flutter/material.dart';
import 'package:letsdotest/models/project.dart';
import 'package:letsdotest/models/singletest_model.dart';
import 'package:provider/provider.dart';

class SingleTestWidget extends StatefulWidget {
  final int _pagina;

  SingleTestWidget(this._pagina);

  int getPagina() => _pagina;

  @override
  _SingleTestWidgetState createState() => _SingleTestWidgetState();
}

class _SingleTestWidgetState extends State<SingleTestWidget> {
  @override
  Widget build(BuildContext context0) {
    final int pagina = widget.getPagina();
    debugPrint("Creating pagina ${pagina}");
    return Selector<Project, SingleTest>(
      selector: (buildContext, _) => context.watch<Project>().getCurrentTest(),
      builder: (context, currentTest, child) {
        debugPrint(
            "Numero risposte: ${currentTest.getDomanda(pagina).getContenutoTest().getNumRisposte()}");
        debugPrint("Domanda: ${currentTest.getDomanda(pagina).getContenutoTest().domanda}");
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text("Pagina ${pagina + 1}/ ${currentTest.getNumDomande()}"),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)),
                      ]),
                  // color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${currentTest.getDomanda(pagina).getContenutoTest().domanda}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                  )),
            ),
            const Divider(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: currentTest.getDomanda(pagina).getContenutoTest().getNumRisposte(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                          value: context.watch<Project>().getCurrentTest().getRisposta(index, pagina),
                          /* currentTest.getRisposta(index, pagina), */
                          onChanged: (bool newValue) {
                            currentTest.setRisposta(index, pagina, newValue);
                            // prj.getCurrentTest().SetRisposta(index, newValue);
                            debugPrint(
                                "Changed checkbox ${index} to ${newValue}");
                            // notifyListeners();
                            setState(() {

                            });
                          }),
                      Text(
                          "${currentTest.getDomanda(pagina).getContenutoTest().getRisposta(index).risposta}"),
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

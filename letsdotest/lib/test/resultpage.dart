import 'package:flutter/material.dart';
import 'package:letsdotest/models/project.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                  child: Text("Risultati del test", textScaleFactor: 2.0,)),
              Divider(
                color: Colors.grey,
              ),
              Expanded(
                  child: Text("Il punteggio ottenuto è ${context.read<Project>().getPunteggioTest()}/${context.read<Project>().getPUnteggioMassimoTest()}")),
              ElevatedButton(onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
                  child: Text("Esci dal test"))

            ],
          ),
      )

    );
  }
}

import 'package:flutter/material.dart';

class  AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("About",
              style: TextStyle(fontSize: 28, color: Colors.blue),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: "Let's do test",
                      style: TextStyle(color: Colors.black, fontSize: 24, fontStyle: FontStyle.italic),
                    children: <TextSpan> [
                      TextSpan(
                        text: " è un programma per lo svolgimento di test sul cellulare. Sviluppato per l'esame di ASPDM del corso di Laurea Magistrale in Informatica Applicata.",
                        style: TextStyle(color: Colors.black54)),

                    ]
                  ),
              ),
            ),
            ElevatedButton(
              child: Text("Chiudi"),
              onPressed: () {
                // Navigator.pushNamed(context, '/');
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            )
          ],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WaitForTest extends StatefulWidget {
  @override
  _WaitForTestState createState() => _WaitForTestState();
}

class _WaitForTestState extends State<WaitForTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Center(child: Text("In attesa che venga attivato il test dall'insegnante..."))),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text("Torna indietro"),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

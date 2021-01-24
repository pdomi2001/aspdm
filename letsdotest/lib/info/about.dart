import 'package:flutter/material.dart';

class  AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("About dell'applicazione"),
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

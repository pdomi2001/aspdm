import 'dart:html';

import 'package:flutter/material.dart';

class  AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("About Data dl'applicazione"),
            ElevatedButton(
              child: Text("Chiudi"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ),
    );
  }
}

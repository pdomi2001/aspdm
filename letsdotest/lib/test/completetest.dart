import 'package:flutter/material.dart';
import 'singletest.dart';

class CompleteTest extends StatefulWidget {
  @override
  _CompleteTestState createState() => _CompleteTestState();
}

class _CompleteTestState extends State<CompleteTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("Esecuzione test completo"),
            ),

            Expanded(
              child: Container(
                child: SingleTestWidget(),
              ),
            ),
            Container(
              child: Text("Footer"),
            )
          ],
        ),
      ),
    );
  }
}

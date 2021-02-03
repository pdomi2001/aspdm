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
                padding: EdgeInsets.all(8),
                child: SingleTestWidget(),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.arrow_back, size: 32)),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Consegna test",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                //backgroundColor: Colors.yellow,
                                color: Colors.yellow),
                          ))),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {

                          },
                          child: Icon(Icons.arrow_forward, size: 32)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

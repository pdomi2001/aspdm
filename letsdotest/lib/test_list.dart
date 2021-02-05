import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/project.dart';

// Valutare se serve ancora

class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  List<String> oggetti = [
    "primo",
    "secondo",
    "terzo",
    "quarto"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*
        Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text("Elemento "+ oggetti[index]);
              },
              itemCount: oggetti.length,
            )
        ),
        */
        //Text("Ci sono" + oggetti.length.toString()),
        Text("Ci sono ${context.watch<Project>().getNumTests()}" )
      ],
    );
  }
}

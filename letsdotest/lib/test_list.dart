import 'package:flutter/material.dart';
import 'package:letsdotest/project.dart';

class TestList extends StatefulWidget {
  Project myproject;


  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Linea1'),
        Text('Linea2'),
        Text('Linea3'),
        Text('Linea5'),
      ],
    );
  }
}

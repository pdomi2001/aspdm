import 'package:flutter/material.dart';
import 'package:letsdotest/project.dart';
import 'package:provider/provider.dart';

class SingleTest {
  String _name = "";

  SingleTest(String titolo) {
    _name = titolo;
  }

  String get name => _name;

  void set name(String valore) {
    _name = valore;
  }
}

class SingleTestWidget extends StatefulWidget {
  int livello;

  @override
  _SingleTestWidgetState createState() => _SingleTestWidgetState();
}

class _SingleTestWidgetState extends State<SingleTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Project>(
      builder: (context, prj, child) {
        return ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Text("linea ${index} ${prj.getTest(prj.getCurrentTestIdx()).name}");
          },
        );
      },
    );
  }
}

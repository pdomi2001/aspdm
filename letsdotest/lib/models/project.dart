import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letsdotest/models/prj_import.dart';
import 'singletest_model.dart';
import 'package:http/http.dart' as http;

class Project extends ChangeNotifier {
  int _currentSelectedProject = 0;

  List<SingleTest> _elencoProgetti = [];

  Project() {
    debugPrint("Creazione Project");
    /* * /
    _elencoProgetti.add(SingleTest("Test inglese"));
    _elencoProgetti.add(SingleTest("Test Francese"));
    _elencoProgetti.add(SingleTest("Test Tedesco"));
    _elencoProgetti.add(SingleTest("Test Spagnolo"));

    / * */
    debugPrint("Fine Creazione Project");
  }

  ProjectImportList CaricaElencoProgetti(ProjectImportList prjList) {
    int i;

    for (i = 0; i < prjList.elements.length; i++) {
      _elencoProgetti.add(SingleTest(prjList.elements[i].name, prjList.elements[i].description, prjList.elements[i].filepath));
    }
    return(prjList);
  }

  SingleTest getTest(int idx) {
    return _elencoProgetti[idx];
  }

  SingleTest getCurrentTest() {
    return _elencoProgetti[_currentSelectedProject];
  }

  void setTestName(int idx, String newname) {
    _elencoProgetti[idx].name = newname;
    notifyListeners();
  }

  int getNumTests() {
    return _elencoProgetti.length;
  }

  void addTest(){
    _elencoProgetti.add(SingleTest("Test Nuovo", "descrizione", ""));
  }

  void setCurrentTestIdx(int idx) {
    _currentSelectedProject = idx;
  }

  int getCurrentTestIdx() {
    return _currentSelectedProject;
  }

  bool getCurrentTestRisposta(index, numDomanda) {
    return getCurrentTest().getDomanda(numDomanda).GetRisposta(index);
  }

  void setCurrentTestRisposta(index, numDomanda, value) {
    getCurrentTest().getDomanda(numDomanda).SetRisposta(index, value);
    notifyListeners();
  }

  Future<ProjectImportList> LoadProjectsFromWeb() async {
    debugPrint("Carico l'elenco dei progetti dal web");
    final response =  await http.get('https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/test_list.json',
        headers: { HttpHeaders.acceptHeader: 'application/json'} );
    debugPrint("GET Project List ${response.statusCode}");
    if (response.statusCode == 200) {
      debugPrint("Inizio la decodifica di json");

      List<dynamic> jsonProjectList = jsonDecode(response.body);
      debugPrint("json decodificato");

      final List<ProjectImportElement> projectList = jsonProjectList.cast<Map<String, dynamic>>().map(
          (val) => ProjectImportElement.fromJson(val)
      ).toList();
      // notifyListeners();
      debugPrint("Lista convertita");
      return CaricaElencoProgetti(ProjectImportList(projectList));

    } else {

    }
  }
}

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

    _elencoProgetti.clear();
    for (i = 0; i < prjList.elements.length; i++) {
      _elencoProgetti.add(SingleTest(prjList.elements[i].name, prjList.elements[i].description, prjList.elements[i].filepath));
    }
    return(prjList);
  }

  ProjectImport CaricaDatiProgetto(ProjectImport prjData) {
    SingleTest test = getCurrentTest();

    int i;

    test.ClearTest();
    for (i = 0; i < prjData.elements.length; i++) {
      test.AddDomanda(SingleTestPage(prjData.elements[i].titolo, prjData.elements[i].question));
      // qui vanno aggiunte le risposte per ogni domanda
    }
    return(prjData);
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

  // carico la lista dei progetti dal web
  Future<ProjectImportList> LoadProjectListFromWeb() async {
    debugPrint("Carico l'elenco dei progetti dal web");
    final response =  await http.get('https://raw.githubusercontent.com/pdomi2001/aspdm/main/resources/test_list.json',
        headers: { HttpHeaders.acceptHeader: 'application/json'} );
    debugPrint("GET Project List ${response.statusCode}");
    if (response.statusCode == 200) {
      debugPrint("LoadProjectListFromWeb:Inizio la decodifica di json");

      List<dynamic> jsonProjectList = jsonDecode(response.body);
      debugPrint("LoadProjectListFromWeb:json decodificato");

      final List<ProjectListImportElement> projectList = jsonProjectList.cast<Map<String, dynamic>>().map(
          (val) => ProjectListImportElement.fromJson(val)
      ).toList();
      // notifyListeners();
      debugPrint("Lista convertita");
      return CaricaElencoProgetti(ProjectImportList(projectList));

    } else {

    }
  }


  // carico il singolo progetto dal web
  Future<ProjectImport> LoadProjectFromWeb() async {
    debugPrint("Carico il progetto corrente dal web: ${getCurrentTest().filepath}");
    final response =  await http.get(getCurrentTest().filepath,
        headers: { HttpHeaders.acceptHeader: 'application/json'} );
    debugPrint("GET Project response: ${response.statusCode}");
    if (response.statusCode == 200) {
      debugPrint("LoadProjectFromWeb:Inizio la decodifica di json");

      // ??????????
      List<dynamic> jsonProjectElements = jsonDecode(response.body);
      debugPrint("LoadProjectFromWeb:json decodificato");
      debugPrint("LoadProjectFromWeb:json content ${jsonProjectElements}");

      final List<ProjectImportElement> projectList = jsonProjectElements.cast<Map<String, dynamic>>().map(
          (val) => ProjectImportElement.fromJson(val)
      ).toList();
      // notifyListeners();
      debugPrint("LoadProjectFromWeb:Lista convertita");
      return CaricaDatiProgetto(ProjectImport(projectList));

    } else {

    }
  }
}

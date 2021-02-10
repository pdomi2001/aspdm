import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


// Lista dei progetti dei test
class ProjectListImportElement extends Equatable {
  ProjectListImportElement(this.name, this.description, this.filepath);

  final String name;
  final String description;
  final String filepath;

  ProjectListImportElement.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    description = json['description'],
    filepath = json['filepath'] {
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'filepath': filepath
  };

  @override
  List<Object> get props => [name, description];
}

class ProjectImportList {
  bool loaded = false;

  ProjectImportList(this._elements);

  List<ProjectListImportElement> _elements = [];

  List<ProjectListImportElement> get elements => _elements;

}


// Singola Pagina del test completo
class ProjectImportElement extends Equatable {
  ProjectImportElement(this.titolo, this.question);

  final String titolo;
  final String question;
  dynamic  _json_answers;
  //List <Map<String, List<Map<String, String>>>> answers;
  List<ProjectAnswer> _domande = [];


  ProjectImportElement.fromJson(Map<String, dynamic> json) :
        titolo = json['title'],
        question = json['question'],
        _json_answers = json['answers'] {
          // debugPrint("ProjectImportElement2: answers=${_json_answers}");
          String _json_answers_string = jsonEncode(_json_answers);
          // debugPrint("ProjectImportElement2: _json_answers_string=${_json_answers_string}");

          List<dynamic> jsonProjectAnswers = jsonDecode(_json_answers_string);
          // debugPrint("ProjectImportElement: json decodificato ${jsonProjectAnswers}");

          final List<ProjectImportAnswer> projectContentAnswer = jsonProjectAnswers.cast<Map<String, dynamic>>().map(
                  (val) => ProjectImportAnswer.fromJson(val)
          ).toList();

          int i;

          for (i = 0; i < projectContentAnswer.length; i++) {
            _domande.add(ProjectAnswer(projectContentAnswer[i].getText(), projectContentAnswer[i].getValue()));
          }
  }

  int getNumDomande() =>_domande.length;

  ProjectAnswer getDomanda(int idx) => _domande[idx];

  Map<String, dynamic> toJson() => {
    'title': titolo,
    'question': question,
    'answers': _domande
    // qui va la conversione nell'altro senso
  };

  @override
  List<Object> get props => [titolo, question, _domande];
}

class ProjectImport {
  ProjectImport(this._elements);

  List<ProjectImportElement> _elements = [];

  List<ProjectImportElement> get elements => _elements;

}

// Conversione delle singole risposte del test
class ProjectImportAnswer extends Equatable {
  ProjectImportAnswer(this.text, this.value);

  final String text;
  final String value;

  ProjectImportAnswer.fromJson(Map<String, dynamic> json) :
        text = json['text'],
        value = json['value'] {
    // debugPrint("ProjectImportElement: json=${json}");
    debugPrint("ProjectImportAnswer: text=${text} value=${value}");
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'value': value
  };

  String getText() {
    return text;
  }

  String getValue() {
    return value;
  }

  @override
  List<Object> get props => [text, value];

}

class ProjectImportAnswers {
  ProjectImportAnswers(this._elements);

  List<ProjectImportAnswer> _elements = [];

  List<ProjectImportAnswer> get elements => _elements;

}

class ProjectAnswer {
  final String testo;
  final String valore;

  ProjectAnswer(this.testo, this.valore);
}


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  ProjectImportList(this._elements);

  List<ProjectListImportElement> _elements = [];

  List<ProjectListImportElement> get elements => _elements;

}




class ProjectImportElement extends Equatable {
  ProjectImportElement(this.titolo, this.question, this.answers);

  final String titolo;
  final String question;
  final String answers;
  // List<Map<String, List<Map<String, String>>>> answers;

  ProjectImportElement.fromJson(Map<String, dynamic> json) :
        titolo = json['title'],
        question = json['question'],
        answers = json['answers'] {
          debugPrint("ProjectImportElement: json=${json}");
  }

  Map<String, dynamic> toJson() => {
    'title': titolo,
    'question': question,
    'answers': answers
  };


  @override
  List<Object> get props => [titolo, question];
}

class ProjectImport {
  ProjectImport(this._elements);

  List<ProjectImportElement> _elements = [];

  List<ProjectImportElement> get elements => _elements;

}
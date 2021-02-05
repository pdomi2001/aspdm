import 'package:equatable/equatable.dart';

class ProjectImportElement extends Equatable {
  ProjectImportElement(this.name, this.description, this.filepath);

  final String name;
  final String description;
  final String filepath;

  ProjectImportElement.fromJson(Map<String, dynamic> json) :
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

  List<ProjectImportElement> _elements = [];

  List<ProjectImportElement> get elements => _elements;

}
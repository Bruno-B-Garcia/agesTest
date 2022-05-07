import 'dart:convert';

import 'package:diario_das_emocoes/shared/models/student.model.dart';

class TurmaModel {
  final String? id;
  final String name;
  final String code;
  // final List<String> emails;
  final List<dynamic> emails;
  final String teacherReference;
  final int year;
  // final List<StudentModel> students;
  final List<dynamic> students;

  TurmaModel(
      {this.id,
      required this.name,
      required this.code,
      required this.emails,
      required this.teacherReference,
      required this.year,
      required this.students});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'emails': emails,
      'teacherReference': teacherReference,
      'year': year,
      'students': students
    };
  }

  factory TurmaModel.fromMap(Map<String, dynamic> map) {
    return TurmaModel(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      emails: map['emails'],
      teacherReference: map['teacherReference'],
      year: map['year'],
      students: map['students'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Nome: $name id: $id code: $code emails: $emails professor: $teacherReference ano: $year alunos: $students';
  }
}

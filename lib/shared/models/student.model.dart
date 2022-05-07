import 'dart:convert';

import 'package:diario_das_emocoes/shared/models/quiz.model.dart';

class StudentModel {
  final String? id;
  final String name;
  final String idTurma;
  // final List<QuizModel> quizzes;
  final List<dynamic> quizzes;

  StudentModel(
      {this.id,
      required this.name,
      required this.idTurma,
      required this.quizzes});

  Map<String, dynamic> toMap() {
    return {
      'id': id ?? Null,
      'name': name,
      'idTurma': idTurma,
      'quizzes': quizzes,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] ?? Null,
      name: map['name'],
      idTurma: map['idTurma'],
      quizzes: map['quizzes'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Name: $name id: $id idTurma $idTurma quiz: $quizzes';
  }
}

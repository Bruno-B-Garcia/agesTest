import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_das_emocoes/shared/models/student.model.dart';

class StudentListRepository {
  final CollectionReference _student =
      FirebaseFirestore.instance.collection('alunos');

  Future<List<StudentModel>> getStudents() async =>
      await _student.get().then((students) => students.docs
          .map((e) => StudentModel.fromMap(e.data() as Map<String, dynamic>))
          .toList());
}

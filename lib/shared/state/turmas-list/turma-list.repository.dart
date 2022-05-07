import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diario_das_emocoes/shared/models/turma.model.dart';

class TurmaListRepository {
  final CollectionReference _turma =
      FirebaseFirestore.instance.collection('turmas');

  Future<List<TurmaModel>> getTurmas() async =>
      await _turma.get().then((turmas) => turmas.docs
          .map((e) => TurmaModel.fromMap(e.data() as Map<String, dynamic>))
          .toList());
}

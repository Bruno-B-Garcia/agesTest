import 'package:diario_das_emocoes/shared/state/turmas-list/turma-list.controller.dart';

class QrcodeRepository {
  TurmaListController turmas = TurmaListController();

  bool exists(String? id) {
    late bool response = false;
    for (var turma in turmas.list) {
      if (turma.name == id) {
        response = true;
      }
    }
    return response;
  }
}

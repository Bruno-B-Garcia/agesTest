import '../../shared/state/turmas-list/turma-list.controller.dart';

class LoginRepository {
  TurmaListController turmas = TurmaListController();

  bool exists(String? id) {
    late bool response = false;
    for (var turma in turmas.list) {
      if (turma.name.toLowerCase() == id!.toLowerCase()) {
        response = true;
      }
    }
    return response;
  }
}

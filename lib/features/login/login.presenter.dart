import 'package:diario_das_emocoes/features/login/login.repository.dart';
import 'package:diario_das_emocoes/shared/models/turma.model.dart';
import 'package:flutter/material.dart';

class LoginPresenter extends ChangeNotifier {
  final LoginRepository _repository = LoginRepository();

  late TurmaModel _turma;
  late bool _hasValidToken = false;
  late bool _isAdmin = false;

  TurmaModel get turma => _turma;
  bool get hasValidToken => _hasValidToken;
  bool get isAdmin => _isAdmin;

  void setIsAdmin(bool value) {
    _isAdmin = value;
    notifyListeners();
  }

  void setHasValidToken(bool value) {
    _hasValidToken = value;
    notifyListeners();
  }

  void checkToken(String token) {
    if (token == "admin") {
      _isAdmin = true;
      notifyListeners();
    } else {
      if (token.length > 4) {
        _hasValidToken = _repository.exists(token);
        notifyListeners();
      }
    }
  }
}

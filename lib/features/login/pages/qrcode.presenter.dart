import 'dart:developer';

import 'package:diario_das_emocoes/features/login/pages/qrcode-enum.state.dart';
import 'package:diario_das_emocoes/features/login/pages/qrcode.repository.dart';
import 'package:flutter/material.dart';

class QrcodePresenter extends ChangeNotifier {
  final QrcodeRepository _repository = QrcodeRepository();

  var _state = QrcodeLoginState.idle;
  late final bool _turma;

  bool get turma => _turma;
  QrcodeLoginState get state => _state;

  void logIn(String turmaId) async {
    _turma = _repository.exists(turmaId);
    notifyListeners();

    if (turma) {
      log("\n\nSUCESSO\n\n");
      _state = QrcodeLoginState.success;
      notifyListeners();
    } else {
      log("\n\nFALHAAAA\n\n");
      _state = QrcodeLoginState.error;
      notifyListeners();
    }
  }
}

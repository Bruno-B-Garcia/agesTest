import 'dart:async';

import 'package:diario_das_emocoes/shared/models/turma.model.dart';
import 'package:diario_das_emocoes/shared/state-enum/state.enum.dart';
import 'package:flutter/material.dart';

import 'turma-list.repository.dart';

class TurmaListController extends ChangeNotifier {
  final TurmaListRepository _repository = TurmaListRepository();

  var _state = StateEnum.idle;
  List<TurmaModel> _list = [];
  List<TurmaModel> _filteredList = [];

  TurmaListController() {
    getTurmas();
  }

  List<TurmaModel> get list => _list;
  List<TurmaModel> get filteredList => _filteredList;
  StateEnum get state => _state;

  void getTurmas() async {
    _state = StateEnum.loading;
    notifyListeners();

    _list = await _repository.getTurmas();
    notifyListeners();

    Timer(const Duration(seconds: 2), () {
      // ignore: unnecessary_null_comparison
      if (_filteredList != null) {
        _state = StateEnum.success;
        notifyListeners();
      } else {
        _state = StateEnum.error;
        notifyListeners();
      }
    });

    // ignore: unnecessary_null_comparison
    // if (_list != null) {
    //   _state = StateEnum.success;
    //   notifyListeners();
    // } else {
    //   _state = StateEnum.error;
    //   notifyListeners();
    // }
  }

  void filterListByStudentName(String name) {
    _state = StateEnum.loading;
    notifyListeners();

    _filteredList = _list
        .where((element) =>
            element.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();

    Timer(const Duration(seconds: 2), () {
      // ignore: unnecessary_null_comparison
      if (_filteredList != null) {
        _state = StateEnum.success;
        notifyListeners();
      } else {
        _state = StateEnum.error;
        notifyListeners();
      }
    });
    // if (_filteredList != null) {
    //   _state = StateEnum.success;
    //   notifyListeners();
    // } else {
    //   _state = StateEnum.error;
    //   notifyListeners();
    // }
  }
}

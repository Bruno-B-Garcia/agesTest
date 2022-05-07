import 'dart:async';

import 'package:diario_das_emocoes/shared/models/student.model.dart';
import 'package:diario_das_emocoes/shared/state-enum/state.enum.dart';
import 'package:diario_das_emocoes/shared/state/student-list/student-list.repository.dart';
import 'package:flutter/material.dart';

class StudentListController extends ChangeNotifier {
  final StudentListRepository _repository = StudentListRepository();

  var _state = StateEnum.idle;
  List<StudentModel> _list = [];
  List<StudentModel> _filteredList = [];

  StudentListController() {
    getStudent();
  }

  List<StudentModel> get list => _list;
  List<StudentModel> get filteredList => _filteredList;
  StateEnum get state => _state;

  void getStudent() async {
    _state = StateEnum.loading;
    notifyListeners();

    _list = await _repository.getStudents();
    _filteredList = _list;
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

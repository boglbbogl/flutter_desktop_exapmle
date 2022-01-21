import 'package:flutter/material.dart';
import 'package:flutter_desktop_exapmle/logger.dart';
import 'package:flutter_desktop_exapmle/model/person.dart';
import 'package:hive/hive.dart';

class PersonProvider extends ChangeNotifier {
  final String _name = "";
  final int _position = 1;
  final String _store = "";
  bool _isSavedLoading = false;

  void savedPerson() {
    _isSavedLoading = true;
    notifyListeners();
    final _box = Hive.box('PERSON');
    _box.add(Person(_name, _position, _store));
    _isSavedLoading = false;
    notifyListeners();
  }

  void getName({
    required String value,
  }) {}
  void getPosition({
    required int value,
  }) {}
  void getStore({
    required String value,
  }) {}

  String get name => _name;
  int get position => _position;
  String get store => _store;
  bool get isSavedLoading => _isSavedLoading;
}
